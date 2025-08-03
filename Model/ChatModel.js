// models/ChatModel.js
const sql = require("mssql");
const dbConfig = require("../dbConfig");

class ChatModel {
  static async findAll() {
    let connection;
    try {
      connection = await sql.connect(dbConfig);
      const result = await connection.request().query("SELECT * FROM chat");
      return result.recordset;
    } finally {
      if (connection) connection.close();
    }
  }

  static async findOne(conditions) {
    let connection;
    try {
      connection = await sql.connect(dbConfig);
      const whereClause = Object.keys(conditions)
        .map(key => `${key} = @${key}`)
        .join(' AND ');
      
      const request = connection.request();
      Object.entries(conditions).forEach(([key, value]) => {
        request.input(key, value);
      });

      const result = await request.query(`SELECT TOP 1 * FROM chat WHERE ${whereClause}`);
      return result.recordset[0] || null;
    } finally {
      if (connection) connection.close();
    }
  }

  static async create(chatData) {
    let connection;
    try {
      connection = await sql.connect(dbConfig);
      const request = connection.request();
      
      Object.entries(chatData).forEach(([key, value]) => {
        request.input(key, value);
      });

      const columns = Object.keys(chatData).join(', ');
      const values = Object.keys(chatData).map(k => `@${k}`).join(', ');

      const result = await request.query(`
        INSERT INTO chat (${columns}) 
        VALUES (${values});
        SELECT SCOPE_IDENTITY() AS id;
      `);
      
      return { id: result.recordset[0].id, ...chatData };
    } finally {
      if (connection) connection.close();
    }
  }

  static async update(values, conditions) {
    let connection;
    try {
      connection = await sql.connect(dbConfig);
      const request = connection.request();
      
      // Add inputs for values
      Object.entries(values).forEach(([key, value]) => {
        request.input(`val_${key}`, value);
      });
      
      // Add inputs for conditions
      Object.entries(conditions).forEach(([key, value]) => {
        request.input(`cond_${key}`, value);
      });

      const setClause = Object.keys(values)
        .map(key => `${key} = @val_${key}`)
        .join(', ');
      
      const whereClause = Object.keys(conditions)
        .map(key => `${key} = @cond_${key}`)
        .join(' AND ');

      const result = await request.query(`
        UPDATE chat 
        SET ${setClause}
        WHERE ${whereClause};
        SELECT @@ROWCOUNT AS affectedRows;
      `);
      
      return result.recordset[0].affectedRows;
    } finally {
      if (connection) connection.close();
    }
  }

  static async destroy(conditions) {
    let connection;
    try {
      connection = await sql.connect(dbConfig);
      const request = connection.request();
      
      Object.entries(conditions).forEach(([key, value]) => {
        request.input(key, value);
      });

      const whereClause = Object.keys(conditions)
        .map(key => `${key} = @${key}`)
        .join(' AND ');

      const result = await request.query(`
        DELETE FROM chat 
        WHERE ${whereClause};
        SELECT @@ROWCOUNT AS deletedCount;
      `);
      
      return result.recordset[0].deletedCount;
    } finally {
      if (connection) connection.close();
    }
  }

  static async findAndCountAll({ where = {}, limit, offset, order }) {
    let connection;
    try {
      connection = await sql.connect(dbConfig);
      const request = connection.request();
      
      // Add where conditions
      Object.entries(where).forEach(([key, value]) => {
        if (typeof value === 'object' && value[Op.like]) {
          request.input(key, value[Op.like]);
        } else {
          request.input(key, value);
        }
      });

      // Build WHERE clause
      let whereClause = 'WHERE 1=1';
      Object.keys(where).forEach(key => {
        if (typeof where[key] === 'object' && where[key][Op.like]) {
          whereClause += ` AND ${key} LIKE @${key}`;
        } else {
          whereClause += ` AND ${key} = @${key}`;
        }
      });

      // Build ORDER BY clause
      let orderClause = '';
      if (order && order.length > 0) {
        orderClause = 'ORDER BY ' + order.map(([col, dir]) => `${col} ${dir}`).join(', ');
      }

      // Get total count
      const countResult = await request.query(`
        SELECT COUNT(*) AS count FROM chat ${whereClause}
      `);
      const total = countResult.recordset[0].count;

      // Get paginated data
      const result = await request.query(`
        SELECT * FROM chat 
        ${whereClause}
        ${orderClause}
        OFFSET ${offset || 0} ROWS
        FETCH NEXT ${limit || 10} ROWS ONLY
      `);

      return {
        count: total,
        rows: result.recordset
      };
    } finally {
      if (connection) connection.close();
    }
  }
}

// Define Op object for LIKE operations
const Op = {
  like: Symbol('like')
};

module.exports = { ChatModel, Op };