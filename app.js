// Import required modules
const express = require("express");
const dotenv = require("dotenv");
const sql = require("mssql");
const path = require("path");
const cors = require("cors");

// Load environment variables
dotenv.config();

const app = express();
app.use(cors());
const port = process.env.PORT || 3000;

// Middleware to parse request bodies
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Static file hosting
app.use(express.static(path.join(__dirname, "public")));
app.use(express.static("Public/Hospital")); // Optional hospital folder

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
app.delete("/hospitals", hospitalController.deleteAllHospitals);
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
