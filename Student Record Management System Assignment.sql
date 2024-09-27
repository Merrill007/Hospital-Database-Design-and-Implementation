--SQL ASSIGNMENT TO CRETATE A STUDENTS RECORD MANAGEMENT SYSTEM
--CREATE A students table
--CREATE A courses table
--CREATE AN enrollment table


--Creating students table
CREATE TABLE students(
	student_id INT PRIMARY KEY IDENTITY(1,1),
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	date_of_birth DATE,
	email VARCHAR(100) UNIQUE, --No two persons should have the same email addresses
	phone_number VARCHAR(15) UNIQUE, --No two persons should have the same phone number
	age INT CHECK(age>=18) ---contraint to show students only avove the 18 should enroll in courses
);

--Creating courses table
CREATE TABLE courses(
	course_id INT PRIMARY KEY IDENTITY(1,1),
	course_code VARCHAR(10) UNIQUE NOT NULL,
	course_title VARCHAR(100) NOT NULL,
	credit_units INT NOT NULL
);
--Creating enrollments table
CREATE TABLE enrollments(
	enrollment_id INT PRIMARY KEY IDENTITY(1,1),
	student_id INT REFERENCES students(student_id),
	course_id INT REFERENCES courses(course_id),
	grade CHAR(2) DEFAULT NULL,
);

--Add an extra column called registration_date to the students table

ALTER TABLE students
ADD registration_date DATE;

--Add an extra column called department to the courses table

ALTER TABLE courses
ADD department VARCHAR(50);


--Drop enrollments table

BEGIN TRANSACTION

DROP TABLE enrollments

Rollback;