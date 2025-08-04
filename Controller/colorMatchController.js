const colorMatchModel = require('../Model/colorMatchModel');

// Save a user's color match attempt
async function saveColorAttempt(req, res) {
  try {
    const { score, attempts } = req.body;
    const userId = req.user.id; // Get userId from JWT token
    
    if (!userId || typeof score !== 'number' || !Array.isArray(attempts)) {
      return res.status(400).json({ error: 'Invalid input' });
    }
    
    console.log('Saving color match attempt for userId:', userId, 'score:', score);
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
    let userId = req.user.id; // Get userId from JWT token
    console.log('JWT user object:', req.user);
    console.log('Extracted userId from JWT:', userId);
    
    if (!userId) {
      return res.status(400).json({ error: 'Missing userId' });
    }
    userId = parseInt(userId);
    if (isNaN(userId)) {
      return res.status(400).json({ error: 'Invalid userId' });
    }
    
    console.log('Final userId for database query:', userId);
    const attempts = await colorMatchModel.getColorAttempts(userId);
    console.log('Retrieved attempts:', attempts);
    res.json(attempts);
  } catch (error) {
    console.error('Controller error:', error);
    res.status(500).json({ error: 'Error retrieving attempts' });
  }
}
  
module.exports = { saveColorAttempt, getColorAttempts };
