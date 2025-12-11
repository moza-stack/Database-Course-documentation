create database TrainingCompany
Use TrainingCompany
create table  Employee
(
Fname nvarchar(20) not null,
	Mname nvarchar(20),
	Lname nvarchar(20) not null,
	Ssn int primary key identity(1,1 ),
	Bdate date,
	EmployeeAddress nvarchar(100),
	Gender bit default 0,
	Salary int CONSTRAINT CK_Employee_Salary check(Salary between 500 and 3500),
	Super_ssn int,
	foreign key (Super_ssn) references Employee(Ssn)
)
create table Department
(
	Dname nvarchar(20) not null,
	Dnumber int primary key identity(1, 1),
	Mgr_ssn int,
	Mgr_start_date date not null,
	foreign key (Mgr_ssn) references Employee(Ssn)
)