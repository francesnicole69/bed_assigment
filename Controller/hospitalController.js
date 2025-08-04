// Delete hospital by ID
async function deleteHospitalById(req, res) {
  try {
    const id = parseInt(req.params.id);
    if (isNaN(id) || id <= 0) {
      return res.status(400).json({ error: "Invalid hospital ID. ID must be a positive number" });
    }
    const result = await hospitalModel.deleteHospitalById(id);
    if (result.error) {
      return res.status(404).json(result);
    }
    res.json(result);
  } catch (error) {
    console.error("Controller error:", error);
    res.status(500).json({ error: "Error deleting hospital" });
  }
}

const hospitalModel = require("../Model/hospitalModel");

// Get all hospitals
async function getAllHospitals(req, res) {
  try {
    const hospitals = await hospitalModel.getAllHospitals();
    res.json(hospitals);
  } catch (error) {
    console.error("Controller error:", error);
    res.status(500).json({ error: "Error retrieving hospitals" });
  }
}

// Create new hospital
async function createHospital(req, res) {
  try {
    const newHospital = await hospitalModel.createHospital(req.body);
    res.status(201).json(newHospital);
  } catch (error) {
    console.error("Controller error:", error);
    res.status(500).json({ error: "Error creating hospital" });
  }
}

// Update hospital
async function updateHospital(req, res) {
  try {
    const id = parseInt(req.params.id);
    if (isNaN(id) || id <= 0) {
      return res.status(400).json({ error: "Invalid hospital ID. ID must be a positive number" });
    }
    const result = await hospitalModel.updateHospital(id, req.body);
    if (result.error) {
      return res.status(404).json(result);
    }
    res.json(result);
  } catch (error) {
    console.error("Controller error:", error);
    res.status(500).json({ error: "Error updating hospital" });
  }
}

module.exports = {
  getAllHospitals,
  createHospital,
  updateHospital,
  deleteHospitalById,
};
