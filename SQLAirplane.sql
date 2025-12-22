--Display each flight leg's no, airline, and the name of the airplane assigned to it--
 SELECT fl.Log_no AS FlightLogID,
       d.Scheduled_dep_time AS DepartureTime,
       a.Type_name AS AirplaneType
FROM FlightLog fl
JOIN Departure d ON fl.Log_no = d.Log_no
JOIN Airplane a ON a.Airplane_id = fl.Log_no;
	
	---Display all flight numbers and the names of the departure and arrival airports.---
	SELECT f.code AS FlightNumber,
       dep_air.name AS DepartureAirport,
       arr_air.name AS ArrivalAirport
FROM Flight f
JOIN Departure d ON f.code = d.Log_no
JOIN Airport dep_air ON d.Airport_ID = dep_air.airport_ID
JOIN Arrival a ON f.code = d.Airport_ID
JOIN Airport arr_air ON a.Airport_ID = arr_air.airport_ID;

---Display all reservation data with the name and phone of the customer who made each booking---
SELECT r.Customer_id, c.name, c.phone, r.Seat_no, r.Airplane_id
FROM Reservation r
JOIN Customer c ON r.Customer_id = c.Customer_id;

---Display IDs and locations of flights departing from 'CAI' or 'DXB'.--
SELECT d.Log_no, a.city, a.state
FROM Departure d
JOIN Airport a ON d.Airport_ID = a.airport_ID
WHERE a.name IN ('CAI', 'DXB');

----Display full data of flights whose names start with 'A'.---
SELECT *
FROM Flight
WHERE code LIKE 'A%';

---List customers who have bookings with total payment between 3000 and 5000.---
SELECT c.Customer_id, c.name, SUM(f.amount) AS TotalPayment
FROM Customer c
JOIN Reservation r ON c.Customer_id = r.Customer_id
JOIN Flight f ON r.Airplane_id = Airplane_id 
GROUP BY c.Customer_id, c.name
HAVING SUM(f.amount) BETWEEN 3000 AND 5000;

--Retrieve all passengers on 'Flight 110' who booked more than 2 seats.---
SELECT c.name, COUNT(*) AS SeatsBooked
FROM Reservation r
JOIN Customer c ON r.Customer_id = c.Customer_id
JOIN Flight f ON r.Airplane_id = f.code  
WHERE f.code = 'Flight 110'
GROUP BY c.name
HAVING COUNT(*) > 2;
----Find names of passengers whose booking was handled by agent "Youssef Hamed".---
---not have agent---

---Display each passenger’s name and the flights they booked, ordered by flight date--
SELECT c.name, f.code AS FlightNumber, dep.Scheduled_dep_time
FROM Customer c
JOIN Reservation r ON c.Customer_id = r.Customer_id
JOIN Flight f ON r.Airplane_id = f.amount 
JOIN Departure dep ON dep.Log_no = f.amount
ORDER BY dep.Scheduled_dep_time;

----For each flight departing from 'Cairo', display the flight number, departure time, and airline name.---
SELECT f.code, d.Scheduled_dep_time, f.Airline
FROM Flight f
JOIN Departure d ON f.code = d.Log_no
JOIN Airport a ON d.Airport_ID = a.airport_ID
WHERE a.city = 'Cairo';

---Display all staff members who are assigned as supervisors for flights.---
----No staff---

--Display all bookings and their related passengers, even if some bookings are unpaid---

SELECT c.name, c.phone, r.Seat_no, r.Airplane_id
FROM Customer c
LEFT JOIN Reservation r ON c.Customer_id = r.Customer_id;
select* from Reservation
SELECT* FROM Customer