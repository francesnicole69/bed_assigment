const mathGameModel = require('../Model/mathGameModel');

// Save a user's math game attempt
async function saveMathAttempt(req, res) {
  try {
    const { userId, score, attempts } = req.body;
    if (!userId || typeof score !== 'number' || !Array.isArray(attempts)) {
      return res.status(400).json({ error: 'Invalid input' });
    }
    const result = await mathGameModel.saveMathAttempt(userId, score, JSON.stringify(attempts));
    res.json(result);
  } catch (error) {
    console.error('Controller error:', error);
    res.status(500).json({ error: 'Error saving attempt' });
  }
}

// Get all attempts for a user
async function getMathAttempts(req, res) {
  try {
    const userId = req.params.userId;
    if (!userId) {
      return res.status(400).json({ error: 'Missing userId' });
    }
    const attempts = await mathGameModel.getMathAttempts(userId);
    res.json(attempts);
  } catch (error) {
    console.error('Controller error:', error);
    res.status(500).json({ error: 'Error retrieving attempts' });
  }
}

module.exports = { saveMathAttempt, getMathAttempts };
