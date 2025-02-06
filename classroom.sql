
CREATE DATABASE college;   
CREATE DATABASE IF NOT EXISTS college;

USE college;

CREATE TABLE student
(	
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);


INSERT INTO student VALUES
(1, 'Sujan', 24),
(2, 'Binita', 34),
(3, 'Sudip', 21);

SELECT * FROM student;

insert into student values(4, 'Namita', 23);

-- delete the database if exists
DROP DATABASE IF EXISTS Company;

show databases;

show tables;

-- deleting the existing table from the database for creating table
DROP TABLE student;

-- creating the table name student
CREATE TABLE student (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    age INT
);

-- querying the table from the database
SELECT * FROM student;

-- inserting the values in the table
INSERT INTO student
(rollno, name, address, age)
VALUES
(1, 'Karan', 'Kathmandu', 23),
(2, 'Arjun', 'Pokhara', 30);

INSERT INTO student VALUES(3, 'Rajesh', 'Butwal', 34);

-- Practice Qs 1: Create database for your company named XYZ and create table of the employee with id, name, salary and
-- then insert the data and Select and view your table data.

CREATE DATABASE xyz_company;

USE xyz_company;

CREATE TABLE Employee_Info 
(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);

INSERT INTO Employee_Info
(id, name, salary)
VALUES
(1, "Adam", 25000),
(2, "Bob", 30000),
(3, "Casey", 40000);

SELECT * FROM Employee_Info;




