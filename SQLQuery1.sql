--CREATE TABLE EmployeeDemographics (
--	EmployeeID int,
--	FirstName varchar(50),
--	LastName varchar(50),
--	Age int,
--	Gender varchar(50)
--)


--CREATE TABLE EmployeeSalary(
--	EmployeeID int,
--	JobTitle varchar(50),
--	Salary int,
--)

--INSERT INTO EmployeeDemographics VALUES
--(1002, 'Sujan', 'Magar', 27, 'Male'),
--(1003, 'Sabin', 'Gurung', 30, 'Male'),
--(1004, 'Bhumi', 'Roka', 24, 'Female'),
--(1005, 'Dwight', 'Schrute', 30, 'Male'),
--(1006, 'Angela', 'Martin', 32, 'Female'),
--(1007, 'Meredith', 'Palmer', 23, 'Female'),
--(1008, 'Kevin', 'Schade', 20, 'Male'),
--(1009, 'Toby', 'Flenderson', 32, 'Male')


--DELETE FROM EmployeeDemographics;

--INSERT INTO EmployeeDemographics VALUES
--(1001, 'Sujan', 'Magar', 26, 'Male')

--DELETE FROM EmployeeDemographics WHERE EmployeeID = 1001;

--INSERT INTO EmployeeSalary VALUES
--(1002, 'Receptionist', 40000),
--(1003, 'Accountant', 45000),
--(1004, 'HR', 36000),
--(1005, 'Regional Manager', 38000),
--(1006, 'Supplier Relations', 34000),
--(1007, 'Account', 45000),
--(1008, 'Salesman', 55000),
--(1009, 'HR', 35000
--)

	--Selct Statement 
	--TOP, DISTINCT, COUNT, As, Max, Min, Avg

--SELECT *
--FROM EmployeeDemographics;

--SELECT TOP 5 *
--FROM EmployeeDemographics;

--SELECT DISTINCT(Gender)
--FROM EmployeeDemographics;

--SELECT COUNT(lastName) As LastNameCount
--FROM EmployeeDemographics;

--SELECT MAX(Salary) As MaxSalaryOfEmployee
--FROM EmployeeSalary;

--SELECT MIN(Salary) As MinSalaryOfEmployee
--FROM EmployeeSalary;

--SELECT AVG(Salary) As AvgSalaryOfEmployee
--FROM EmployeeSalary;

--The where statement is used to select specific items from the table:: =, <, >, And, Or, Like, Null, Not Null, In

--SELECT * FROM EmployeeDemographics WHERE FirstName = 'Sujan';

--SELECT * FROM EmployeeDemographics WHERE Age > 25;

--SELECT * FROM EmployeeDemographics WHERE Age <= 26 AND Gender = 'Male';

--SELECT * FROM EmployeeDemographics WHERE Age <= 26 OR Gender = 'Male';

--SELECT * FROM EmployeeDemographics WHERE FirstName LIKE 'S%';

--SELECT * FROM EmployeeDemographics WHERE FirstName IS NOT NULL;

--SELECT * FROM EmployeeDemographics WHERE FirstName IN ('Sujan', 'Kevin', 'Sabin');

--Group By, Order By Statement in sql

--SELECT * FROM EmployeeDemographics  ORDER BY Age;

--SELECT Gender, FirstName, COUNT(Gender) as NumberofGender
--FROM EmployeeDemographics
--WHERE Age > 26
--GROUP BY Gender, FirstName
--ORDER BY Gender desc;

--SELECT Gender, Age, COUNT(Age) as AgeCount
--FROM EmployeeDemographics 
--GROUP BY Gender, Age;



CREATE TABLE CustomersTable 
	(
		CustomerID int,
		CustomerName varchar(50),
		ContactName varchar(50),
		Address varchar(40),
		City varchar(50),
		PostalCode int,
		Country varchar(50)
	)