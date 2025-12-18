--Bank Database – DQL & DML Tasks--
--Display all customer records--
SELECT * 
FROM customer;
--Display customer full name, phone, and membership start date--
SELECT FullName, PhoneNumber, MembershipStartDate
FROM customer;
--Display each loan ID, amoun,.--
SELECT loans_ID, amount;
FROM loans;
--Display account number and annual interest (5% of balance) as AnnualInterest--
SELECT 
    Accountnumber,
    Balance * 0.05 AS AnnualInterest
FROM 
    account;
	--List customers with loan amounts greater than 100000 LE--
	SELECT CustomerID, FullName, LoanAmount
FROM Loans
WHERE LoanAmount > 100000;
--List accounts with balances above 20000--
SELECT *
FROM account
WHERE Balance > 20000;
--Display accounts opened in 2023--
SELECT *
FROM account
WHERE YEAR(OpenDate) = 2023;
--Display customers with NULL phone numbers--
SELECT *
FROM customer
WHERE Phone IS NULL;

 --Insert another customer with NULL phone and address--
 INSERT INTO Customers (customerID, F_Name, Phone, Address)
VALUES (3002, 'John Doe', NULL, NULL);