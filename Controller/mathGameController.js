const mathGameModel = require('../Model/mathGameModel');
const sql = require("mssql");
const dbConfig = require("../dbConfig");

// Save a user's math game attempt
async function saveMathAttempt(req, res) {
  try {
    const { score, attempts } = req.body;
    const userId = req.user.id; // Get userId from JWT token
    
    if (!userId || typeof score !== 'number' || !Array.isArray(attempts)) {
      return res.status(400).json({ error: 'Invalid input' });
    }
    
    console.log('Saving math attempt for userId:', userId, 'score:', score);
    const result = await mathGameModel.saveMathAttempt(userId, score, JSON.stringify(attempts));
    res.json(result);
  } catch (error) {
    console.error('Controller error:', error);
    res.status(500).json({ error: 'Error saving attempt' });
  }
}

// Get all attempts for a user
async function getMathAttempts(req, res) {
  try {
    let userId = req.user.id; // Get userId from JWT token
    console.log('JWT user object:', req.user);
    console.log('Extracted userId from JWT:', userId);
    
    if (!userId) {
      return res.status(400).json({ error: 'Missing userId' });
    }
    userId = parseInt(userId);
    if (isNaN(userId)) {
      return res.status(400).json({ error: 'Invalid userId' });
    }
    
    console.log('Final userId for database query:', userId);
    const attempts = await mathGameModel.getMathAttempts(userId);
    console.log('Retrieved attempts:', attempts);
    res.json(attempts);
  } catch (error) {
    console.error('Controller error:', error);
    res.status(500).json({ error: 'Error retrieving attempts' });
  }
}

// ✅ New: Retrieve all scores for current user (Math + Color Match) using JWT
async function getAllScores(req, res) {
  const userId = req.user.id; // user.id from JWT

  try {
    const pool = await sql.connect(dbConfig);
    const result = await pool.request()
      .input("UserId", userId)
      .query(`
        SELECT GameId, Score, TotalQuestions, Timestamp
        FROM GameScores
        WHERE UserId = @UserId
        ORDER BY Timestamp DESC
      `);

    res.status(200).json(result.recordset);
  } catch (err) {
    console.error("Error fetching scores:", err);
    res.status(500).json({ error: "Failed to fetch scores" });
  }
}

// ✅ New: Retrieve all scores for current user (Math + Color Match) using JWT
async function getAllScores(req, res) {
  const userId = req.user.id; // user.id from JWT

  try {
    const pool = await sql.connect(dbConfig);
    const result = await pool.request()
      .input("UserId", userId)
      .query(`
        SELECT GameId, Score, TotalQuestions, Timestamp
        FROM GameScores
        WHERE UserId = @UserId
        ORDER BY Timestamp DESC
      `);

    res.status(200).json(result.recordset);
  } catch (err) {
    console.error("Error fetching scores:", err);
    res.status(500).json({ error: "Failed to fetch scores" });
  }
}

module.exports = { saveMathAttempt, getMathAttempts, getAllScores };
