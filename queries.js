const db = require("./db");

// ================================
// Retrieve students enrolled in Database Systems
// ================================
async function getDatabaseStudents() {
    const [rows] = await db.execute(`
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
        WHERE c.title = ?
    `, ["Database Systems"]);

    console.table(rows);
}

// ================================
// List courses with instructors
// ================================
async function getCoursesWithInstructors() {

    const [rows] = await db.execute(`
        SELECT
            c.course_id,
            c.title,
            c.credits,
            i.name AS instructor,
            i.department
        FROM Courses c
        JOIN Instructors i
            ON c.instructor_id = i.instructor_id
    `);

    console.table(rows);
}

// ================================
// Students not enrolled
// ================================
async function getStudentsWithoutCourses() {

    const [rows] = await db.execute(`
        SELECT
            s.student_id,
            s.name,
            s.email
        FROM Students s
        LEFT JOIN Enrollments e
            ON s.student_id = e.student_id
        WHERE e.student_id IS NULL
    `);

    console.table(rows);
}

// ================================
// Update Email
// ================================
async function updateStudentEmail(id, email) {

    await db.execute(
        `
        UPDATE Students
        SET email = ?
        WHERE student_id = ?
        `,
        [email, id]
    );

    console.log("Email updated successfully.");
}

// ================================
// Delete Course
// ================================
async function deleteCourse(id) {

    await db.execute(
        `
        DELETE FROM Courses
        WHERE course_id = ?
        `,
        [id]
    );

    console.log("Course deleted successfully.");
}

module.exports = {
    getDatabaseStudents,
    getCoursesWithInstructors,
    getStudentsWithoutCourses,
    updateStudentEmail,
    deleteCourse
};