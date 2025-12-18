create database CollegeDDBb11;
USE CollegeDDBb11;
CREATE Table Faculty1 (
    F_ID INT Primary KEY,
    Name Varchar(50),
    Mobile_no Varchar(15),
    Salary DecimaL(10,2),
    Department_id int
);
Create table Subject1 (
    Subject_id int Primary KEY Identity(1,1),
    Subject_name Varchar(50),
    F_ID int,
    Foreign KEY (F_ID) References Faculty1(F_ID)
);
Create table Hostel1 (
    Hostel_id int primary KEY,
    Pin_code Varchar(10),
    Hostel_name Varchar(40),
    City Varchar(40),
    No_of_seats int,
    State Varchar(40)
);
Create table Hostel_address1 (
    Address Varchar(90),
    Hostel_id int,
    Primary KEY (Address, Hostel_id),
    Foreign KEY (Hostel_id) References Hostel1(Hostel_id)
);
Create table Department1 (
    Department_id int Primary KEY,
    D_name Varchar(30)
);
Create table Exam1 (
    Exam_code int primary KEY,
    Department_id int,
    Time Time,
    Room Varchar(10),
    Date Date,
    Foreign KEY (Department_id) References Department1(Department_id)
);
Create table Course1 (
    Course_id int primary KEY,
    Course_name Varchar(40),
    Duration Varchar(20),
    Department_id int,
    Foreign KEY (Department_id) References Department1(Department_id)
);
Create table Student1 (
    S_id int primary KEY,
    F_name Varchar(30),
    L_name Varchar(30),
    Phone_no Varchar(10),
    DOB Date,
    Department_id int,
    Hostel_id int,
    Foreign KEY (Department_id) References Department1(Department_id),
    Foreign KEY (Hostel_id) References Hostel1(Hostel_id)
);
Create table Subject_Student1 (
    Subject_id int,
    S_id int,
    Primary KEY (Subject_id, S_id),
    Foreign KEY (Subject_id) References Subject1(Subject_id),
    Foreign KEY (S_id) References Student1(S_id)
);
Create table Student_Exam1 (
    S_ID int,
    Exam_code int,
    Primary KEY (S_ID, Exam_code),
    Foreign KEY (S_ID) References Student1(S_id),
    Foreign KEY (Exam_code) References Exam1(Exam_code)
);
Insert into Faculty1 (F_ID, Name, Mobile_no, Salary, Department_id)
VALUES (1, 'technology', 99999, 500, 101),
(2,'sur',8888,600,102),
(3,'Muscat',7777,400,103),
(4,'Sohar',6666,800,104);
insert into Subject1 (Subject_name, F_ID)
VALUES ( 'Mathematics', 1),
('English',2),
('IT',3),
('Arabic',4);
INSERT INTO Hostel1 (Hostel_id, Pin_Code, Hostel_name, City, No_of_seats , State)
VALUES
(2, 124, 'muscat Hostel', 'Muscat', 200, 'Oman'),
(3, 125, 'ibri Hostel', 'Ibri', 300, 'Oman'),
(4, 126, 'brimi Hostel', 'Brimi', 400, 'Oman')
Insert into Hostel_address1 (Address, Hostel_id)
VALUES 
('111 Muscat Street', 2),
('455 Ibri Road', 3),
('788 Brimi Avenue', 4);
Insert into Department1 (Department_id, D_name)
VALUES
    (1, 'Computer Science'),
    (2, 'Mathematics'),
    (3, 'Physics'),
    (4, 'Chemistry');
	Insert Into Exam1 (Exam_code, Department_id, Time, Room, Date) 
VALUES 
(101, 1, '02:00', 'room1', '2021-01-20'),
(102, 2, '05:00','room2', '2022-01-21'),
(103, 3, '06:00','room3', '2023-01-22'),
(104, 4, '07:00','room3','2000-02-23');
Insert into Course1 (Course_id, Course_name, Duration, Department_id)
VALUES
(201, 'Database Systems', '2 Months', 1),
(202, 'Web Development', '3 Months', 2),
(203, 'Software Engineering', '4 Months', 3),
(204,'Network web', '5 Months',4);
Insert into Student1
(S_id, F_name, L_name, Phone_no, DOB, Department_id, Hostel_id)
VALUES
(1, 'Ahmed', 'Salim', '91299', '2000-05-10', 1, 2),
(2, 'Fatma', 'Ali', '92345', '2001-11-22', 2, 3),
(3, 'Hassan', 'Khalid', '93456', '2002-03-15', 3, 4);
Insert INTO Subject_Student1 ( Subject_id,S_id)
VALUES
( 1,1),
( 2,2),
( 3,3);
Insert into  Student_Exam1 (S_ID, Exam_code)
VALUES
(1, 101),
(2, 102),
(3, 103);







select * from Course1

    

