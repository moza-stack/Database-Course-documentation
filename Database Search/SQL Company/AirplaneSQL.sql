create database AirplainDB
USE AirplainDB;
create table airport(airport_ID int primary key Identity(1,1),
state VARCHAR(20),
city varchar(40),
name varchar(30)
);
Create table AirplaneType (
    Type_name Varchar(40) Primary key,
	Company varchar(50),
    Max_seats INT,
    Airport_code int,
    FOREIGN KEY (Airport_code) REFERENCES airport(airport_ID)
);
Create table Airplane (
    Airplane_id int Primary key,
    Total_number_of_seats int,
    Type_name varchar(40),
    FOREIGN KEY (Type_name) REFERENCES AirplaneType(Type_name)
);
Create table Seat (
    Seat_no varchar(10),
    Airplane_id int,
    PRIMARY KEY (Seat_no, Airplane_id),
    FOREIGN KEY (Airplane_id) REFERENCES Airplane(Airplane_id)
);
Create table Customer (
    Customer_id int PRIMARY KEY,
    name varchar(50),
    phone int,
);
Create table Reservation (
    Customer_id int,
    Seat_no varchar(10),
    Airplane_id int,
    PRIMARY KEY (Customer_id, Seat_no, Airplane_id),
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
    FOREIGN KEY (Seat_no, Airplane_id) REFERENCES Seat(Seat_no, Airplane_id),
	);
	Create table Flight (
    code Varchar(10) PRIMARY KEY,
    amount decimal(10,2),
    Airline Varchar(40) ,
);
Create table FlightLog (
    Log_no int PRIMARY KEY,
    Airline Varchar(40), 
);
Create table Departure (
    Scheduled_dep_time Datetime,
    Log_no int,
    Airport_ID int ,
    PRIMARY KEY (Log_no, Airport_ID),
    FOREIGN KEY (Log_no) REFERENCES FlightLog(Log_no),
    FOREIGN KEY (Airport_ID) REFERENCES Airport(Airport_ID)
);
Create table Arrival (
    Date date,
    Airport_ID int,
    Arrival_time Datetime,
    PRIMARY KEY (Date, Airport_ID),
    FOREIGN KEY (Airport_ID) REFERENCES Airport(Airport_ID)
);
Create table Depart (
    Departure_time Datetime,
    Date Date,
    Airport_ID int,
    PRIMARY KEY (Date, Airport_ID),
    FOREIGN KEY (Airport_ID) REFERENCES Airport(Airport_ID)
);
Insert into  airport (state, city, name)
VALUES 
('Muscat', 'Muscat', 'muscat'),
('mosandam', 'alrustaq', 'mosandam'),
('Sohar', 'sohar', 'sohar'),
('Salalah', 'salalah','salalah');
Insert into AirplaneType (Type_name, Company, Max_seats, Airport_code)
VALUES
('muscat 737', 'muscat', 200, 1),
('sur A320', 'sur', 180, 2),
('sohar 747', 'sohar', 400, 3),
('suwaq E190', 'suwaq', 100, 4);
Insert into Airplane (Airplane_id, Total_number_of_seats, Type_name)
VALUES
(1, 150, 'muscat 737'),
(2, 220, 'sur A320'),
(3,330,'sohar 747'),
(4,340,'suwaq E190');
Insert into Seat (Seat_no, Airplane_id)
VALUES
('2c', 1),
('1B', 2),
('1C', 3),
('2A', 4);
insert into Customer (Customer_id, name, phone)
VALUES
(1, 'Moza', 123456),
(2, 'Ahmed', 987659),
(3, 'Fatma', 666777),
(4,'Maha',99988);
Insert into Reservation (Customer_id, Seat_no, Airplane_id)
VALUES
(1, '2c', 1),
(2, '1B', 2),
(3, '1C', 3),
(4,'2A',4);
Insert into  Flight (code, amount, Airline)
VALUES
('FL1', 160.50, 'Oman Air'),
('FL2', 220.75, 'Emirates'),
('FL3', 180.00, 'Qatar Airways'),
('FL4',190.00,'Bahren Air');
Insert into  FlightLog (Log_no, Airline)
VALUES
(1, 'Emirates'),
(2, 'Qatar Airways'),
(3, 'Oman Air'),
(4,'Bahren Air');
Insert into Departure (Scheduled_dep_time, Log_no, Airport_ID)
VALUES
('2026-11-20 05:30:00', 1, 1),
('2026-12-20 12:45:00', 2, 2),
('2026-01-21 09:15:00', 3, 3),
('2026-02-22 10:15:00' , 4, 4);
Insert into  Arrival (Date, Airport_ID, Arrival_time)
VALUES 
('2024-11-01', 1, '2024-11-04 14:30:00'),
('2024-12-02', 2, '2024-12-05 15:45:00'),
('2024-01-03' ,3 , '2024-01-05 01:15:00'),
('2024-02-06',4, '2024-02-10 02:15:00');
Insert into  Depart (Departure_time, Date, Airport_ID)
VALUES ('2025-12-16 10:30:00', '2025-12-16', 1),
('2025-01-15 11:30:00' , '2025-01-17',2),
('2025-02-16 12:30:00' , '2025-02-18' ,3),
('2025-03-17 01:30:00' , '2025-03-19' ,4);















