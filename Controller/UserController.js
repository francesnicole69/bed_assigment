const jwt = require("jsonwebtoken");
const sql = require("mssql");
const bcrypt = require("bcrypt");
const dbConfig = require("../dbConfig");

// Helper function to get user by username
async function getUserByUsername(username) {
  try {
    const pool = await sql.connect(dbConfig);
    const result = await pool.request()
      .input("username", sql.VarChar, username)
      .query("SELECT * FROM Users WHERE username = @username");
    
    return result.recordset[0] || null;
  } catch (error) {
    console.error("Error getting user by username:", error);
    throw error;
  }
}

// Helper function to create a new user
async function createUser(username, hashedPassword, email) {
  try {
    const pool = await sql.connect(dbConfig);
    
    const result = await pool.request()
      .input("username", sql.VarChar, username)
      .input("password", sql.VarChar, hashedPassword)
      .input("email", sql.VarChar, email)
      .query(`
        INSERT INTO Users (username, password, email) 
        VALUES (@username, @password, @email);
        SELECT SCOPE_IDENTITY() as id, @username as username;
      `);
    
    return result.recordset[0];
  } catch (error) {
    console.error("Error creating user:", error);
    throw error;
  }
}

// Register a new user
async function registerUser(req, res) {
  const { username, password, email } = req.body;

  try {
    // Debug: log what we received
    console.log("Received registration request:", req.body);
    console.log("Username:", username);
    console.log("Password:", password);
    console.log("Email:", email);

    // Basic validation
    if (!username || !password) {
      console.log("Validation failed - missing username or password");
      return res.status(400).json({ message: "Username and password are required" });
    }

    // Check for existing username
    const existingUser = await getUserByUsername(username);
    if (existingUser) {
      return res.status(400).json({ message: "Username already exists" });
    }

    // Hash password
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    // Create user in database (use email if provided, otherwise use username as email)
    const newUser = await createUser(username, hashedPassword, email || username);

    return res.status(201).json({ 
      message: "User created successfully"
    });
  } catch (err) {
    console.error("Registration error:", err);
    return res.status(500).json({ message: "Internal server error" });
  }
}

// Login existing user
async function login(req, res) {
  const { username, password } = req.body;

  try {
    const user = await getUserByUsername(username);
    if (!user) {
      return res.status(401).json({ message: "Invalid credentials" });
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(401).json({ message: "Invalid credentials" });
    }

    // JWT payload (just user id)
    const payload = { id: user.id };

    const token = jwt.sign(payload, process.env.JWT_SECRET || "secret123", {
      expiresIn: "1h",
    });

    return res.status(200).json({ token });
  } catch (err) {
    console.error("Login error:", err);
    return res.status(500).json({ message: "Internal server error" });
  }
}

module.exports = {
  registerUser,
  login
};
