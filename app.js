// Import required modules

const express = require("express");
const dotenv = require("dotenv");
const sql = require("mssql");
const path = require("path");
const cors = require("cors");

dotenv.config(); // Load environment variables

const app = express();
app.use(cors());
const port = process.env.PORT || 3000;

// Middleware to parse request bodies
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

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
app.delete("/hospitals", hospitalController.deleteAllHospitals);
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
