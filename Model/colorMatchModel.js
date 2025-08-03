const sql = require("mssql");
const dbConfig = require("../dbConfig");

// GameId 1 = Color Match Game

// Save a user's color match attempt
async function saveColorAttempt(userId, score, attempts) {
  let connection;
  try {
    connection = await sql.connect(dbConfig);
    const query = `
      INSERT INTO GameScores (UserId, GameId, Score, TotalQuestions, Timestamp)
      VALUES (@userId, @gameId, @score, @totalQuestions, GETDATE())
    `;
    const request = connection.request();
    request.input("userId", userId);
    request.input("gameId", 1); // Color Match Game
    request.input("score", score);
    request.input("totalQuestions", attempts ? JSON.parse(attempts).length : 0); // Parse attempts and get length
    await request.query(query);
    return { message: "Color match attempt saved." };
  } catch (error) {
    console.error("Database error:", error);
    throw error;
  } finally {
    if (connection) {
      try { await connection.close(); } catch (err) { console.error("Error closing connection:", err); }
    }
  }
}

// Get all attempts for a user
async function getColorAttempts(userId) {
  let connection;
  try {
    connection = await sql.connect(dbConfig);
    const query = `
      SELECT * FROM GameScores 
      WHERE UserId = @userId AND GameId = 1 
      ORDER BY Timestamp DESC
    `;
    const request = connection.request();
    request.input("userId", userId);
    request.input("gameId", 1); // Color Match Game
    const result = await request.query(query);
    return result.recordset;
  } catch (error) {
    console.error("Database error:", error);
    throw error;
  } finally {
    if (connection) {
      try { await connection.close(); } catch (err) { console.error("Error closing connection:", err); }
    }
  }
}

module.exports = { saveColorAttempt, getColorAttempts };
