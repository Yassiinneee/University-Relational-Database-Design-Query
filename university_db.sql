-- ============================================================
-- Project: University Information System
-- Database: UniversityDB
-- Description:
-- This SQL script creates a normalized relational database
-- (up to Third Normal Form - 3NF) for managing students,
-- instructors, courses, and enrollments.
--
-- Author: Yassine Kalthoum
-- Date: July 2026
-- ============================================================

-- ============================================================
-- Drop and Create Database
-- ============================================================

DROP DATABASE IF EXISTS UniversityDB;
CREATE DATABASE UniversityDB;

USE UniversityDB;

-- ============================================================
-- Table: Students
-- ============================================================

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    age INT NOT NULL,
    CONSTRAINT chk_student_age CHECK (age > 17)
);

-- ============================================================
-- Table: Instructors
-- ============================================================

CREATE TABLE Instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL
);

-- ============================================================
-- Table: Courses
-- ============================================================

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    instructor_id INT NOT NULL,

    CONSTRAINT chk_course_credits
        CHECK (credits BETWEEN 1 AND 6),

    CONSTRAINT fk_course_instructor
        FOREIGN KEY (instructor_id)
        REFERENCES Instructors(instructor_id)
);

-- ============================================================
-- Table: Enrollments
-- ============================================================

CREATE TABLE Enrollments (

    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade CHAR(1),

    PRIMARY KEY (student_id, course_id),

    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_enrollment_course
        FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
        ON DELETE CASCADE,

    CONSTRAINT chk_grade
        CHECK (grade IN ('A','B','C','D','F'))
);

-- ============================================================
-- Insert Sample Data
-- ============================================================

-- Students
INSERT INTO Students (name, email, age)
VALUES
('Alice Johnson', 'alice@university.com', 20),
('Bob Smith', 'bob@university.com', 22),
('Charlie Brown', 'charlie@university.com', 19);

-- Instructors
INSERT INTO Instructors (name, department)
VALUES
('Dr. Ahmed', 'Computer Science'),
('Dr. Sarah', 'Mathematics'),
('Dr. James', 'Information Technology');

-- Courses
INSERT INTO Courses (title, credits, instructor_id)
VALUES
('Database Systems', 3, 1),
('Algorithms', 4, 1),
('Calculus', 3, 2);

-- Enrollments
INSERT INTO Enrollments (student_id, course_id, grade)
VALUES
(1, 1, 'A'),
(1, 2, 'B'),
(2, 1, 'A'),
(3, 3, 'C');

-- ============================================================
-- Verify Data
-- ============================================================

SELECT * FROM Students;
SELECT * FROM Instructors;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

-- ============================================================
-- Required Queries
-- ============================================================

-- ------------------------------------------------------------
-- 1. Retrieve all students enrolled in "Database Systems"
-- ------------------------------------------------------------

SELECT
    s.student_id,
    s.name,
    s.email,
    c.title
FROM Students s
JOIN Enrollments e
    ON s.student_id = e.student_id
JOIN Courses c
    ON e.course_id = c.course_id
WHERE c.title = 'Database Systems';

-- ------------------------------------------------------------
-- 2. List all courses with their instructors
-- ------------------------------------------------------------

SELECT
    c.course_id,
    c.title,
    c.credits,
    i.name AS instructor_name,
    i.department
FROM Courses c
JOIN Instructors i
    ON c.instructor_id = i.instructor_id;

-- ------------------------------------------------------------
-- 3. Find students not enrolled in any course
-- ------------------------------------------------------------

SELECT
    s.student_id,
    s.name,
    s.email
FROM Students s
LEFT JOIN Enrollments e
    ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

-- ------------------------------------------------------------
-- 4. Update the email address of a student
-- ------------------------------------------------------------

UPDATE Students
SET email = 'alice.johnson@university.com'
WHERE student_id = 1;

-- Verify Update
SELECT * FROM Students;

-- ------------------------------------------------------------
-- 5. Delete a course by its ID
-- ------------------------------------------------------------

DELETE FROM Courses
WHERE course_id = 3;

-- Verify Deletion
SELECT * FROM Courses;

-- ============================================================
-- End of Script
-- ============================================================