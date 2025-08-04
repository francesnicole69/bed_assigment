const colorMatchModel = require('../Model/colorMatchModel');

// Save a user's color match attempt
async function saveColorAttempt(req, res) {
  try {
    const { userId, score, attempts } = req.body;
    if (!userId || typeof score !== 'number' || !Array.isArray(attempts)) {
      return res.status(400).json({ error: 'Invalid input' });
    }
    const result = await colorMatchModel.saveColorAttempt(userId, score, JSON.stringify(attempts));
    res.json(result);
  } catch (error) {
    console.error('Controller error:', error);
    res.status(500).json({ error: 'Error saving attempt' });
  }
}

// Get all attempts for a user
async function getColorAttempts(req, res) {
  try {
    //let userId = req.user.id
    let userId = req.params.userId;
    if (!userId) {
      return res.status(400).json({ error: 'Missing userId' });
    }
    userId = parseInt(userId.trim());
    if (isNaN(userId)) {
      return res.status(400).json({ error: 'Invalid userId' });
    }
    const attempts = await colorMatchModel.getColorAttempts(userId);
    res.json(attempts);
  } catch (error) {
    console.error('Controller error:', error);
    res.status(500).json({ error: 'Error retrieving attempts' });
  }
}
  
module.exports = { saveColorAttempt, getColorAttempts };
