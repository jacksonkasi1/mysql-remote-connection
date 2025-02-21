const express = require("express");
const mysql = require("mysql2/promise");
require("dotenv").config();

const app = express();
const PORT = 5000;

const dbConfig = {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT,
  // Disable SSL for testing purposes
  // ssl: {
  //   ca: process.env.DB_CA.replace(/\\n/g, "\n"), // Convert escaped newlines to actual newlines
  //   rejectUnauthorized: true,
  // },
};

// MySQL Database Connection
const connectToDatabase = async () => {
  try {
    const connection = await mysql.createConnection(dbConfig);
    console.log("Connected to the MySQL database!");
    return connection;
  } catch (error) {
    console.error("Failed to connect to the database:", error.message);
    throw error;
  }
};

// Sample API Endpoint
app.get("/api/data", async (req, res) => {
  try {
    const connection = await connectToDatabase();
    const [rows] = await connection.execute("SELECT * FROM users");
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: "Database connection failed" });
  }
});

// Start Server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
