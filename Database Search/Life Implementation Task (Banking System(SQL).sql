create database BankingDB ;
USE BankingDB;

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
CREATE TABLE Transactions (
TransactionsID INT PRIMARY KEY,
AccountID INT FOREIGN KEY REFERENCES Account(AccountID),
Amount DECIMAL(10, 2),
Type VARCHAR(10), 
TransactionsDate DATETIME
);
CREATE TABLE Loan (
LoanID INT PRIMARY KEY,
CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
LoanAmount DECIMAL(12, 2),
LoanType VARCHAR(50),
Status VARCHAR(20)
);

INSERT INTO Customer (CustomerID, FullName, Email, Phone, SSN)
VALUES
(1, 'Fatma almamri', 'fatma@gmail.com', '968998', '98765'),
(2, 'Salim Al-Balushi', 'salim@gmail.com', '96893456789', '456789123'),
(3, 'Aisha Al-Rashdi', 'aisha@gmail.com', '96894567890', '321654987'),
(4,' mohammed al sadi' , 'mohammed@gmail.com' , '987987' ,'677779');

Insert into  Account (AccountID, CustomerID, Balance, AccountType, Status)
VALUES
(1, 1, 2500.00, 'Savings', 'Active'),
(2, 2, 1500.50, 'Checking', 'Active'),
(3, 3, 0.00, 'Savings', 'Inactive'),
(4, 4, 0.40, 'Checking' , 'Active');

Insert into  Transactions (TransactionsID, AccountID, Amount, Type, TransactionsDate)
VALUES
(2, 1, 250.00, 'Deposit',  '2024-12-01 10:30:00'),
(3, 2, -50.00, 'Withdraw', '2024-12-05 14:15:00'),
(4, 3, 1000.00, 'Deposit', '2024-12-10 09:00:00'),
(5, 4, -200.00, 'Transfer','2024-12-15 16:45:00');

Insert into  Loan (LoanID, CustomerID, LoanAmount, LoanType, Status)
VALUES 
(1, 1, 4000.00, 'Personal', 'Approved'),
(2, 2, 12000.00, 'Home', 'Pending'),
(3, 3, 25000.00, 'Car', 'Rejected'),
(4,4, 15000.00, 'Home', 'Approved');

Create VIEW CustomerServiceView AS
Select 
    c.FullName AS CustomerName,
    c.Phone,
    a.Status AS AccountStatus
FROM 
    Customer c
JOIN 
    Account a
ON 
    c.CustomerID = a.CustomerID;

	Create VIEW FinanceDepartment AS
SELECT 
    AccountID,
    Balance,
    AccountType
FROM 
    Account;

	Create VIEW LoanOfficer AS
SELECT 
    LoanID,
    CustomerID,
    LoanAmount,
    LoanType,
    Status
FROM 
    Loan;

	Create VIEW TransactionSummary AS
SELECT 
    AccountID,
    Amount,
    TransactionsDate
FROM 
    Transactions
WHERE 
    TransactionsDate >= DATEADD(DAY, -30, GETDATE());

	
	













