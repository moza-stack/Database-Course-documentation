--University Database – JOIN Queries--
--Display the department ID, name, and the full name of the faculty managing it--
SELECT 
    d.Department_id AS DepartmentID,
    d.D_name AS DepartmentName
FROM dbo.Department1 d
JOIN dbo.Faculty1 e
    ON d.Department_id = e.Department_id;
	---Display each program's name and the name of the department offering it---
	SELECT 
    Course_id  AS Course_id,
    d.D_name         AS DepartmentName
FROM Course1 p
JOIN Department1 d
    ON p.Department_id = d.Department_id;
	----Display the full student data and the full name of their faculty advisor--
	SELECT 
    s.*, 
    F_name + ' ' + L_name AS AdvisorFullName
FROM Student1 s
JOIN Faculty1 f
    ON s.S_id = f.F_ID;
	--Display full data about courses whose titles start with "I" (e.g., "Introduction to...")--
	SELECT *
FROM Course1
WHERE Course_name LIKE 'I%';
---Display names of students in program ID 3 whose GPA is between 2.5 and 3.5--
SELECT 
    F_name + ' ' + L_name AS StudentName
FROM Student1
WHERE S_id = 3
  --Find names of students who are advised by " Ahmed Hassan"--
 ALTER TABLE Student1
ADD Advisor_id INT;
  SELECT F_name + ' ' + L_name AS StudentName
FROM Student1 s
JOIN Faculty1 f
    ON Advisor_id = S_id
WHERE F_name = 'Ahmed' AND L_name = 'Hassan';
----Retrieve each student's name and the titles of courses they are enrolled in, ordered by course title--
SELECT 
    s.F_name + ' ' + s.L_name AS StudentName,
    c.Course_name AS CourseTitle
FROM 
    Student1 s
JOIN 
    Enroll e ON s.S_id = S_id
JOIN 
    Course1 c ON Course_id = C.Course_id
ORDER BY 
    c.Course_name;
--For each class in Building 'Main', retrieve class ID, course name, department name, and faculty name teaching the class

--Display all faculty members who manage any department--
SELECT 
    f.F_ID,
    Name,
    d.D_name AS DepartmentName
FROM Faculty1 f
JOIN Department1 d
    ON f.F_id = d.Department_id;
	---Display all students and their advisors' names, even if some students don’t have advisors yet--
	SELECT 
    s.F_Name + ' ' + s.L_name AS StudentName,
    ISNULL(F_Name + ' ' +L_Name, 'No Advisor') AS AdvisorName
FROM Student1 s
LEFT JOIN Faculty1 f
    ON s.Advisor_id = f.F_id;
	