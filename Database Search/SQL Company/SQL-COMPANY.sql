CREATE DATABASE Company
USE Company
CREATE TABLE Employee (
    SSN        int PRIMARY KEY,
    BirthDate  DATE,
    Gender     VARCHAR(10),
    Fname      VARCHAR(30),
    Lname      VARCHAR(30),
    Dnum       int,        
    SuperSSN   int,        
    
   FOREIGN KEY (SuperSSN) REFERENCES Employee(SSN)
);

CREATE TABLE Department (
    Dnum       int PRIMARY KEY,
    Dname      VARCHAR(40),
    MgrSSN     int,
    HireDate   DATE,
    
    FOREIGN KEY (MgrSSN) REFERENCES Employee(SSN)
);
CREATE TABLE Locations (
    Dnum INT,
    Loc  VARCHAR(50),
    PRIMARY KEY (Dnum, Loc),
    FOREIGN KEY (Dnum) REFERENCES Department(Dnum)
);

CREATE TABLE Project (
    Pnum   INT PRIMARY KEY,
    Pname  VARCHAR(50),
    City   VARCHAR(50),
    Loc    VARCHAR(50),
    Dnum   INT,
    
    FOREIGN KEY (Dnum,Loc) REFERENCES Locations(Dnum,Loc)
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

