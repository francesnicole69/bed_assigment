// Controller for GameScores
const express = require('express');
const router = express.Router();
const GameScoresModel = require('../Model/GameScoresModel');



// Save a new game score
router.post('/gamescores', async (req, res) => {
  const { score, totalQuestions } = req.body;
  if (typeof score !== 'number' || typeof totalQuestions !== 'number') {
    return res.status(400).json({ error: 'Invalid input' });
  }
  const success = await GameScoresModel.saveScore(score, totalQuestions);
  if (success) {
    res.json({ message: 'Score saved' });
  } else {
    res.status(500).json({ error: 'Failed to save score' });
  }
});


// Get latest scores
router.get('/gamescores/latest', async (req, res) => {
  try {
    const scores = await GameScoresModel.getLatestScores(5);
    res.json(scores);
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch latest scores' });
  }
});

// Get all scores
router.get('/gamescores', async (req, res) => {
  try {
    const scores = await GameScoresModel.getAllScores();
    res.json(scores);
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch all scores' });
  }
});

module.exports = router;
