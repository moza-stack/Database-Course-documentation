create database Banking ;
USE Banking;

CREATE TABLE Customer (
CustomerID INT PRIMARY KEY,
FullName NVARCHAR(100),
Email NVARCHAR(100),
Phone NVARCHAR(15),
SSN CHAR(9)
);
CREATE TABLE Account (
AccountID INT PRIMARY KEY,
CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
Balance DECIMAL(10, 2),
AccountType VARCHAR(50),
Status VARCHAR(20)
);
CREATE TABLE Transaction (
TransactionID INT PRIMARY KEY,
AccountID INT FOREIGN KEY REFERENCES Account(AccountID),
Amount DECIMAL(10, 2),
Type VARCHAR(10), 
TransactionDate DATETIME
);
CREATE TABLE Loan (
LoanID INT PRIMARY KEY,
CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
LoanAmount DECIMAL(12, 2),
LoanType VARCHAR(50),
Status VARCHAR(20)
);

CREATE VIEW vw_CustomerService
AS
SELECT 
    c.FullName,
    c.Phone,
    a.Status AS AccountStatus
FROM Customer c
JOIN Account a
    ON c.CustomerID = a.CustomerID;

Create view vw_FinanceAccounts
AS
Select
    AccountID,
    Balance,
    AccountType
FROM Account;

Create view vw_LoanOfficer
AS
select
    LoanID,
    CustomerID,
    LoanAmount,
    LoanType,
    Status
FROM Loan;

Create view  vw_Transactionssummary
AS
Select
    AccountID,
    Amount,
    TransactionDate
From Transaction
WHERE 