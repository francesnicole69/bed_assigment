const sql = require("mssql");

// Get a user by username
async function getUserByUsername(username) {
  const pool = await sql.connect();
  const result = await pool
    .request()
    .input("username", sql.VarChar, username)
    .query("SELECT * FROM Users WHERE username = @username");

  return result.recordset[0];
}

// Create a new user (with NULL email)
async function createUser(username, hashedPassword) {
  const pool = await sql.connect();
  await pool
    .request()
    .input("username", sql.VarChar, username)
    .input("email", sql.VarChar, null)
    .input("password", sql.VarChar, hashedPassword)
    .query("INSERT INTO Users (username, email, password) VALUES (@username, @email, @password)");
}

module.exports = {
  getUserByUsername,
  createUser
};
