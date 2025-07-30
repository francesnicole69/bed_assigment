module.exports = {
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  server: process.env.DB_SERVER ? process.env.DB_SERVER.trim() : 'localhost',
  database: process.env.DB_DATABASE,
  trustServerCertificate: true,
  port: process.env.DB_PORT ? parseInt(process.env.DB_PORT) : 1433,
  options: {
    enableArithAbort: true,
    connectionTimeout: 60000,
  },
};