create database HotelDB;
USE HotelDB;
Create table Branch (
    BranchID int Primary KEY identity(1,1),
    Name Varchar(40),
    Location VARCHAR(40)
);
Create table Rooms (
    RoomNumber int Primary key,
    BranchID int,
    Type VARCHAR(40),
    NightRate Decimal(10,2),
    Foreign key (BranchID) references Branch(BranchID)
    );
Create table Customer (
    CustomerID int Primary KEY,
    Name Varchar(50),
    Email Varchar(50),
    Phone Varchar(20),
);
Create table Booking (
    CheckIn Date,
    CheckOut Date,
    CustomerID int,
    Primary KEY (CheckIn, CheckOut),
    Foreign KEY (CustomerID) REFERENCES Customer(CustomerID)
);
Create table Staff (
    StaffID int Primary KEY,
    Name Varchar(30),
    JobTitle Varchar(30),
    Salary Decimal(10,2),
    BranchID int,
    Foreign KEY (BranchID) REFERENCES Branch(BranchID)
);
CREATE TABLE Staff_Booking (
    StaffID INT,
    CheckIn DATE,
    CheckOut DATE,
    Primary KEY (StaffID, CheckIn, CheckOut),
    Foreign KEY (StaffID) REFERENCES Staff(StaffID),
    Foreign KEY (CheckIn, CheckOut) REFERENCES Booking(CheckIn, CheckOut)
);
CREATE TABLE Rooms_Booking (
    RoomNumber INT,
    BranchID INT,
    CheckIn DATE,
    CheckOut DATE,
    AVA_Room VARCHAR(10),
    Primary KEY (RoomNumber, BranchID, CheckIn, CheckOut),
    Foreign KEY (RoomNumber) REFERENCES Rooms(RoomNumber),
    Foreign KEY (CheckIn, CheckOut) REFERENCES Booking(CheckIn, CheckOut)
);
Insert into Branch ( location, name)
VALUES 
('Oman', 'Melenyoom Hotel'),
('Emarat', 'ALSHARQA'),
('USA', 'ALmadeena'),
('Egept','ALmanssora');
Insert into  Rooms (roomNumber,BranchId,type, nightRate)
VALUES
(101, 1, 'Single', 1),
(102, 2, 'Double', 2),
(201, 3, 'Single', 3),
(202,4,'Single',4);
Insert into  Customer (CustomerID,Name, Email, Phone)
VALUES
(1, 'zahrah','zahrah@hotmail.com','99987'),
(2, 'moza','moza@hotmail.com','99965'),
(3,'fatma', 'fatma@hotmail.com','9955'),
(4,'Bayan' ,'bayan@hotmail.com','99333');
Insert into Booking (CheckIn, CheckOut, CustomerID)
VALUES
('2024-12-20', '2024-12-22', 1),
('2024-12-21', '2024-12-23', 2),
('2024-01-01','2024-01-05' ,3),
('2024-05-07' ,'2024-05-07' ,4);
Insert into Staff (StaffID,Name ,jobTitle, Salary, BranchID)
VALUES
(1, 'mohammed', 'Receptionist',400, 1),
(2, 'Ahmeed', 'Manager',300, 2),
(3,'AbdALRahman', 'Teacher',700,3),
(4,'Mobark','Doctor',900,4);
Insert into Staff_Booking (StaffID, CheckIn, CheckOut)
VALUES
(1, '2024-12-20', '2024-12-22'),
(2, '2024-12-21', '2024-12-23'),
(3, '2024-01-01','2024-01-05'),
(4 ,'2024-05-07' ,'2024-05-07');
Insert into Rooms_Booking ( RoomNumber, BranchID ,CheckIn, CheckOut, AVA_Room  )
VALUES
(101, 1,'2024-12-20', '2024-12-22', 'Yes'),
(102,2,'2024-12-21', '2024-12-23', 'No'),
(201,3,'2024-01-01','2024-01-05','YES'),
(202,4,'2024-05-07' ,'2024-05-07','NO');




