--Display all employee data.--
SELECT* FROM Employee
--Display employee first name, last name, salary, and department number.--
select Fname, Lname ,Salary,Dno from employee
--Display each employee’s full name and their annual commission (10% of annualsalary) as ANNUAL_COMM.--
select Fname + '' + Lname as full_name ,
Salary * 12* 0.10 as annuall_comm from employee;

--Display employee ID and name for employees earning more than 1000 LE monthly.--
 SELECT SSN AS Employee_ID,
       Fname+''+Lname as  Employee_name from Employee
       Where Salary> 1000;
	   --Display employee ID and name for employees earning more than 10000 LEannually.--
SELECT SSN AS Employee_ID,
       Fname+''+Lname as  Employee_name from Employee
       Where Salary> 10000;


	 --Display names and salaries of all female employees--
	 SElect Fname + ''+Lname as Employee_name,Salary from Employee where Sex='F';
--Display employees whose salary is between 2000 and 5000.--
Select*from employee where Salary between 2000 and 5000;
--Display employee names ordered by salary descending.--
Select Fname+''+Lname as employee_name from Employee
order by Salary desc;
--Display the maximum, minimum, and average salary--
select MAX(Salary) AS Max_Salary,
    MIN(Salary) AS Min_Salary,
    AVG(Salary) AS Avg_Salary
FROM Employee;
--Display total number of employees--
Select COUNT(* )AS Total_employees
FROM employee ;
-- Display employees whose first name starts with 'A'.--
select*
FROM Employee
WHERE Fname LIKE 'A%';
--Display employees who have no supervisor--
Select* from employee 
where Superssn is NULL;
--DML--
-- Insert your personal data into the employee table (Department = 30, SSN = 102672,Superssn = 112233, Salary = 3000).--
Insert into Employee
( Dno,SSN, Superssn, Salary)
VALUES
( 30,102672, 112233, 3000);
-- Insert another employee (your friend) in department 30 with SSN = 102660, leavingsalary and supervisor number NULL--
Insert into Employee 
 (Dno,SSN, Fname, Salary, SuperSSN)
VALUES (30,102660, 'AMJAD', NULL, NULL);
--Update your salary by 20%--
UPDATE Employee
Set Salary = Salary * 1.20
WHERE SSN = 102660;
-- Increase salaries by 5% for all employees in department 30--
UPDATE Employee
SET Salary = Salary * 1.05
WHERE Dno = 30;
--Delete employees with NULL salary.--
Delete From Employee
WHERE Salary IS NULL;








