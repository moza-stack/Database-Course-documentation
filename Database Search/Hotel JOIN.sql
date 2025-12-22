---Hotel Database – JOIN Queries---
---Display hotel ID, name, and the name of its manager--
SELECT b.BranchID, b.Name AS HotelName, s.Name AS ManagerName
FROM Branch b
JOIN Staff s ON b.BranchID = s.BranchID
WHERE s.JobTitle = 'Manager';

---Display hotel names and the rooms available under them.--
SELECT b.Name AS HotelName, r.RoomNumber, r.Type, r.NightRate
FROM Branch b
JOIN Rooms r ON b.BranchID = r.BranchID;

---Display guest data along with the bookings they made.---
SELECT c.CustomerID, c.Name AS GuestName, c.Email, c.Phone, 
       b.CheckIn, b.CheckOut
FROM Customer c
JOIN Booking b ON c.CustomerID = b.CustomerID;

---Display bookings for hotels in 'Hurghada' or 'Sharm El Sheikh'--
SELECT b.Name AS HotelName, bk.CheckIn, bk.CheckOut, c.Name AS GuestName
FROM Branch b
JOIN Rooms r ON b.BranchID = r.BranchID
JOIN Rooms_Booking rb ON r.RoomNumber = rb.RoomNumber
JOIN Booking bk ON rb.CheckIn = bk.CheckIn AND rb.CheckOut = bk.CheckOut
JOIN Customer c ON bk.CustomerID = c.CustomerID
WHERE b.Location IN ('Hurghada', 'Sharm El Sheikh');

---Display all room records where room type starts with "S" (e.g., "Suite", "Single")--
SELECT * 
FROM Rooms
WHERE Type LIKE 'S%';

---List guests who booked rooms priced between 1500 and 2500 LE--
SELECT DISTINCT c.Name AS GuestName, r.RoomNumber, r.NightRate
FROM Customer c
JOIN Booking b ON c.CustomerID = b.CustomerID
JOIN Rooms_Booking rb ON b.CheckIn = rb.CheckIn AND b.CheckOut = rb.CheckOut
JOIN Rooms r ON rb.RoomNumber = r.RoomNumber
WHERE r.NightRate BETWEEN 1500 AND 2500;

---Retrieve guest names who have bookings marked as 'Confirmed' in hotel "Hilton Downtown"--
SELECT DISTINCT c.Name AS GuestName
FROM Customer c
JOIN Booking b ON c.CustomerID = b.CustomerID
JOIN Rooms_Booking rb ON b.CheckIn = rb.CheckIn AND b.CheckOut = rb.CheckOut
JOIN Branch br ON rb.BranchID = br.BranchID
WHERE br.Name = 'Hilton Downtown' 
  AND rb.AVA_Room = 'Yes';

  --Find guests whose bookings were handled by staff member "Mona Ali"---
  SELECT DISTINCT c.Name AS GuestName
FROM Customer c
JOIN Booking b ON c.CustomerID = b.CustomerID
JOIN Staff_Booking sb ON b.CheckIn = sb.CheckIn AND b.CheckOut = sb.CheckOut
JOIN Staff s ON sb.StaffID = s.StaffID
WHERE s.Name = 'Mona Ali';

----Display each guest’s name and the rooms they booked, ordered by room type---
SELECT c.Name AS GuestName, r.RoomNumber, r.Type
FROM Customer c
JOIN Booking b ON c.CustomerID = b.CustomerID
JOIN Rooms_Booking rb ON b.CheckIn = rb.CheckIn AND b.CheckOut = rb.CheckOut
JOIN Rooms r ON rb.RoomNumber = r.RoomNumber
ORDER BY r.Type;

--For each hotel in 'Cairo', display hotel ID, name, manager name, and contact info--
SELECT b.BranchID, b.Name AS HotelName, s.Name AS ManagerName, s.Salary
FROM Branch b
JOIN Staff s ON b.BranchID = s.BranchID
WHERE b.Location = 'Cairo' AND s.JobTitle = 'Manager';

--Display all staff members who hold 'Manager' positions--
SELECT * 
FROM Staff
WHERE JobTitle = 'Manager';

--Display all guests and their reviews, even if some guests haven't submitted any reviews--
SELECT c.Name AS GuestName, r.ReviewText
FROM Customer c
LEFT JOIN Reviews r ON c.CustomerID = r.CustomerID;
----not have Reviews---
SElect* from Staff

