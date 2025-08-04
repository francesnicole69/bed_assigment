// Use Geolocation API and Leaflet to show a real map with a marker at the user's location and hospital markers
window.addEventListener('DOMContentLoaded', () => {
  const mapDiv = document.getElementById('map-placeholder');
  mapDiv.style.height = '320px';
  mapDiv.style.width = '100%';
  mapDiv.style.borderRadius = '16px';
  mapDiv.style.overflow = 'hidden';

  // Load Leaflet CSS
  const leafletCSS = document.createElement('link');
  leafletCSS.rel = 'stylesheet';
  leafletCSS.href = 'https://unpkg.com/leaflet@1.9.4/dist/leaflet.css';
  document.head.appendChild(leafletCSS);

  // Load Leaflet JS
  const leafletScript = document.createElement('script');
  leafletScript.src = 'https://unpkg.com/leaflet@1.9.4/dist/leaflet.js';
  leafletScript.onload = () => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        async (position) => {
          const { latitude, longitude } = position.coords;
          // Store user location globally for Directions button
          window.__userLatLng = latitude + ',' + longitude;
          // Initialize map with more freedom
          const map = L.map('map-placeholder', {
            worldCopyJump: true,
            minZoom: 1
          }).setView([latitude, longitude], 13);
          L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '© OpenStreetMap'
          }).addTo(map);
          // Add user marker
          const userMarker = L.marker([latitude, longitude]).addTo(map);
          userMarker.bindPopup('You are here!').openPopup();

          // Fetch hospitals from API, calculate distance, and display nearest 4 with routing info
          try {
            const res = await fetch('http://localhost:3000/hospitals');
            let hospitals = await res.json();
            // Calculate distance to user for each hospital (Haversine)
            hospitals = hospitals.map(hospital => {
              if (hospital.Latitude && hospital.Longitude) {
                const toRad = deg => deg * Math.PI / 180;
                const R = 6371; // km
                const dLat = toRad(hospital.Latitude - latitude);
                const dLon = toRad(hospital.Longitude - longitude);
                const lat1 = toRad(latitude);
                const lat2 = toRad(hospital.Latitude);
                const a = Math.sin(dLat/2) * Math.sin(dLat/2) +
                          Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2);
                const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
                hospital.distance = R * c;
              } else {
                hospital.distance = Infinity;
              }
              return hospital;
            });
            // Remove duplicates by Name and Address
            const seen = new Set();
            const uniqueHospitals = hospitals.filter(hospital => {
              const key = (hospital.Name || '') + '|' + (hospital.Address || '');
              if (seen.has(key)) return false;
              seen.add(key);
              return true;
            });
            // Sort by distance and take 4 nearest
            const nearest = uniqueHospitals.sort((a, b) => a.distance - b.distance).slice(0, 4);

            // Add markers for all hospitals
            hospitals.forEach(hospital => {
              if (hospital.Latitude && hospital.Longitude) {
                const marker = L.marker([hospital.Latitude, hospital.Longitude]).addTo(map);
                marker.bindPopup(`<b>${hospital.Name}</b><br>${hospital.Address}<br>${hospital.Phone || ''}`);
              }
            });

            // Fetch route info for each nearest hospital
            const apiKey = 'eyJvcmciOiI1YjNjZTM1OTc4NTExMTAwMDFjZjYyNDgiLCJpZCI6IjZkYjBiOGMwNzZmMzQ2ZTY4ZDhkYTljMjIxNmMzMTcxIiwiaCI6Im11cm11cjY0In0=';
            const travelMode = 'driving-car'; // can be 'driving-car', 'cycling-regular', 'foot-walking', etc.
            // Store route data for each hospital
            for (let hospital of nearest) {
              if (hospital.Latitude && hospital.Longitude) {
                try {
                  const url = `https://api.openrouteservice.org/v2/directions/${travelMode}?api_key=${apiKey}`;
                  const body = JSON.stringify({
                    coordinates: [
                      [longitude, latitude],
                      [hospital.Longitude, hospital.Latitude]
                    ]
                  });
                  const routeRes = await fetch(url, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body
                  });
                  if (routeRes.ok) {
                    const routeData = await routeRes.json();
                    const summary = routeData.features[0].properties.summary;
                    hospital.routeDistance = summary.distance / 1000; // km
                    hospital.routeDuration = summary.duration / 60; // min
                    hospital.routeGeometry = routeData.features[0].geometry;
                  } else {
                    hospital.routeDistance = hospital.distance;
                    hospital.routeDuration = null;
                  }
                } catch (e) {
                  hospital.routeDistance = hospital.distance;
                  hospital.routeDuration = null;
                }
              }
            }

            // Render nearest 4 in the hospital-list
            const hospitalList = document.querySelector('.hospital-list');
            hospitalList.innerHTML = `
              <div class="hospital-header">
                <h2>Hospitals Near You</h2>
                <button class="btn-add-hospital" onclick="window.location.href='createhospital.html'">
                  ➕ Add New Hospital
                </button>
              </div>
            ` + nearest.map((hospital, idx) => `
              <div class="hospital-card">
                <div class="card-content">
                  <div>
                    <h3>${hospital.Name}</h3>
                    <p class="address">${hospital.Address}</p>
                    <p class="timing">Open: ${hospital.OpeningHours || 'N/A'}</p>
                    <div class="actions">
                      <button class="btn direction" data-hospital-idx="${idx}">Directions</button>
                      <button class="btn delete" data-hospital-id="${hospital.HospitalID}">Delete</button>
                    </div>
                  </div>
                  <div class="distance">${hospital.routeDistance !== undefined ? hospital.routeDistance.toFixed(2) + ' km' : (hospital.distance !== Infinity ? hospital.distance.toFixed(2) + ' km' : 'N/A')}</div>
                  <div class="distance" style="font-size:0.95rem; color:#007bff;">${hospital.routeDuration !== null && hospital.routeDuration !== undefined ? Math.round(hospital.routeDuration) + ' min (fastest)' : ''}</div>
                </div>
              </div>
            `).join('');

            // Draw route on map when Directions is clicked
            let routeLayer = null;
            hospitalList.querySelectorAll('.btn.direction').forEach((btn, idx) => {
              btn.addEventListener('click', () => {
                // Open directions.html with user and hospital info as URL params
                const hospital = nearest[idx];
                const userLatLng = window.__userLatLng.split(',');
                const userLat = encodeURIComponent(userLatLng[0]);
                const userLng = encodeURIComponent(userLatLng[1]);
                const hospitalLat = encodeURIComponent(hospital.Latitude);
                const hospitalLng = encodeURIComponent(hospital.Longitude);
                const hospitalName = encodeURIComponent(hospital.Name || 'Hospital');
                const hospitalAddr = encodeURIComponent(hospital.Address || '');
                const url = `directions.html?userLat=${userLat}&userLng=${userLng}&hospitalLat=${hospitalLat}&hospitalLng=${hospitalLng}&hospitalName=${hospitalName}&hospitalAddr=${hospitalAddr}`;
                window.open(url, '_blank');
              });
            });
            // Add delete button logic
            hospitalList.querySelectorAll('.btn.delete').forEach((btn) => {
              btn.addEventListener('click', async () => {
                const hospitalId = btn.getAttribute('data-hospital-id');
                if (confirm('Are you sure you want to delete this hospital?')) {
                  try {
                    const res = await fetch(`/hospitals/${hospitalId}`, { method: 'DELETE' });
                    if (res.ok) {
                      alert('Hospital deleted successfully.');
                      location.reload();
                    } else {
                      alert('Failed to delete hospital.');
                    }
                  } catch (e) {
                    alert('Error deleting hospital.');
                  }
                }
              });
            });
          } catch (err) {
            console.error('Error fetching hospitals:', err);
          }
        },
        (error) => {
          mapDiv.innerHTML = '<div style="padding:2rem; text-align:center;">Unable to retrieve your location.</div>';
        }
      );
    } else {
      mapDiv.innerHTML = '<div style="padding:2rem; text-align:center;">Geolocation is not supported by your browser.</div>';
    }
  };
  document.body.appendChild(leafletScript);
});
