const queries = require("./queries");

async function main() {

    try {

        console.log("\n===============================");
        console.log("Students in Database Systems");
        console.log("===============================\n");

        await queries.getDatabaseStudents();

        console.log("\n===============================");
        console.log("Courses with Instructors");
        console.log("===============================\n");

        await queries.getCoursesWithInstructors();

        console.log("\n===============================");
        console.log("Students Without Courses");
        console.log("===============================\n");

        await queries.getStudentsWithoutCourses();

        console.log("\n===============================");
        console.log("Updating Email");
        console.log("===============================\n");

        await queries.updateStudentEmail(
            1,
            "alice.johnson@university.com"
        );

        console.log("\n===============================");
        console.log("Deleting Course");
        console.log("===============================\n");

        await queries.deleteCourse(3);

    } catch (error) {

        console.error(error);

    } finally {

        process.exit();

    }
}

main();