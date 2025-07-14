const model = require('../Model/healthTrackerModel');


exports.getAllRecords = async (req, res) => {
  try {
    const records = await healthModel.getAll();
    res.json(records);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.addRecord = async (req, res) => {
  const { SeniorID, Temperature, BloodPressure, HeartRate, Notes } = req.body;

  if (!SeniorID || !Temperature || !BloodPressure || !HeartRate) {
    return res.status(400).json({ error: "All required fields must be filled" });
  }

  try {
    await healthModel.insert(SeniorID, Temperature, BloodPressure, HeartRate, Notes);
    res.status(201).json({ message: "✅ Health record added" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.updateRecord = async (req, res) => {
  const { id } = req.params;
  const { Temperature, BloodPressure, HeartRate, Notes } = req.body;

  try {
    const result = await healthModel.update(id, Temperature, BloodPressure, HeartRate, Notes);
    if (result.rowsAffected[0] === 0) {
      return res.status(404).json({ error: "Record not found" });
    }
    res.json({ message: "✅ Health record updated" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.deleteRecord = async (req, res) => {
  const { id } = req.params;

  try {
    const result = await healthModel.delete(id);
    if (result.rowsAffected[0] === 0) {
      return res.status(404).json({ error: "Record not found" });
    }
    res.json({ message: "🗑️ Health record deleted" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
