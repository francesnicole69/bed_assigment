const sql = require("mssql");
const dbConfig = require("../dbConfig");

// Save a user's math game attempt
async function saveMathAttempt(userId, score, attempts) {
  let connection;
  try {
    connection = await sql.connect(dbConfig);
    const query = "INSERT INTO MathGameAttempts (UserId, Score, Attempts, AttemptTime) VALUES (@userId, @score, @attempts, GETDATE())";
    const request = connection.request();
    request.input("userId", userId);
    request.input("score", score);
    request.input("attempts", attempts);
    await request.query(query);
    return { message: "Attempt saved" };
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
    connection = await sql.connect(dbConfig);
    const query = "SELECT * FROM MathGameAttempts WHERE UserId = @userId ORDER BY AttemptTime DESC";
    const request = connection.request();
    request.input("userId", userId);
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
