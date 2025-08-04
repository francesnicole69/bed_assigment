// Example middleware for math game (can be expanded for validation, auth, etc)
function validateMathAttempt(req, res, next) {
  const { score, attempts } = req.body;
  if (typeof score !== 'number' || !Array.isArray(attempts)) {
    return res.status(400).json({ error: 'Invalid input for math attempt' });
  }
  next();
}

module.exports = { validateMathAttempt };
