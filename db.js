const mysql = require("mysql2/promise");

const db = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "", // XAMPP default password
    database: "university_db",
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

module.exports = db;