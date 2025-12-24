create database dataDB;
USE dataDB;
CREATE TABLE Instructors (
InstructorID INT PRIMARY KEY,
FullName VARCHAR(100),
Email VARCHAR(100),
JoinDate DATE
);
CREATE TABLE Categories (
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(50)
);
CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
Title VARCHAR(100),
InstructorID INT,
CategoryID INT,
Price DECIMAL(6,2),
PublishDate DATE,
FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID),
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
CREATE TABLE Students (
StudentID INT PRIMARY KEY,
FullName VARCHAR(100),
Email VARCHAR(100),
JoinDate DATE
);
CREATE TABLE Enrollments (
EnrollmentID INT PRIMARY KEY,
StudentID INT,
CourseID INT,
EnrollDate DATE,
CompletionPercent INT,
Rating INT CHECK (Rating BETWEEN 1 AND 5),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
Step 2: Insert Sample Data
INSERT INTO Instructors VALUES
(1, 'Sarah Ahmed', 'sarah@learnhub.com', '2023-01-10'),
(2, 'Mohammed Al-Busaidi', 'mo@learnhub.com', '2023-05-21');
INSERT INTO Categories VALUES
(1, 'Web Development'),
(2, 'Data Science'),
(3, 'Business');
INSERT INTO Courses VALUES
(101, 'HTML & CSS Basics', 1, 1, 29.99, '2023-02-01'),
(102, 'Python for Data Analysis', 2, 2, 49.99, '2023-03-15'),
(103, 'Excel for Business', 2, 3, 19.99, '2023-04-10'),
(104, 'JavaScript Advanced', 1, 1, 39.99, '2023-05-01');
INSERT INTO Students VALUES
(201, 'Ali Salim', 'ali@student.com', '2023-04-01'),
(202, 'Layla Nasser', 'layla@student.com', '2023-04-05'),
(203, 'Ahmed Said', 'ahmed@student.com', '2023-04-10');
INSERT INTO Enrollments VALUES
(1, 201, 101, '2023-04-10', 100, 5),
(2, 202, 102, '2023-04-15', 80, 4),
(3, 203, 101, '2023-04-20', 90, 4),
(4, 201, 102, '2023-04-22', 50, 3),
(5, 202, 103, '2023-04-25', 70, 4),
(6, 203, 104, '2023-04-28', 30, 2),
(7, 201, 104, '2023-05-01', 60, 3);

--Display all courses with prices--
SELECT Title, Price
FROM Courses;

----Display all students with join dates--
SELECT FullName, JoinDate
FROM Students;

---Show all enrollments with completion percent and rating--
SELECT 
    EnrollmentID,
    StudentID,
    CourseID,
    CompletionPercent,
    Rating
FROM Enrollments;

----Count instructors who joined in 2023---
SELECT COUNT(*) AS InstructorsJoined2023
FROM Instructors;

-----Count students who joined in April 2023--
Select count(*) AS StudentsJoinedApril2023
From Students;

---Count total number of students---
Select count(*) AS TotalStudents
FROM Students;

--Count total number of enrollments--
Select count(*) AS TotalEnrollments
FROM Enrollments;

--Find average rating per course--

Select 
    c.CourseID,
    c.Title,
    AVG(e.Rating) AS AvgRating
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.Title;

--Count courses per instructor--
SELECT 
    i.InstructorID,
    i.FullName,
    count(c.CourseID) AS TotalCourses
FROM Instructors i
LEFT JOIN Courses c ON i.InstructorID = c.InstructorID
GROUP BY i.InstructorID, i.FullName;

--Count courses per category--
Select 
    cat.CategoryID,
    cat.CategoryName,
    count(c.CourseID) AS TotalCourses
FROM Categories cat
LEFT JOIN Courses c ON cat.CategoryID = c.CategoryID
GROUP BY cat.CategoryID, cat.CategoryName;

--Count students enrolled in each course---
Select 
    c.CourseID,
    c.Title,
    count(e.StudentID) AS TotalStudents
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.Title;

---Find average course price per category---
Select
    cat.CategoryID,
    cat.CategoryName,
    AVG(c.Price) AS AvgCoursePrice
FROM Categories cat
JOIN Courses c ON cat.CategoryID = c.CategoryID
GROUP BY cat.CategoryID, cat.CategoryName;

---Find maximum course price---
Select MAX(Price) AS MaxCoursePrice
From Courses;

--Find min, max, and average rating per course---
select
    c.CourseID,
    c.Title,
    MIN(e.Rating) AS MinRating,
    MAX(e.Rating) AS MaxRating,
    AVG(e.Rating) AS AvgRating
from Courses c
JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.Title;

---Count how many students gave rating = 5----
Select count(*) AS FiveStarRatings
from Enrollments
WHERE Rating = 5;


---Part 3: Extended Beginner Practice--
-- Count enrollments per month.--

SELECT 
    month(EnrollDate) AS EnrollMonth,
    count(*) AS Enrollments
FROM Enrollments
GROUP BY  month(EnrollDate);

---Find average course price overall--
Select AVG(Price) AS CoursePrice
FROM Courses;

--Count students per join month---
Select 
    Year(JoinDate) AS JoinYear,
    Month(JoinDate) AS JoinMonth,
    Count(*) AS Students
FROM Students
GROUP BY Year(JoinDate), Month(JoinDate);

--Count ratings per value (1–5).---
SELECT 
    Rating,
    count(*) AS RatingCount
	FROM Enrollments
	GROUP BY Rating;

---Find courses that never received rating = 5---
SELECT CourseID
FROM Enrollments
GROUP BY CourseID
HAVING MAX(Rating)< 5;

---Count courses priced above 30--
SELECT count(*) AS Courses30
FROM Courses
WHERE Price > 30;

---Find average completion percentage---
Select AVG(CompletionPercent) AS AverageCompletion
FROM Enrollments;

--Find course with lowest average rating--
SELECT
    c.CourseID,
    c.Title,
    AVG(e.Rating) AS AverageRating
FROM Courses c
JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.Title;

----Reflection (End of Day 1)----
----Answer briefly:----
---- What was easiest?----
---can I Creat tables and defining and understand we must all types have primary key.----
--- What was hardest?-----
----- I Understand how tables relate to each other but sometimes not have relationship between two tables.
---- What does GROUP BY do in your own words?----
--------GROUP BY groups rows together and put them in one column,no need to all table...---

------Course Performance Snapshot-----
SELECT 
    c.Title AS CourseTitle,
    Count(e.EnrollmentID) AS TotalEnrollments,
    ROUND(AVG(e.Rating), 2) AS AverageRating,
    ROUND(AVG(e.CompletionPercent), 2) AS AverageCompletionPercent
FROM Courses c
LEFT JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY c.Title;

-----Day 2 – JOIN + Aggregation + Analysis---
SELECT c.Title, i.FullName AS Instructor
FROM Courses c
JOIN Instructors i ON c.InstructorID = i.InstructorID;

SELECT c.Title, AVG(e.Rating) AS AvgRating
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title;

SELECT c.Title, AVG(e.Rating) AS AvgRating
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title
HAVING AVG(e.Rating) >= 4;

--Course title + instructor name + enrollments---
SELECT 
    c.Title AS CourseTitle,
    i.FullName AS InstructorName,
    Count(e.EnrollmentID) AS TotalEnrollments
FROM Courses c
JOIN Instructors i ON c.InstructorID = i.InstructorID
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title, i.FullName;

---Category name + total courses + average price---
SELECT 
    cat.CategoryName,
    Count(c.CourseID) AS TotalCourses,
    AVG(c.Price) AS AveragePrice
FROM Categories cat
LEFT JOIN Courses c ON cat.CategoryID = c.CategoryID
GROUP BY cat.CategoryName;
-----Instructor name + average course rating---
SELECT 
    i.FullName AS InstructorName,
    AVG(e.Rating) AS AverageRating
FROM Instructors i
JOIN Courses c ON i.InstructorID = c.InstructorID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY i.FullName;

---Student name + total courses enrolled.--
SELECT 
    s.FullName AS StudentName,
    Count(e.CourseID) AS TotalCoursesEnrolled
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.FullName;

---Category name + total enrollments-----
Select 
    cat.CategoryName,
    Count(e.EnrollmentID) AS TotalEnrollments
FROM Categories cat
JOIN Courses c ON cat.CategoryID = c.CategoryID
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY cat.CategoryName;

---Instructor name + total revenue---
SELECT 
    i.FullName AS InstructorName,
    Count(c.Price) AS TotalRevenue
FROM Instructors i
JOIN Courses c ON i.InstructorID = c.InstructorID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY i.FullName;

----Course title + % of students completed 100%---------------------
SELECT 
c.Title,
(SUM(CASE WHEN e.CompletionPercent = 100 THEN 1 ELSE 0 END) * 100.0
/ COUNT(e.EnrollmentID)) AS CompletionRate100
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title;


---Courses with more than 2 enrollments---
SELECT 
    c.CourseID,
    c.Title,
    count(e.EnrollmentID) AS TotalEnrollments
FROM Courses c
JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.Title
HAVING count(e.EnrollmentID) > 2;

---Instructors with average rating above 4.--
SELECT 
    i.InstructorID,
    i.FullName,
    AVG(e.Rating) AS AvgRating
FROM Instructors i
JOIN Courses c
    ON i.InstructorID = c.InstructorID
JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY i.InstructorID, i.FullName
HAVING AVG(e.Rating) > 4;

----Courses with average completion below 60%----
SELECT 
    c.CourseID,
    c.Title,
    AVG(e.CompletionPercent) AS AvgCompletion
FROM Courses c
JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.Title
HAVING AVG(e.CompletionPercent) < 60;

--Categories with more than 1 course--
SELECT 
    cat.CategoryID,
    cat.CategoryName,
    count(c.CourseID) AS TotalCourses
FROM Categories cat
JOIN Courses c
    ON cat.CategoryID = c.CategoryID
GROUP BY cat.CategoryID, cat.CategoryName
HAVING COUNT(c.CourseID) > 1;

----Students enrolled in at least 2 courses--
SELECT 
    s.StudentID,
    s.FullName,
    Count(e.CourseID) AS TotalCourses
FROM Students s
JOIN Enrollments e
    ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.FullName
HAVING COUNT(e.CourseID) >= 2;

---Best performing course.-----
SELECT c.Title, AVG(e.Rating) AS AvgRating
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title
ORDER BY AvgRating DESC;

---Instructor to promote---
SELECT i.FullName, AVG(e.Rating) AS AvgRating
FROM Instructors i
JOIN Courses c ON i.InstructorID = c.InstructorID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY i.FullName
ORDER BY AvgRating DESC;

----Highest revenue category---
SELECT cat.CategoryName, SUM(c.Price) AS Revenue
FROM Categories cat
JOIN Courses c ON cat.CategoryID = c.CategoryID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY cat.CategoryName
ORDER BY Revenue DESC;

-----Do expensive courses have better ratings?--
SELECT c.Title, c.Price, AVG(e.Rating) AS AvgRating
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title, c.Price;

----Do cheaper courses have higher completion?--
SELECT c.Title, c.Price, AVG(e.CompletionPercent) AS AvgCompletion
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title, c.Price;

--Top 3 courses by revenue--
SELECT TOP 3 c.Title, SUM(c.Price) AS Revenue
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title
ORDER BY Revenue DESC;

----Instructor with most enrollments---
SELECT i.FullName, COUNT(e.EnrollmentID) AS TotalEnrollments
FROM Instructors i
JOIN Courses c ON i.InstructorID = c.InstructorID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY i.FullName
ORDER BY TotalEnrollments DESC;

-----Course with lowest completion rate---
SELECT c.Title, AVG(e.CompletionPercent) AS AvgCompletion
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title
ORDER BY AvgCompletion;

----Category with highest average rating.--
SELECT cat.CategoryName, AVG(e.Rating) AS AvgRating
FROM Categories cat
JOIN Courses c ON cat.CategoryID = c.CategoryID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY cat.CategoryName
ORDER BY AvgRating DESC;

---Student enrolled in most courses---
SELECT s.FullName, COUNT(e.CourseID) AS TotalCourses
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.FullName
ORDER BY TotalCourses DESC;




SElect* from Enrollments
select* from Courses














