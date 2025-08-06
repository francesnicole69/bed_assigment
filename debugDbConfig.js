require('dotenv').config();
const dbConfig = require('./dbConfig');

console.log('Environment variables:');
console.log('DB_USER:', process.env.DB_USER);
console.log('DB_DATABASE:', process.env.DB_DATABASE);
console.log('DB_SERVER:', process.env.DB_SERVER);
console.log('DB_PORT:', process.env.DB_PORT);

console.log('\nDatabase config:');
console.log('user:', dbConfig.user);
console.log('database:', dbConfig.database);
console.log('server:', dbConfig.server);
console.log('port:', dbConfig.port);
