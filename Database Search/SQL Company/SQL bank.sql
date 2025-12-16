create database BankDDBB
use BankDDBB;
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
accountType varchar(30),
customerID INT,
Foreign key (customerID) REFERENCES customer(customerID)
);
CREATE table transactions (transactions_ID int primary key,
Date date,
amount decimal,
withdrawals varchar(20),
deposits varchar(30),
transfers varchar(50),
Account_num int,
Foreign key (account_num) REFERENCES account(account_num)
);
create table employee(employee_ID INT PRIMARY KEY,
Position varchar(20),
name varchar(20),
);
create table loans(Loans_ID INT primary key,
type varchar(20),
amount decimal,
issue_data date,
employee_ID INT,
Customer_ID int,
FOREIGN KEY (employee_ID) REFERENCES employee(employee_ID),
FOREIGN KEY (Customer_ID) REFERENCES customer(customerID)
);
CREATE table customer_employee(
customerID INT ,
employee_ID INT,
oppening_account int,
processing_loans int,
Primary KEY (customerID, employee_ID),
    Foreign KEY (customerID) References customer(customerID),
    Foreign KEY (employee_ID) References employee(employee_ID)
);

Insert INTO branch (address, Phone_number)
VALUES 
('sohar Main Street', '2444'),
('Seeb Industrial Area', '2451'),
('Salalah Downtown', '2456'),
('Rustaq street','3434');
Insert INTO customer (phone_num,date_brith , name, address)
VALUES 
('96512', '1880-05-20', 'Moza', 'Muscat'),
('96895', '1985-12-15', 'Ahmed', 'Salalah'),
('96755', '1990-07-30', 'Fatma', 'Sohar');
Insert INTO account (dataofCreation , balance, accountType, customerID)
VALUES 
('2022-12-15', 100.00, 'Savings', 1),
('2023-12-15', 600.50, 'Checking', 2),
('2025-12-15', 1500.75, 'Savings', 3);
Insert into transactions
(transactions_ID, Date, amount, withdrawals, deposits, transfers, account_num)
VALUES
(1, '2000-11-15', 500.00, 'ATM', NULL, NULL, 1),
(2,'1988-02-11', 600.00 ,'cash', NULL ,NULL ,2),
(3,'2001-03-12', 700.00, 'Cheque' ,NULL,NULL ,3);
Insert into employee (employee_ID, Position, name)
VALUES (1, 'Manager', 'Ali'),
(2, 'Supervisor' , 'Sami'),
(3, 'Director' , 'Ahmed'),
(4, 'Assistant Manager', 'Hameed');
Insert into  loans
(Loans_ID, type, amount, issue_data, employee_ID, Customer_ID)
VALUES
(1, 'Home Loan', 4000.00, '2020-05-10', 1, 1),
(2 ,'Vehicle Loan',5000.00 , '2000-02-11' ,2 ,2),
(3 ,'Personal Loan',3000.00 ,'1999-01-01' ,3 ,3),
(4 ,'Business Loan',2000.00 ,'1998-01-10' ,4 ,3);
Insert into customer_employee
(customerID, employee_ID, oppening_account, processing_loans)
VALUES
(1, 1, 3, 4),
(2, 2, 4, 5),
(3,3,5 ,6);






