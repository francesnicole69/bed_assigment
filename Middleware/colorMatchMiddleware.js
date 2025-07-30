// Example middleware for color match game (can be expanded for validation, auth, etc)
function validateColorAttempt(req, res, next) {
  const { userId, score, attempts } = req.body;
  if (!userId || typeof score !== 'number' || !Array.isArray(attempts)) {
    return res.status(400).json({ error: 'Invalid input for color match attempt' });
  }
  next();
}

module.exports = { validateColorAttempt };
