const sql = require('mssql');

exports.getAll = async () => {
  const result = await sql.query`SELECT * FROM Feedback ORDER BY DateSubmitted DESC`;
  return result.recordset;
};

exports.insert = async (seniorId, message) => {
  await sql.query`
    INSERT INTO Feedback (SeniorID, Message)
    VALUES (${seniorId}, ${message})
  `;
};

exports.update = async (id, message) => {
  return await sql.query`
    UPDATE Feedback
    SET Message = ${message}
    WHERE FeedbackID = ${id}
  `;
};

exports.delete = async (id) => {
  return await sql.query`
    DELETE FROM Feedback
    WHERE FeedbackID = ${id}
  `;
};
