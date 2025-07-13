// Delete hospital by ID
async function deleteHospitalById(id) {
  let connection;
  try {
    connection = await sql.connect(dbConfig);
    const query = "DELETE FROM Hospitals WHERE HospitalID = @id";
    const request = connection.request();
    request.input("id", id);
    const result = await request.query(query);
    if (result.rowsAffected[0] === 0) {
      return { error: "Hospital not found" };
    }
    return { message: "Hospital deleted successfully" };
  } catch (error) {
    console.error("Database error:", error);
    throw error;
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        console.error("Error closing connection:", err);
      }
    }
  }
}
// Delete all hospitals
async function deleteAllHospitals() {
  let connection;
  try {
    connection = await sql.connect(dbConfig);
    const query = "DELETE FROM Hospitals";
    await connection.request().query(query);
    return { message: "All hospitals deleted successfully" };
  } catch (error) {
    console.error("Database error:", error);
    throw error;
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        console.error("Error closing connection:", err);
      }
    }
  }
}
const sql = require("mssql");
const dbConfig = require("../dbConfig");

// Get all hospitals
async function getAllHospitals() {
  let connection;
  try {
    connection = await sql.connect(dbConfig);
    const query = "SELECT HospitalID, Name, Address, Latitude, Longitude, Phone, OpeningHours FROM Hospitals";
    const result = await connection.request().query(query);
    return result.recordset;
  } catch (error) {
    console.error("Database error:", error);
    throw error;
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        console.error("Error closing connection:", err);
      }
    }
  }
}

// Create new hospital
async function createHospital(hospitalData) {
  let connection;
  try {
    connection = await sql.connect(dbConfig);
    const query = `
      INSERT INTO Hospitals (Name, Address, Latitude, Longitude, Phone, OpeningHours)
      VALUES (@Name, @Address, @Latitude, @Longitude, @Phone, @OpeningHours);
    `;
    const request = connection.request();
    request.input("Name", hospitalData.Name);
    request.input("Address", hospitalData.Address);
    request.input("Latitude", hospitalData.Latitude);
    request.input("Longitude", hospitalData.Longitude);
    request.input("Phone", hospitalData.Phone);
    request.input("OpeningHours", hospitalData.OpeningHours);
    await request.query(query);
    return { message: "Hospital created successfully" };
  } catch (error) {
    console.error("Database error:", error);
    throw error;
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        console.error("Error closing connection:", err);
      }
    }
  }
}

module.exports = {
  getAllHospitals,
  createHospital,
  deleteAllHospitals,
  deleteHospitalById,
};