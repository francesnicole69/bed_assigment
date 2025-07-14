// --- Ensure Express and app are initialized at the top ---
const express = require('express');
const fetch = require('node-fetch');
const app = express();
const cors = require("cors");
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// --- OpenRouteService Proxy Endpoint (must be after body parsers, before static files and other routes) ---
// --- OSRM Proxy Endpoint (replaces OpenRouteService) ---
app.post('/api/directions/:mode', async (req, res) => {
  // mode: 'car', 'bike', 'foot' (OSRM profiles)
  const { mode } = req.params;
  const { coordinates } = req.body; // expects [[lng, lat], [lng, lat], ...]
  if (!Array.isArray(coordinates) || coordinates.length < 2) {
    return res.status(400).json({ error: 'Invalid coordinates' });
  }
  // Build OSRM API URL
  const coordsStr = coordinates.map(c => c.join(',')).join(';');
  const url = `http://router.project-osrm.org/route/v1/${mode}/${coordsStr}?overview=full&geometries=geojson&alternatives=true&steps=true`;
  try {
    const osrmRes = await fetch(url);
    const data = await osrmRes.json();
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch directions from OSRM' });
  }
});
// Import required modules
const dotenv = require("dotenv");
const sql = require("mssql");
const path = require("path");


dotenv.config(); // Load environment variables



const port = process.env.PORT || 3000;

// Serve static files from the "public" folder
app.use(express.static(path.join(__dirname, "public")));

// ========== Import & Mount All Routes Below ==========
/*
  To add your own route:
  1. Create a route file in the /routes folder (e.g., routes/yourFeature.js)
  2. Import it here using require
  3. Use app.use() to mount it to a base path
*/
const hospitalController = require("./Controller/hospitalController");

// Hospital routes
app.get("/hospitals", hospitalController.getAllHospitals);
app.post("/hospitals", hospitalController.createHospital);
app.delete("/hospitals/:id", hospitalController.deleteHospitalById);

// Static files inside specific folder (optional)
app.use(express.static("Public/Hospital"));

// Start the server
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

// Graceful shutdown
process.on("SIGINT", async () => {
  console.log("Shutting down gracefully...");
  await sql.close();
  process.exit(0);
});
