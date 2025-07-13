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

          // Fetch hospitals from API, calculate distance, and display nearest 4
          try {
            const res = await fetch('http://localhost:3000/hospitals');
            let hospitals = await res.json();
            // Calculate distance to user for each hospital
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
            // Sort by distance and take 4 nearest

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

            // Render nearest 4 in the hospital-list
            const hospitalList = document.querySelector('.hospital-list');
            hospitalList.innerHTML = '<h2>Hospitals Near You</h2>' + nearest.map(hospital => `
              <div class="hospital-card">
                <div class="card-content">
                  <div>
                    <h3>${hospital.Name}</h3>
                    <p class="address">${hospital.Address}</p>
                    <p class="timing">Open: ${hospital.OpeningHours || 'N/A'}</p>
                    <div class="actions">
                      <button class="btn direction" onclick="window.open('https://www.google.com/maps/dir/?api=1&destination=${encodeURIComponent(hospital.Address)}','_blank')">Directions</button>
                      <button class="btn call" onclick="window.open('tel:${hospital.Phone || ''}')">Call</button>
                    </div>
                  </div>
                  <div class="distance">${hospital.distance !== Infinity ? hospital.distance.toFixed(2) + ' km' : 'N/A'}</div>
                </div>
              </div>
            `).join('');
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
