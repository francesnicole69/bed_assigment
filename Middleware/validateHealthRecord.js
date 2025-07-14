// Middleware/validateHealthRecord.js
module.exports = (req, res, next) => {
  const { SeniorID, Temperature, BloodPressure, HeartRate } = req.body;

  if (!SeniorID || !Temperature || !BloodPressure || !HeartRate) {
    return res.status(400).json({ error: "All required fields must be filled" });
  }

  next();
};
