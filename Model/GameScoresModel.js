// Model for GameScores table
const sql = require('mssql');
const dbConfig = require('../dbConfig');

const GameScoresModel = {

  async saveScore(score, totalQuestions) {
    try {
      let pool = await sql.connect(dbConfig);
      await pool.request()
        .input('Score', sql.Int, score)
        .input('TotalQuestions', sql.Int, totalQuestions)
        .query('INSERT INTO GameScores (Score, TotalQuestions) VALUES (@Score, @TotalQuestions)');
      return true;
    } catch (err) {
      console.error('Error saving game score:', err);
      return false;
    }
  },

  async getAllScores() {
    try {
      let pool = await sql.connect(dbConfig);
      let result = await pool.request()
        .query('SELECT * FROM GameScores ORDER BY Timestamp DESC');
      return result.recordset;
    } catch (err) {
      console.error('Error fetching all game scores:', err);
      return [];
    }
  },

  async getLatestScores(limit = 5) {
    try {
      let pool = await sql.connect(dbConfig);
      let result = await pool.request()
        .input('Limit', sql.Int, limit)
        .query('SELECT TOP (@Limit) * FROM GameScores ORDER BY Timestamp DESC');
      return result.recordset;
    } catch (err) {
      console.error('Error fetching game scores:', err);
      return [];
    }
  }
};

module.exports = GameScoresModel;
