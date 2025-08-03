const sql = require("mssql");
const dbConfig = require("../dbConfig");

// GameId 2 = Math Game

// Save a user's math game attempt
async function saveMathAttempt(userId, score, attempts) {
  let connection;
  try {
    connection = await sql.connect(dbConfig);
    const query = `
      INSERT INTO GameScores (UserId, GameId, Score, TotalQuestions, Timestamp)
      VALUES (@userId, @gameId, @score, @totalQuestions, GETDATE())
    `;
    const request = connection.request();
    request.input("userId", userId);
    request.input("gameId", 2); // Math Game
    request.input("score", score);
    request.input("totalQuestions", attempts ? JSON.parse(attempts).length : 0); // Parse attempts and get length
    await request.query(query);
    return { message: "Math game attempt saved." };
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
async function getMathAttempts(userId) {
  let connection;
  try {
    console.log("Fetching math attempts for userId:", userId, "GameId: 2");
    connection = await sql.connect(dbConfig);
    const query = `
      SELECT * FROM GameScores 
      WHERE UserId = @userId AND GameId = 2 
      ORDER BY Timestamp DESC
    `;
    const request = connection.request();
    request.input("userId", sql.BigInt, userId);
    request.input("gameId", sql.Int, 2); // Math Game
    const result = await request.query(query);
    console.log("Query result:", result.recordset);
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

module.exports = { saveMathAttempt, getMathAttempts };
