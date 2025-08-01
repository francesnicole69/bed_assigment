const dotenv = require('dotenv');
dotenv.config();
const express = require('express');
const fetch = require('node-fetch');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// GameScores routes
const gameScoresController = require('./Controller/gameScoresController');
app.use('/', gameScoresController);
const colorMatchController = require('./Controller/colorMatchController');
const colorMatchMiddleware = require('./Middleware/colorMatchMiddleware');
// Color match game routes
app.post('/colormatch/attempt', colorMatchMiddleware.validateColorAttempt, colorMatchController.saveColorAttempt);
app.get('/colormatch/attempts/:userId', colorMatchController.getColorAttempts);
const mathGameController = require('./Controller/mathGameController');
const mathGameMiddleware = require('./Middleware/mathGameMiddleware');
// Math game routes
app.post('/mathgame/attempt', mathGameMiddleware.validateMathAttempt, mathGameController.saveMathAttempt);
app.get('/mathgame/attempts/:userId', mathGameController.getMathAttempts);

// OSRM Proxy Endpoint
app.post('/api/directions/:mode', async (req, res) => {
  const { mode } = req.params;
  const { coordinates } = req.body;

  if (!Array.isArray(coordinates) || coordinates.length < 2) {
    return res.status(400).json({ error: 'Invalid coordinates' });
  }

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

const sql = require('mssql');
const path = require('path');

const port = process.env.PORT || 3000;

// Static file hosting
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static('Public/Hospital')); // Optional hospital folder

// ========== Import Controllers ==========
const hospitalController = require("./Controller/hospitalController");
const feedbackController = require("./Controller/feedbackController");
const healthController = require("./Controller/healthTrackerController");

// ========== Import Middleware ==========
const validateFeedback = require("./Middleware/validateFeedback");
const validateHealthRecord = require("./Middleware/validateHealthRecord");

// ========== Hospital Routes ==========
app.get("/hospitals", hospitalController.getAllHospitals);
app.post("/hospitals", hospitalController.createHospital);
app.delete("/hospitals/:id", hospitalController.deleteHospitalById);

// ========== Feedback Routes ==========
app.get("/api/feedback", feedbackController.getAllFeedback);
app.post("/api/feedback", validateFeedback, feedbackController.addFeedback);
app.put("/api/feedback/:id", feedbackController.updateFeedback);
app.delete("/api/feedback/:id", feedbackController.deleteFeedback);

// ========== Health Tracker Routes ==========
app.get("/api/health", healthController.getAllRecords);
app.post("/api/health", validateHealthRecord, healthController.addRecord);
app.put("/api/health/:id", healthController.updateRecord);
app.delete("/api/health/:id", healthController.deleteRecord);

// ========== Start Server ==========
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

// Graceful shutdown
process.on("SIGINT", async () => {
  console.log("Shutting down gracefully...");
  await sql.close();
  process.exit(0);
});
