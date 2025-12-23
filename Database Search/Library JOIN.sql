--Library Database – JOIN Queries--
--1. Display library ID, name, and the name of the manager.--
SELECT 
    l.LibraryID,
    l.Name AS LibraryName,
    s.FullName AS ManagerName
FROM Library l
JOIN Staff s
    ON l.LibraryID = s.LibraryID
WHERE s.Position = 'Archivist';

--Display library names and the books available in each one--
SELECT 
    l.Name AS LibraryName,
    b.Title AS BookTitle
FROM Library l
JOIN Book b
    ON l.LibraryID = b.LibraryID

	--Display all member data along with their loan history---
	SELECT 
    m.*,
    lo.LoanID,
    lo.LoanDate,
    lo.DueDate,
    lo.ReturnDate,
    lo.Status
FROM Members m
LEFT JOIN Loan lo
    ON m.MemberID = lo.MemberID;
	
	--Display all books located in 'Zamalek' or 'Downtown'.--
SELECT b.*
FROM Book b
JOIN Library l
    ON b.LibraryID = l.LibraryID
WHERE l.Location IN ('Muscat', 'Nizwa');

---Display all books whose titles start with 'A'--
SELECT *
FROM Book
WHERE Title LIKE 'A%';

---List members who borrowed books priced between 11 and 13 LE.--
SELECT  m.FullName
FROM Members m
JOIN Loan lo
    ON m.MemberID = lo.MemberID
JOIN Book b
    ON lo.BookID = b.BookID
WHERE b.Price BETWEEN 11 AND 13;

--Retrieve members who borrowed and returned books titled 'The Alchemist'--
SELECT  m.FullName
FROM Members m
JOIN Loan lo
    ON m.MemberID = lo.MemberID
JOIN Book b
    ON lo.BookID = b.BookID
WHERE b.Title = 'DATABASE';

---Find all members assisted by librarian "Sarah Fathy".--
SELECT  m.FullName
FROM Members m
JOIN Loan lo
    ON m.MemberID = lo.MemberID
JOIN Book b
    ON lo.BookID = b.BookID
JOIN Staff s
    ON b.LibraryID = s.LibraryID
WHERE s.FullName = 'Sara albloshi';
  
  
  --Display each member’s name and the books they borrowed, ordered by book title--
  SELECT 
    m.FullName,
    b.Title 
FROM Members m
JOIN Loan lo
    ON m.MemberID = lo.MemberID
JOIN Book b
    ON lo.BookID = b.BookID
ORDER BY b.Title;

--For each book located in 'Cairo Branch', show title, library name, manager, and shelf info--
SELECT 
    b.Title,
    l.Name ,
    s.FullName,
    b.ShelfLocation
FROM Book b
JOIN Library l
    ON b.LibraryID = l.LibraryID
JOIN Staff s
    ON l.LibraryID = s.LibraryID
WHERE l.Name = 'Library1';

--Display all staff members who manage libraries.---
SELECT *
FROM Staff
WHERE Position = 'Librarian';
  

  ---Display all members and their reviews, even if some didn’t submit any review yet.--

  SELECT 
    m.FullName,
    r.Comments,
    r.Rating,
    r.ReviewDate
FROM Members m
LEFT JOIN Review r
    ON m.MemberID = r.MemberID;


select* from Members
select* from Review
SELECT* FROM Book
Select* from Staff