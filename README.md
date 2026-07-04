<div align="center">

# 🎓 University Relational Database Management System

*A relational database project demonstrating database design, normalization, SQL querying, and Node.js integration with MySQL.*

![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-18+-339933?style=for-the-badge&logo=node.js&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Database-orange?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

</div>

---

# 📖 Overview

This project is a **University Relational Database Management System** developed to demonstrate the principles of relational database design, normalization, SQL querying, and database connectivity using **Node.js** and **MySQL**.

The system models a university environment where students enroll in courses taught by instructors. It implements a normalized database schema with proper relationships and demonstrates how SQL queries can retrieve meaningful information from the database.

The project includes:

- Relational database design
- Entity relationships
- SQL database creation
- Sample university data
- SQL queries
- Node.js and MySQL integration
- Query execution examples

---

# ✨ Features

- 👨‍🎓 Student Management
- 👨‍🏫 Instructor Management
- 📚 Course Management
- 📝 Student Enrollment Management
- 🔗 Foreign Key Relationships
- 📊 SQL Query Execution
- ⚡ Node.js Database Connectivity
- 🧩 Normalized Relational Database Design

---

# 🗂️ Project Structure

```text
University-Relational-Database-Design-Query/
│
├── Screenshots/
│   ├── app execution.png
│   ├── database schema.png
│   ├── relationships.png
│   └── query results.png
│
├── app.js
├── db.js
├── queries.js
├── university_db.sql
├── package.json
├── package-lock.json
├── .gitignore
└── README.md
```

---

# 🛠️ Technologies Used

- Node.js
- MySQL
- MySQL2
- JavaScript (ES6)
- SQL

---

# 🗄️ Database Script (`university_db.sql`)

The **`university_db.sql`** file contains the complete SQL script required to build the University database from scratch.

It automatically performs all database setup operations, including database creation, table creation, relationship definition, and inserting sample data.

---

## Database Creation

The script first creates the database and selects it for use.

```sql
CREATE DATABASE university_db;
USE university_db;
```

---

## Tables Created

The script creates the following relational tables.

| Table | Description |
|--------|-------------|
| **Students** | Stores student information including name, email, and age. |
| **Instructors** | Stores instructor information and departments. |
| **Courses** | Stores available courses and the instructor responsible for each course. |
| **Enrollments** | Stores student enrollments for each course. |

---

## Database Relationships

The database is fully normalized and connected using **Foreign Keys**.

```text
Students
    │
    │
    ▼
Enrollments
    ▲
    │
Courses
    │
    ▼
Instructors
```

Relationship Summary

- One instructor teaches multiple courses.
- One course belongs to one instructor.
- One student can enroll in multiple courses.
- One course can contain multiple students.
- The **Enrollments** table resolves the many-to-many relationship between Students and Courses.

---

## Primary Keys & Foreign Keys

| Table | Primary Key | Foreign Keys |
|--------|-------------|--------------|
| Students | student_id | — |
| Instructors | instructor_id | — |
| Courses | course_id | instructor_id → Instructors |
| Enrollments | enrollment_id | student_id → Students<br>course_id → Courses |

---

## Sample Data

To simplify testing, the SQL script inserts sample records into every table.

The sample data includes:

- Students
- Instructors
- Courses
- Enrollments

This allows the project to be executed immediately after importing the database.

---

## SQL Concepts Demonstrated

The SQL script demonstrates the following concepts:

- Database Creation
- Table Creation
- Primary Keys
- Foreign Keys
- AUTO_INCREMENT
- INSERT INTO Statements
- One-to-Many Relationships
- Many-to-Many Relationships
- Referential Integrity
- Relational Database Design

---

# 🚀 Getting Started

## 1. Clone the Repository

```bash
git clone https://github.com/your-username/University-Relational-Database-Design-Query.git

cd University-Relational-Database-Design-Query
```

---

## 2. Install Dependencies

```bash
npm install
```

---

## 3. Import the Database

### Using MySQL Workbench

1. Open MySQL Workbench.
2. Connect to your MySQL Server.
3. Open **university_db.sql**.
4. Click the **Execute (⚡)** button.
5. Refresh the Schemas panel.

The **university_db** database will be created automatically.

---

### Using phpMyAdmin

1. Open phpMyAdmin.
2. Click **Import**.
3. Select **university_db.sql**.
4. Click **Go**.

The database and all tables will be created automatically.

---

### Using MySQL Command Line

```bash
mysql -u root -p < university_db.sql
```

---

## 4. Configure Database Connection

Open **db.js** and update your MySQL credentials.

```javascript
const pool = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "",
    database: "university_db"
});
```

---

## 5. Run the Application

```bash
node app.js
```

---

# 📊 Example Output

```text
===============================
Students in Database Systems
===============================

John Doe
Jane Smith
Ali Ahmed
```

---

# 📸 Screenshots

The project contains screenshots illustrating the application's functionality.

Examples include:

- Database schema
- Table relationships
- SQL query execution
- Console output

Screenshots are available inside the **Screenshots/** directory.

---

# 📚 Learning Objectives

This project demonstrates how to:

- Design a relational database
- Normalize database tables
- Create SQL tables
- Define primary keys
- Define foreign keys
- Build table relationships
- Execute SQL queries
- Connect Node.js with MySQL
- Retrieve data from a relational database

---

# 🎯 Skills Demonstrated

- Relational Database Design
- SQL
- Database Normalization
- MySQL
- Node.js
- Backend Development
- Data Modeling
- SQL Querying
- Database Connectivity

---

# 📦 Dependencies

```json
{
  "mysql2": "^3.x"
}
```

Install dependencies using:

```bash
npm install
```

---

# 🔮 Future Improvements

Potential future enhancements include:

- Full CRUD Operations
- Express.js REST API
- User Authentication
- Input Validation
- Search Functionality
- Pagination
- Stored Procedures
- Views
- Database Indexing
- Unit Testing
- Docker Support

---

# 👨‍💻 Author

**Yassine Kalthoum**

Backend Developer | Node.js | SQL | Database Design

---

# 📄 License

This project was developed for educational purposes as part of a **University Relational Database Design & SQL Query Checkpoint**.

Feel free to use and modify the project for learning purposes.

---

<div align="center">

### ⭐ If you found this project useful, consider giving it a star!

**Happy Coding! 🚀**

</div>
