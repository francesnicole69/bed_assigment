const sql = require("mssql");
const dbConfig = require("../dbConfig");

// GameId 2 = Math Game

async function saveMathAttempt(userId, score, totalQuestions) {
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
    request.input("totalQuestions", totalQuestions); // This replaces `attempts.length`
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

async function getMathAttempts(userId) {
  let connection;
  try {
    connection = await sql.connect(dbConfig);
    const query = `
      SELECT * FROM GameScores 
      WHERE UserId = @userId AND GameId = 2 
      ORDER BY Timestamp DESC
    `;
    const request = connection.request();
    request.input("userId", userId);
    request.input("gameId", 2); // Math Game
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

module.exports = { saveMathAttempt, getMathAttempts };
