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
const authMiddleware = require('./Middleware/authMiddleware');
// Color match game routes
app.post('/colormatch/attempt', authMiddleware.verifyJWT, colorMatchMiddleware.validateColorAttempt, colorMatchController.saveColorAttempt);
app.get('/colormatch/attempts/:userId', colorMatchController.getColorAttempts);
app.get('/colormatch/attempts', authMiddleware.verifyJWT, colorMatchController.getColorAttempts);

// Math game routes
const mathGameController = require('./Controller/mathGameController');
const mathGameMiddleware = require('./Middleware/mathGameMiddleware');
app.post('/mathgame/attempt', authMiddleware.verifyJWT, mathGameMiddleware.validateMathAttempt, mathGameController.saveMathAttempt);
app.get('/mathgame/attempts/:userId', mathGameController.getMathAttempts);
app.get('/mathgame/attempts', authMiddleware.verifyJWT, mathGameController.getMathAttempts);
//add route register user and login user
const userController = require('./Controller/UserController');
app.post('/register', userController.registerUser);
app.post('/login', userController.login);
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

// ========== Debug Route for GameScores ==========
app.get("/debug/gamescores", async (req, res) => {
  const sql = require('mssql');
  const dbConfig = require('./dbConfig');
  let connection;
  try {
    connection = await sql.connect(dbConfig);
    const result = await connection.request().query('SELECT * FROM GameScores ORDER BY Timestamp DESC');
    res.json(result.recordset);
  } catch (error) {
    console.error("Database error:", error);
    res.status(500).json({ error: 'Database error' });
  } finally {
    if (connection) {
      try { await connection.close(); } catch (err) { console.error("Error closing connection:", err); }
    }
  }
});

// ========== Test Data Route ==========
app.post("/debug/add-test-data", async (req, res) => {
  const sql = require('mssql');
  const dbConfig = require('./dbConfig');
  let connection;
  try {
    connection = await sql.connect(dbConfig);
    
    // Add some test color match data (GameId = 1)
    await connection.request()
      .input('userId1', sql.BigInt, 1)
      .input('gameId1', sql.Int, 1)
      .input('score1', sql.Int, 8)
      .input('total1', sql.Int, 10)
      .query('INSERT INTO GameScores (UserId, GameId, Score, TotalQuestions, Timestamp) VALUES (@userId1, @gameId1, @score1, @total1, GETDATE())');
    
    // Add some test math game data (GameId = 2)
    await connection.request()
      .input('userId2', sql.BigInt, 1)
      .input('gameId2', sql.Int, 2)
      .input('score2', sql.Int, 7)
      .input('total2', sql.Int, 10)
      .query('INSERT INTO GameScores (UserId, GameId, Score, TotalQuestions, Timestamp) VALUES (@userId2, @gameId2, @score2, @total2, GETDATE())');
    
    res.json({ message: 'Test data added successfully' });
  } catch (error) {
    console.error("Database error:", error);
    res.status(500).json({ error: 'Database error', details: error.message });
  } finally {
    if (connection) {
      try { await connection.close(); } catch (err) { console.error("Error closing connection:", err); }
    }
  }
});

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
