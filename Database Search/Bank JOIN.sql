--Display branch ID, name, and the name of the employee who manages it--

ALTER TABLE employee
ADD BranchID INT;
ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_BranchID
FOREIGN KEY (BranchID) REFERENCES Branch(BranchID);
SELECT
    b.BranchID,
    b.address AS branch_address,
    e.name AS employee_name
FROM Branch b
JOIN Employee e
    ON b.BranchID = e.BranchID;
	
	--Display branch names and the accounts opened under each---
	SELECT 
    b.address BranchName,
    a.account_num
FROM Branch b
LEFT JOIN Account a
    ON b.BranchID = a.account_num
ORDER BY b.address;

--Display full customer details along with their loans--
SELECT
    c.customerID,
    c.name AS customer_name,
    c.phone_num ,
    c.date_brith,
	c.address,

    l.Loans_ID,
    l.type AS loan_type,
    l.amount AS loan_amount,
    l.issue_data,
    l.employee_ID
FROM
    Customer c
LEFT JOIN
    loans l
ON
    c. customerID = l.Customer_ID;
--Display loan records where the loan office is in 'Alexandria' or 'Giza'---
SELECT l.*, b.address
FROM Loans l
JOIN Employee e
    ON e.employee_ID = l.employee_ID
JOIN Branch b
    ON b.BranchID = e.BranchID
WHERE b.address LIKE 'sohar%'
   OR b.address LIKE 'Rustaq%'
   SElect* from branch

   --Display account data where the type starts with "S" (e.g., "Savings")--
   SELECT *
FROM account
WHERE accountType LIKE 'S%';

--List customers with accounts having balances between 20,000 and 50,000--
SELECT 
    c.customerID,
    c.name,
    c.address
FROM customer c
JOIN account a ON c.customerID = a.customerID
WHERE a.balance BETWEEN 20000 AND 50000;

--Retrieve customer names who borrowed more than 2000 LE from 'Salalah Downtown'--
SELECT 
c.name
FROM Customer c
JOIN Loans l
    ON c.customerID = l.Customer_ID
JOIN Branch b
    ON l.Customer_ID = b.branchid
WHERE l.amount > 2000
  AND b.address= 'Salalah Downtown';

  --Find all customers assisted by employee "Sami"--
  SELECT c.*
FROM customer c
JOIN employee  ON customerID = employee_ID
JOIN employee e ON c.customerID = e.employee_ID
WHERE e.name = 'Sami';

--Display each customer’s name and the accounts they hold, sorted by account type--
SELECT 
    c.name AS customer_name,
    a.account_num,
    a.accountType,
    a.balance
FROM customer c
JOIN account a ON c.customerID = a.customerID
ORDER BY a.accountType;
---For each loan issued in Cairo, show loan ID, customer name, employee handling it, and branch name--
SELECT
    l.Loans_ID,
    c.name AS customer_name,
    e.name AS employee_name,
    b.address AS branch_name
FROM Loans l
JOIN Customer c
    ON l.Customer_ID = c.customerID
JOIN Employee e
    ON l.employee_ID = e.employee_ID
JOIN Branch b
    ON e.BranchID = b.branchid
WHERE b.address = 'sohar Main Street';

--Display all employees who manage any branch---
SELECT *
FROM employee
WHERE Position = 'Manager';


---Display all customers and their transactions, even if some customers have no transactions yet--
SELECT
    c.customerID,
    c.name,
    t.transactions_ID,
    t.Date,
    t.amount,
    t.withdrawals,
    t.deposits,
    t.transfers
FROM customer c
LEFT JOIN transactions t
ON c.customerID = t.transactions_ID

select* from customer
select* from transactions





