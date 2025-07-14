const sql = require('mssql');



exports.getAll = async () => {
  const result = await sql.query`
    SELECT * FROM HealthRecords ORDER BY DateRecorded DESC
  `;
  return result.recordset;
};

exports.insert = async (SeniorID, Temperature, BloodPressure, HeartRate, Notes) => {
  await sql.query`
    INSERT INTO HealthRecords (SeniorID, Temperature, BloodPressure, HeartRate, Notes)
    VALUES (${SeniorID}, ${Temperature}, ${BloodPressure}, ${HeartRate}, ${Notes})
  `;
};

exports.update = async (id, Temperature, BloodPressure, HeartRate, Notes) => {
  return await sql.query`
    UPDATE HealthRecords
    SET Temperature = ${Temperature},
        BloodPressure = ${BloodPressure},
        HeartRate = ${HeartRate},
        Notes = ${Notes}
    WHERE RecordID = ${id}
  `;
};


exports.delete = async (id) => {
  return await sql.query`
    DELETE FROM HealthRecords
    WHERE RecordID = ${id}
  `;
};
