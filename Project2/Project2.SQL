create  Database Project2;
use Project2;

Create TABLE Library (
    LibraryID INT PRIMARY KEY,
    LibraryName NVARCHAR(100) NOT NULL,
    Location NVARCHAR(150)
);

Create TABLE Members (
    MemberID INT PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    JoinDate DATE
);

Create TABLE Staff (
    StaffID INT PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50),
    LibraryID INT,
    FOREIGN KEY (LibraryID) REFERENCES Library(LibraryID)
);

Create TABLE Book (
    BookID INT PRIMARY KEY,
    Title NVARCHAR(150) NOT NULL,
    ISBN NVARCHAR(20),
    Genre NVARCHAR(50),
    Status NVARCHAR(20), 
    LibraryID INT,
    FOREIGN KEY (LibraryID) REFERENCES Library(LibraryID)
);

Create TABLE Loan (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    Status NVARCHAR(20),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

Create TABLE Payment (
    PaymentID INT PRIMARY KEY,
    LoanID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    FOREIGN KEY (LoanID) REFERENCES Loan(LoanID)
);

Create TABLE Review (
    ReviewID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    Rating INT ,
    Comment NVARCHAR(244),
    ReviewDate DATE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

Insert into Library (LibraryID, LibraryName, Location)
VALUES
(1, 'Central Library', 'Muscat'),
(2, 'Science Library', 'Sohar'),
(3,' Math Library', 'ALRustaq'),
(4, ' Islamic Library', 'Nizwa');

Insert  into Members (MemberID, FullName, Email, Phone, JoinDate)
VALUES
(1, 'Fatma Al-Mamari', 'fatma@gmail.com', '96891234567', '2025-01-15'),
(2, 'Salim Al-Balushi', 'salim@gmail.com', '96892345678', '2025-03-10'),
(3, 'Aisha Al-Rashdi', 'aisha@gmail.com', '96893456789', '2025-06-01'),
(4,' Basma AL-Rajhi' , 'basma@gmail.com', '9876666666', '2025-06-02'),
(5, 'Moza AL-Mamari', 'Moza@gmail.com', '987766778', '2025-07-09'),
(6,'Hamed AL-Balushi','Hamed@gmail.com','98765467', '2025-08-10'),
(7,'Jokah AL-Salmi', 'Jokah@gmail.com', '9876543', '2025-09-11'),
(8, 'Houda AL-Rajhi' , 'Houda@gmail.com', '9987665','2025-10-12'),
(9, 'Omar AL-Senani', 'Omar@gmail.com' ,'965432455', '2025-11-13'),
(10,'Hassan AL-Badri','Hassan@gmail.com','99876544','2025-12-14');

Insert into Staff (StaffID, FullName, Position, LibraryID)
VALUES
(1, 'Ahmed Al-Hinai', 'Librarian', 1),
(2, 'Mona Al-Kindi', 'Assistant', 2),
(3,'Zahrah AL-Saidi', 'Manager',3),
(4,'Bader AL-Badri', 'Librarian',4);

Insert into Book (BookID, Title, ISBN, Genre, Status, LibraryID)
VALUES
(1, 'Database Systems', '978-0133970777', 'Technology', 'Available', 1),
(2, 'Clean Code', '978-0132350884', 'Programming', 'Issued', 1),
(3, 'Physics Basics', '978-0321780097', 'Science', 'Available', 2),
(4, 'Introduction to Algorithms', '978-0262033848', 'Technology', 'Issued', 3),
(5, 'Operating System Concepts', '978-1118063330', 'Technology', 'Available', 4),
(6, 'Artificial Intelligence', '978-0136042594', 'Technology', 'Available', 3),
(7, 'Discrete Mathematics', '978-0073383095', 'Mathematics', 'Issued', 2),
(8, 'Computer Networks', '978-0132126953', 'Technology', 'Available', 1),
(9, 'Data Science Handbook', '978-1491912058', 'Data Science', 'Issued', 3),
(10, 'Software Engineering', '978-0132350881', 'Programming', 'Available', 2),
(11, 'Web Development Basics', '978-1491950296', 'Programming', 'Available', 1),
(12, 'Cyber Security Essentials', '978-1119097891', 'Security', 'Issued', 3),
(13, 'Machine Learning Guide', '978-1449369415', 'Technology', 'Available', 2),
(14, 'Cloud Computing', '978-0134757599', 'Technology', 'Available', 4),
(15, 'Digital Electronics', '978-0073380643', 'Electronics', 'Issued', 1),
(16, 'Linear Algebra', '978-0321982385', 'Mathematics', 'Available', 2),
(17, 'Big Data Analytics', '978-0134468651', 'Data Science', 'Issued', 3),
(18, 'Mobile App Development', '978-0134685991', 'Programming', 'Available', 1),
(19, 'Software Testing', '978-0321774096', 'Programming', 'Available', 2),
(20, 'Computer Architecture', '978-0128119051', 'Technology', 'Issued', 3);

Insert into Loan (LoanID, BookID, MemberID, LoanDate, DueDate, ReturnDate, Status)
VALUES
(1,  1,  1, '2024-01-05', '2024-01-20', '2024-01-18', 'Returned'),
(2,  2,  2, '2024-01-07', '2024-01-22', NULL,         'Issued'),
(3,  3,  3, '2024-01-10', '2024-01-25', '2024-01-24', 'Returned'),
(4,  4,  4, '2024-01-12', '2024-01-27', NULL,         'Overdue'),
(5,  5,  5, '2024-01-15', '2024-01-30', NULL,         'Issued'),
(6,  6,  6, '2024-02-01', '2024-02-16', '2024-02-14', 'Returned'),
(7,  7,  7, '2024-02-03', '2024-02-18', NULL,         'Issued'),
(8,  8,  8, '2024-02-05', '2024-02-20', NULL,         'Overdue'),
(9,  9,  9, '2024-02-07', '2024-02-22', '2024-02-21', 'Returned'),
(10, 10, 10, '2024-02-10', '2024-02-25', NULL,         'Issued'),
(11, 11, 1, '2024-02-12', '2024-02-27', '2024-02-26', 'Returned'),
(12, 12, 2, '2024-02-15', '2024-03-01', NULL,         'Issued'),
(13, 13, 3, '2024-02-18', '2024-03-04', NULL,         'Overdue'),
(14, 14, 4, '2024-02-20', '2024-03-06', '2024-03-05', 'Returned'),
(15, 15, 5, '2024-02-22', '2024-03-08', NULL,         'Issued');

Insert into  Payment (PaymentID, LoanID, Amount, PaymentDate)
VALUES
(1, 1, 5.00, '2024-12-10'),
(2,2,4.00,'2024-11-12'),
(3,3, 3.00, '2024-01-11'),
(4,4,5.00,'2024-02-12');

Insert into  Review (ReviewID, BookID, MemberID, Rating, Comment, ReviewDate)
VALUES
(1, 1, 1, 5, 'Excellent reference book', '2024-11-26'),
(2, 2, 2, 4, 'Very useful for clean coding practices', '2024-12-05'),
(3,3,3,6, 'Excellent reference book' ,'2024-01-06'),
(4,4,4,7,'Very useful for clean coding practices','2024-02-07');


--1. Library Book Inventory Report--
SELECT 
    l.LibraryName,
    COUNT(b.BookID) AS TotalBooks,
    SUM(CASE WHEN b.Status = 'Available' THEN 1 ELSE 0 END) AS AvailableBooks,
    SUM(CASE WHEN b.Status IN ('Issued', 'Overdue') THEN 1 ELSE 0 END) AS BooksOnLoan
FROM Library l
LEFT JOIN Book b ON l.LibraryID = b.LibraryID
GROUP BY l.LibraryName;

---2--Active Borrowers Analysis---

SELECT 
    m.FullName AS MemberName,
    m.Email,
    b.Title AS BookTitle,
    l.LoanDate,
    l.DueDate,
    l.Status
FROM Loan l
JOIN Members m ON l.MemberID = m.MemberID
JOIN Book b ON l.BookID = b.BookID
WHERE l.Status IN ('Issued', 'Overdue');

--3-Overdue Loans with Member Details----
SELECT 
    m.FullName AS MemberName,
    m.Phone,
    b.Title AS BookTitle,
    lib.LibraryName,
    DATEDIFF(DAY, l.DueDate, GETDATE()) AS DaysOverdue,
    ISNULL(p.Amount, 0) AS FinePaid
FROM Loan l
JOIN Members m ON l.MemberID = m.MemberID
JOIN Book b ON l.BookID = b.BookID
JOIN Library lib ON b.LibraryID = lib.LibraryID
LEFT JOIN Payment p ON l.LoanID = p.LoanID
WHERE l.Status = 'Overdue';

--4. Staff Performance Overview--
Select
    lib.LibraryName,
    s.FullName AS StaffName,
    s.Position,
    Count(b.BookID) AS BooksManaged
FROM Staff s
JOIN Library lib ON s.LibraryID = lib.LibraryID
LEFT JOIN Book b ON lib.LibraryID = b.LibraryID
GROUP BY lib.LibraryName, s.FullName, s.Position;

---5- Book Popularity Repor---
Select 
    b.Title,
    b.ISBN,
    b.Genre,
    Count(l.LoanID) AS TotalLoans,
    AVG(r.Rating) AS AvgRating
FROM Book b
JOIN Loan l ON b.BookID = l.BookID
LEFT JOIN Review r ON b.BookID = r.BookID
GROUP BY b.BookID, b.Title, b.ISBN, b.Genre
HAVING COUNT(l.LoanID) >= 3;

--6-Member Reading History---
SELECT 
    m.FullName AS MemberName,
    b.Title AS BookTitle,
    l.LoanDate,
    l.ReturnDate,
    r.Rating,
    r.Comment
FROM Members m
JOIN Loan l ON m.MemberID = l.MemberID
JOIN Book b ON l.BookID = b.BookID
LEFT JOIN Review r ON m.MemberID = r.MemberID AND b.BookID = r.BookID
ORDER BY m.FullName, l.LoanDate;

--7- Revenue Analysis by Genre---
SELECT 
    b.Genre,
    count(l.LoanID) AS TotalLoans,
    SUM(ISNULL(p.Amount, 0)) AS TotalFines,
    AVG(ISNULL(p.Amount, 0)) AS AvgFinePerLoan
FROM Book b
JOIN Loan l ON b.BookID = l.BookID
LEFT JOIN Payment p ON l.LoanID = p.LoanID
GROUP BY b.Genre;


---8-Monthly Loan Statistics-----
Select 
    Datename(month, LoanDate) AS MonthName,
    Count(*) AS TotalLoans,
    SUM(CASE WHEN Status = 'Returned' THEN 1 ELSE 0 END) AS TotalReturned,
    SUM(CASE WHEN Status IN ('Issued','Overdue') THEN 1 ELSE 0 END) AS TotalActiveLoans
FROM Loan
WHERE YEAR(LoanDate) = YEAR(GETDATE())
GROUP BY DATENAME(MONTH, LoanDate), MONTH(LoanDate)
ORDER BY MONTH(LoanDate);

---9- Member Engagement Metrics----
SELECT 
    m.MemberID,
    m.FullName,
    Count(l.LoanID) AS TotalBooksBorrowed,
    SUM(CASE WHEN l.Status IN ('Issued','Overdue') THEN 1 ELSE 0 END) AS BooksCurrentlyOnLoan,
    COALESCE(SUM(p.Amount), 0) AS TotalFinesPaid,
    AVG(r.Rating) AS AverageRatingGiven
FROM Members m
JOIN Loan l ON m.MemberID = l.MemberID
LEFT JOIN Payment p ON l.LoanID = p.LoanID
LEFT JOIN Review r ON m.MemberID = r.MemberID
GROUP BY m.MemberID, m.FullName
HAVING Count(l.LoanID) >= 1
ORDER BY m.MemberID;

---10- Library Performance Comparison-----
SELECT 
    lib.LibraryName,
    Count(b.BookID) AS TotalBooksOwned,
    Count(DISTINCT l.MemberID) AS TotalActiveMembers,
   COALESCE (SUM(p.Amount), 0) AS TotalRevenueFromFines,
	CASE WHEN COUNT(DISTINCT l.MemberID) = 0 THEN 0
         ELSE COUNT(b.BookID)*1.0 / COUNT(DISTINCT l.MemberID) END AS AvgBooksPerMember
FROM Library lib
LEFT JOIN Book b ON lib.LibraryID = b.LibraryID
LEFT JOIN Loan l ON b.BookID = l.BookID
LEFT JOIN Payment p ON l.LoanID = p.LoanID
GROUP BY lib.LibraryName
ORDER BY lib.LibraryName;

