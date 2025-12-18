--Display all student records.--
SELECT * 
FROM Student1;
--Display each student's full name--
SELECT F_Name
FROM Student1;
--Display Course_id --
SELECT Course_id 
FROM Course1;
--Display each student’s full name--
SELECT 
    F_Name, 
	From
    Student1;
	--List students who enrolled before 2022--
	SELECT *
FROM Student1
WHERE EnrollmentDate < '2022-01-01';
--Display total number of students---
SELECT COUNT(*) AS TotalStudents
FROM Student1;
--Display students whose names end with 'a'--
SELECT *
FROM Student1
WHERE F_Name LIKE '%a';
--Display students with NULL advisor--
SELECT *
FROM Student1
WHERE Advisor IS NULL;
--Display students enrolled in 2021--
SELECT *
FROM Student1
WHERE YEAR(EnrollmentDate) = 2021;
-- Insert your data as a new student (Student ID = 300045, Program ID = 2, GPA = 3.6--
INSERT INTO Student1 (Student1ID, F_Name, ProgramID, GPA)
VALUES (300045, 'Moza Mohammed', 2, 3.6);
---