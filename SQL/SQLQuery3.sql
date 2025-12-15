create database BankDBB
use BankDBB
create table branch(branchid int primary key Identity(1,1),
address VARCHAR(20),
Phone_number int,
);
CREATE TABLE customer(customerID int primary key Identity(1,1),
phone_num int,
date_brith date,
name varchar(30),
address varchar(30),
);
create table account(account_num int primary key identity(1,1),
dataofCreation DATE,
balance decimal,
accountType varchar(30)
customerID  INT,
Foreign key (customer ID) REFERENCES customer(customer ID)
);

    

