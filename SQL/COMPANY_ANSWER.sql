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