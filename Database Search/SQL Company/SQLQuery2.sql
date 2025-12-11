create database companyDB
use companyDB

create table employee(Employeeid int primary key,
Firstname varchar(50) not null,
Lastname varchar(50) not null,
Department varchar(50),
Salary Decimal(10,2)check(salary>0),)