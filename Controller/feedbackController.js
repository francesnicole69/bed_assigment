const feedbackModel = require('../Model/feedbackModel');


exports.getAllFeedback = async (req, res) => {
  try {
    const feedback = await feedbackModel.getAll();
    res.json(feedback);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.addFeedback = async (req, res) => {
  const { SeniorID, Message } = req.body;
  if (!SeniorID || !Message) {
    return res.status(400).json({ error: "SeniorID and Message are required" });
  }

  try {
    await feedbackModel.insert(SeniorID, Message);
    res.status(201).json({ message: "✅ Feedback submitted" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.updateFeedback = async (req, res) => {
  const { id } = req.params;
  const { Message } = req.body;

  if (!Message) {
    return res.status(400).json({ error: "Message is required" });
  }

  try {
    const result = await feedbackModel.update(id, Message);
    if (result.rowsAffected[0] === 0) {
      return res.status(404).json({ error: "Feedback not found" });
    }
    res.json({ message: "✅ Feedback updated" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.deleteFeedback = async (req, res) => {
  const { id } = req.params;

  try {
    const result = await feedbackModel.delete(id);
    if (result.rowsAffected[0] === 0) {
      return res.status(404).json({ error: "Feedback not found" });
    }
    res.json({ message: "🗑️ Feedback deleted" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
