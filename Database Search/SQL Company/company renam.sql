CREATE DATABASE companyDDB 
USE companyDDB 
CREATE TABLE Employee (
    SSN        int PRIMARY KEY,
    BirthDate  DATE,
    Gender     VARCHAR(10),
    Fname      VARCHAR(30),
    Lname      VARCHAR(30),
    SuperSSN int,   
	   
   FOREIGN KEY (SuperSSN) REFERENCES Employee(SSN)
);
CREATE TABLE Department (
    Dnum       int PRIMARY KEY,
    Dname      VARCHAR(40),
    MgrSSN     int,
    HireDate   DATE,
    
    FOREIGN KEY (MgrSSN) REFERENCES Employee(SSN)
);
ALTER TABLE Employee
ADD Dnum INT
--FOREIGN KEY (Dnum) REFERENCES Department(Dnum)

CREATE TABLE DLocation (
    Dnum INT NOT NULL,
    Dlocation NVARCHAR(50) NOT NULL,
    PRIMARY KEY (Dnum, Dlocation),
    FOREIGN KEY (Dnum) REFERENCES Department(Dnum)
);
CREATE TABLE Project (
    Pnum   INT PRIMARY KEY,
    Pname  VARCHAR(50),
    City   VARCHAR(50),
    Loc    VARCHAR(50),
    Dnum   INT,
    
    FOREIGN KEY (Dnum) REFERENCES Department (Dnum)
);
CREATE TABLE EMPDependent (
    DepID INT PRIMARY KEY IDENTITY(1,1),
    EmpSSN INT NOT NULL,
    Dnum INT NOT NULL,
    Gender BIT DEFAULT 0,
    DBirthdate DATE,
    FOREIGN KEY (EmpSSN) REFERENCES Employee(SSN),
    FOREIGN KEY (Dnum) REFERENCES Department(Dnum)
);
CREATE TABLE Dependent (
    SSN       int,
    DepName   VARCHAR(40),
    Gender    VARCHAR(20),
    BD        DATE,
    PRIMARY KEY (SSN, DepName),
    
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);
CREATE TABLE MyWork (
    SSN          int,
    Pnum         int,
    WorkingHours int,
    PRIMARY KEY (SSN, Pnum),
    
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (Pnum) REFERENCES Project(Pnum)
);
insert into employee(SSN,BirthDate, Gender, Fname,Lname,SuperSSN,Dnum)
Values ( 101,'1998-03-2','female','amjad','ali', 1,1),
(102,'1997-04-3','Female','Denna','mohammed', 2,2),
(103,'1996-04-4','male','bader','sami', 3,4),
(104,'1995-05-2','MALE','ALI','bader', 4,5),
(105,'1994-05-2','female','zahrah','yaser', 5,6);
insert into Department (Dnum, Dname, MgrSSN, HireDate)
Values (1, 'Human Resources', 101, '1980-05-15'),
(2,'IT',102,'1981-02-10'),
(3,'Engineer',103,'1982-01-1'),
(4,'Finance', 104,'1988-09-6'),
(5,'Marketing',105,'1990-08-5');
insert into Locations (Dnum, Loc)
Values(1,'barka'),
(2,'kaborah'),
(3,'egept'),
(4,'rustaq'),
(5,'sewaq');
insert into Project (Pnum, Pname, City, Loc, Dnum)
Values(7,'Project a','Muscat','muscat',1),
(8,'Project b','Ibri','ibri',2),
(9,'Project c','Sur','sur',3),
(6,'Project d','Salalah','salalah',4),
(10,'Project e','Wasta','wasta',5);
insert into Dependent(SSN, DepName, Gender, BD)
Values(101,'kalid','male','2008-12-12'),
(102,'sara','female','2009-02-05'),
(103,'mohra','female','2010-06-6'),
(104,'basma','female','2009-07-7'),
(105,'moza','female','2011-10-8');
insert into MyWork (SSN, Pnum, WorkingHours)
Values(101,7,50),
(102, 8, 60),
(103, 9, 70),
(104,6, 80),
(105,10,90);
select * from Mywork



