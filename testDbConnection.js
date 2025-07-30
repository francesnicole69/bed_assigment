require('dotenv').config();
const sql = require('mssql');
const config = require('./dbConfig');

sql.connect(config).then(pool => {
  console.log('Connected!');
  pool.close();
}).catch(err => {
  console.error('Connection error:', err);
});
