// Middleware/validateFeedback.js
module.exports = (req, res, next) => {
  const { SeniorID, Message } = req.body;

  if (!SeniorID || !Message) {
    return res.status(400).json({ error: "SeniorID and Message are required" });
  }

  next();
};
