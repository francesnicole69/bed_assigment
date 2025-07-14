// directions.js
// Loads route options and draws the selected route on the map
window.addEventListener('DOMContentLoaded', async () => {
  // Parse query params for user and hospital location
  function getQueryParam(name) {
    const url = new URL(window.location.href);
    return url.searchParams.get(name);
  }
  const userLat = parseFloat(getQueryParam('userLat'));
  const userLng = parseFloat(getQueryParam('userLng'));
  const hospitalLat = parseFloat(getQueryParam('hospitalLat'));
  const hospitalLng = parseFloat(getQueryParam('hospitalLng'));
  const hospitalName = decodeURIComponent(getQueryParam('hospitalName') || 'Hospital');
  const hospitalAddr = decodeURIComponent(getQueryParam('hospitalAddr') || '');
  // Debug: log coordinates
  console.log('User:', userLat, userLng, 'Hospital:', hospitalLat, hospitalLng);
  if ([userLat, userLng, hospitalLat, hospitalLng].some(isNaN)) {
    document.getElementById('routes').innerHTML = '<div style="color:red;">Invalid coordinates provided. Please check the URL parameters.</div>';
    return;
  }

  // Load Leaflet CSS
  const leafletCSS = document.createElement('link');
  leafletCSS.rel = 'stylesheet';
  leafletCSS.href = 'https://unpkg.com/leaflet@1.9.4/dist/leaflet.css';
  document.head.appendChild(leafletCSS);

  // Load Leaflet JS
  const leafletScript = document.createElement('script');
  leafletScript.src = 'https://unpkg.com/leaflet@1.9.4/dist/leaflet.js';
  leafletScript.onload = async () => {
    // Initialize map
    const map = L.map('directions-map-placeholder', {
      worldCopyJump: true,
      minZoom: 1
    }).setView([(userLat + hospitalLat) / 2, (userLng + hospitalLng) / 2], 13);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
      attribution: '© OpenStreetMap'
    }).addTo(map);
    // Add user and hospital markers
    const userMarker = L.marker([userLat, userLng]).addTo(map);
    userMarker.bindPopup('You are here!').openPopup();
    const hospitalMarker = L.marker([hospitalLat, hospitalLng]).addTo(map);
    hospitalMarker.bindPopup(`<b>${hospitalName}</b><br>${hospitalAddr}`).openPopup();

    // OSRM modes and labels
    const modes = [
      { mode: 'car', label: 'Car', icon: '🚗' },
      { mode: 'bike', label: 'Bicycle', icon: '🚴' },
      { mode: 'foot', label: 'Walking', icon: '🚶' }
    ];
    const routesDiv = document.getElementById('routes');
    let routeLayers = [];
    let routeDataArr = [];
    let osrmDurations = {};
    let osrmDistance = null;
    for (let i = 0; i < modes.length; i++) {
      const { mode, label, icon } = modes[i];
      try {
        // Use backend OSRM proxy endpoint
        const url = `/api/directions/${mode}`;
        const body = JSON.stringify({
          coordinates: [
            [userLng, userLat],
            [hospitalLng, hospitalLat]
          ]
        });
        const res = await fetch(url, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body
        });
        if (res.ok) {
          const data = await res.json();
          if (data.routes && data.routes.length > 0) {
            const summary = {
              distance: data.routes[0].distance,
              duration: data.routes[0].duration
            };
            osrmDurations[mode] = summary.duration;
            if (!osrmDistance) osrmDistance = summary.distance;
            routeDataArr.push({
              mode,
              label,
              icon,
              summary,
              geometry: data.routes[0].geometry
            });
          } else {
            console.warn(`No route found for mode: ${mode}`);
          }
        } else {
          const errText = await res.text();
          console.error(`Route API error for mode ${mode}:`, res.status, errText);
        }
      } catch (e) {
        console.error(`Error fetching route for mode ${mode}:`, e);
      }
    }
    // Fallback: If durations are too similar, estimate manually
    if (routeDataArr.length === 3) {
      const dCar = osrmDurations['car'];
      const dBike = osrmDurations['bike'];
      const dFoot = osrmDurations['foot'];
      if (Math.abs(dCar - dBike) < 60 && Math.abs(dBike - dFoot) < 60) {
        // Use fallback speeds (m/s): car=13.9 (50km/h), bike=4.2 (15km/h), foot=1.4 (5km/h)
        const dist = osrmDistance || 7000;
        routeDataArr = [
          { ...routeDataArr[0], summary: { duration: dist/13.9 } },
          { ...routeDataArr[1], summary: { duration: dist/4.2 } },
          { ...routeDataArr[2], summary: { duration: dist/1.4 } }
        ];
      }
    }
    // Render route options
    if (routeDataArr.length === 0) {
      routesDiv.innerHTML += '<div style="color:red;">No routes found for these locations. Please check the coordinates or try again later.</div>';
      return;
    }
    routesDiv.innerHTML = routeDataArr.map((r, idx) => `
      <div class="route-option${idx === 0 ? ' selected' : ''}" data-idx="${idx}">
        <div class="mode">${r.icon} ${r.label}</div>
        <div class="summary">${Math.round(r.summary.duration/60)} min</div>
        <div class="details">Fastest route, usual traffic</div>
      </div>
    `).join('');
    // Draw first route by default
    function drawRoute(idx) {
      // Remove previous
      routeLayers.forEach(l => map.removeLayer(l));
      routeLayers = [];
      const geo = routeDataArr[idx].geometry;
      const layer = L.geoJSON(geo, {
        style: { color: '#007bff', weight: 6, opacity: 0.85 }
      }).addTo(map);
      routeLayers.push(layer);
      map.fitBounds(layer.getBounds(), { padding: [40, 40] });
    }
    drawRoute(0);
    // Click to select route
    document.querySelectorAll('.route-option').forEach((el, idx) => {
      el.addEventListener('click', () => {
        document.querySelectorAll('.route-option').forEach(e => e.classList.remove('selected'));
        el.classList.add('selected');
        drawRoute(idx);
      });
    });
  };
  document.body.appendChild(leafletScript);
});
