create database TrainingCompanydb
use TrainingCompanydb
CREATE TABLE Employee (
    SSN        int PRIMARY KEY Identity(1,1),
    BirthDate  DATE,
    Gender     VARCHAR(10),
    Fname      VARCHAR(30),
    Lname      VARCHAR(30),
	superSSN INT,
    
           
          
    
   FOREIGN KEY (SuperSSN) REFERENCES Employee(SSN)
);

CREATE TABLE Department (
    Dnum       int PRIMARY KEY Identity(1,1),
    Dname      VARCHAR(40),
    MgrSSN     int,
    HireDate   DATE,
    
    FOREIGN KEY (MgrSSN) REFERENCES Employee(SSN)
);
CREATE TABLE Locations (
    Dnum INT ,
    Loc  VARCHAR(50),
    PRIMARY KEY (Dnum, Loc),
    FOREIGN KEY (Dnum) REFERENCES Department(Dnum)
);
create table Project
(
	Pname nvarchar(50) not null,
	Pnumber int primary key identity(1,1),
	City   VARCHAR(50),
    Loc    VARCHAR(50),
	Dnum int,
	foreign key (Dnum) references Department(Dnum)
);
CREATE TABLE MyWork (
    SSN          int,
    Pnum         int,
    WorkingHours int not null,
    PRIMARY KEY (SSN, Pnum),
    
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (Pnum) REFERENCES Project(Pnumber)
);
CREATE TABLE Dependent (
    SSN       int,
    DepName   VARCHAR(40),
    Gender    VARCHAR(20),
    BD        DATE,
    PRIMARY KEY (SSN, DepName),
    
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);
alter table Employee
	add Dnum int foreign key references Department(Dnum)
	insert into employee(BirthDate, gender, Fname,Lname,SuperSSN )
Values ( '1998-03-2','female','amjad','ali', Null),
('1997-04-3','Female','Denna','mohammed',Null),
('1996-04-4','male','bader','sami',Null),
('1995-05-2','MALE','ALI','bader',Null),
('1994-05-2','female','zahrah','yaser',null);
insert into Department ( Dname, MgrSSN, HireDate)
Values ( 'Human Resources', 1, '1980-05-15'),
('IT',2,'1981-02-10'),
('Engineer',3,'1982-01-1'),
('Finance',4,'1988-09-6'),
('Marketing',5,'1990-08-5');
insert into Locations (Dnum, Loc)
Values(1,'barka'),
(2,'kaborah'),
(3,'egept'),
(4,'rustaq'),
(5,'sewaq');
insert into Project ( Pname, City, Loc, Dnum)
Values('Project a','Muscat','muscat',1),
('Project b','Ibri','ibri',2),
('Project c','Sur','sur',3),
('Project d','Salalah','salalah',4),
('Project e','Wasta','wasta',5);
insert into Dependent(SSN, DepName, Gender, BD)
Values(1,'kalid','male','2008-12-12'),
(2,'sara','female','2009-02-05'),
(3,'mohra','female','2010-06-6'),
(4,'basma','female','2009-07-7'),
(5,'moza','female','2011-10-8');
insert into MyWork (SSN, Pnum, WorkingHours)
Values(1,1,50),
(2, 2, 60),
(3, 3, 70),
(4,4, 80),
(5,5,90);
