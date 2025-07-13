import { Sequelize } from 'sequelize'
import config from '../config.json'

const sequelize = new Sequelize(config.dbConnection.database, config.dbConnection.username, config.dbConnection.password, 
   {
   host: '127.0.0.1',
   dialect: 'mssql',
   logging: false,
   port: 1433,
   dialectOptions: {
     options: {
         encrypt: false, // 禁用加密（开发环境）
         trustServerCertificate: true // 即使没有有效证书也信任
      }
    },
    pool: {
       max: 5,
       min: 0,
       idle: 10000
    }
 }
);
export default sequelize