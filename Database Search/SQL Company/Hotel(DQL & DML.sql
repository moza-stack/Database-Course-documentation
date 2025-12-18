---Hotel---
--Display all guest records---
SELECT * 
FROM guest;
---Display each guest’s name, contact number, and proof ID type.---
SELECT GuestName, ContactNumber, ProofIDType
FROM Guests;
---Display all bookings with booking date, status, and total cost--
SELECT 
    BookingDate,
    Status,
    TotalCost
FROM 
    Bookings;
	-----Display each room number and its price per night as NightlyRate--
	SELECT RoomNumber, PricePerNight AS NightlyRate
FROM Rooms;
--List rooms priced above 1000 per night--
--Display staff members working as 'Receptionist'.--
SELECT *
FROM Staff
WHERE Position = 'Receptionist';
----Display bookings made in 2024--
SELECT *
FROM Booking
WHERE YEAR(BookingDate) = 2024;
--Display bookings ordered by total cost descending--
SELECT *
FROM Booking
ORDER BY TotalCost DESC;
----Display the maximum, minimum, and average room price--
SELECT 
    MAX(PricePerNight) AS MaxPrice,
    MIN(PricePerNight) AS MinPrice,
    AVG(PricePerNight) AS AvgPrice
FROM Rooms;
--Display total number of rooms--
SELECT COUNT(*) AS TotalRooms
FROM Rooms;
----Display guests whose names start with 'M'--
SELECT *
FROM Guests
WHERE FullName LIKE 'M%';
--- Display rooms priced between 800 and 1500--
SELECT *
FROM Rooms
WHERE PricePerNight BETWEEN 800 AND 1500;
--Update booking status to 'Completed' where checkout date is before today--
UPDATE Bookings
SET Status = 'Completed'
WHERE CheckoutDate < CAST(GETDATE() AS DATE);