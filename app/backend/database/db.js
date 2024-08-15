const { Pool } = require('../node_modules/pg');


const pool = new Pool({
  connectionString: process.env.DATABASE_URL
  // user: 'postgres',           // Replace with your PostgreSQL username
  // host: 'localhost',          // Replace with your PostgreSQL server address
  // database: 'mydatabase',     // Replace with your database name
  // password: 'mysecretpassword', // Replace with your PostgreSQL password
  // port: 5432,                 // Default PostgreSQL port
});

module.exports = pool;
