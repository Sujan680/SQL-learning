
DROP DATABASE IF EXISTS Parks_and_Recreation;

CREATE DATABASE IF NOT EXISTS Parks_and_Recreation;

USE Parks_and_Recreation;

CREATE TABLE employee_demographics (
	employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    birth_date DATE,
    PRIMARY KEY(employee_id)
);

CREATE TABLE employee_salary (
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);

INSERT INTO employee_demographics 
(employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1,'Leslie', 'Knope', 44, 'Female','1979-09-25'),
(3,'Tom', 'Haverford', 36, 'Male', '1987-03-04'),
(4, 'April', 'Ludgate', 29, 'Female', '1994-03-27'),
(5, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
(6, 'Donna', 'Meagle', 46, 'Female', '1977-07-30'),
(7, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
(9, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
(10, 'Andy', 'Dwyer', 34, 'Male', '1989-03-25'),
(11, 'Mark', 'Brendanawicz', 40, 'Male', '1983-06-14'),
(12, 'Craig', 'Middlebrooks', 37, 'Male', '1986-07-27');

INSERT INTO employee_salary 
(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000,1),
(2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000,1),
(3, 'Tom', 'Haverford', 'Entrepreneur', 50000,1),
(4, 'April', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000,1),
(5, 'Jerry', 'Gergich', 'Office Manager', 50000,1),
(6, 'Donna', 'Meagle', 'Office Manager', 60000,1),
(7, 'Ann', 'Perkins', 'Nurse', 55000,4),
(8, 'Chris', 'Traeger', 'City Manager', 90000,3),
(9, 'Ben', 'Wyatt', 'State Auditor', 70000,6),
(10, 'Andy', 'Dwyer', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Mark', 'Brendanawicz', 'City Planner', 57000, 3),
(12, 'Craig', 'Middlebrooks', 'Parks Director', 65000,1);

-- here in this table we created the auto-increment constraints...
CREATE TABLE parks_departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name varchar(50) NOT NULL,
  PRIMARY KEY (department_id)
);

INSERT INTO parks_departments 
(department_name)
VALUES
('Parks and Recreation'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),
('Finance');

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT employee_id, 
first_name, 
last_name,
age,
(age + 10) - 30
FROM parks_and_recreation.employee_demographics;
# PEMDAS

-- DISTINCT command: it is use to return the unique values from the table
-- It can't be used with the aggregate function like max, min etc...

SELECT DISTINCT name
FROM parks_and_recreation.employee_demographics;


SELECT DISTINCT gender, first_name
FROM parks_and_recreation.employee_demographics;


-- WHERE CLAUSE

SELECT * 
FROM employee_demographics
WHERE gender = "Female";

SELECT employee_id, first_name 
FROM employee_demographics
WHERE gender = "Female";

SELECT employee_id, last_name, birth_date
FROM employee_demographics
WHERE age >= 40;

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-08-11' AND gender = 'Male';

SELECT *
FROM employee_demographics
WHERE age >= 45 OR gender = 'Female';

SELECT *
FROM employee_salary;

SELECT employee_id, first_name, salary
FROM employee_salary
WHERE salary <= 50000
ORDER BY salary;

SELECT *
FROM parks_departments;

SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age >= 45) OR age > 55;

-- LIKE statement:-  % and _

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';

SELECT *
FROM employee_demographics
WHERE birth_date  LIKE '1986%';

-- GROUP BY: it can be used with the aggregate function 
SELECT gender, count(first_name) 
FROM employee_demographics
GROUP BY gender;

SELECT gender, avg(age), max(age)
FROM employee_demographics
GROUP BY gender;

SELECT occupation, salary, count(occupation)
FROM employee_salary
group by occupation, salary;


SELECT gender, count(first_name), avg(age), max(age)
FROM employee_demographics
GROUP BY gender;

-- ORDER BY
SELECT *
FROM employee_demographics
ORDER BY gender, age;

-- where vs having clause

SELECT gender, avg(age)
FROM employee_demographics
GROUP BY gender
HAVING avg(age) > 40;

SELECT occupation, AVG(salary) 
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 70000;

-- LIMIT clause
SELECT *
FROM employee_demographics
ORDER BY age
LIMIT 4;

-- JOINS 

SELECT *
FROM employee_demographics as e1
INNER JOIN employee_salary as e2
ON e1.employee_id = e2.employee_id;

SELECT *
FROM employee_demographics as e1
RIGHT JOIN employee_salary as e2
ON e1.employee_id = e2.employee_id;

-- SELF JOIN

SELECT e1.first_name as emp_name, e2.first_name as secret_santa
FROM employee_salary as e1
JOIN employee_salary as e2
ON e1.employee_id + 1  = e2.employee_id;


-- JOINING multiple taables

SELECT e1.employee_id, e1.first_name, e2.occupation, e2.salary, pd.department_name
FROM employee_demographics as e1
INNER JOIN employee_salary as e2
ON e1.employee_id = e2.employee_id
INNER JOIN parks_departments as pd
ON e2.dept_id = pd.department_id;

-- Strings Functions
SELECT first_name, LENGTH(first_name), length(last_name)
FROM employee_demographics
ORDER BY 2;

SELECT first_name, UPPER(first_name)
FROM employee_demographics;

SELECT LOWER(first_name)
FROM employee_demographics;

-- TRIM , LTRIM, RTRIM function
SELECT TRIM(first_name), first_name
FROM employee_demographics;

-- RIGHT, LEFT functions
SELECT first_name,
LEFT(first_name, 4),
RIGHT(last_name, 3)
FROM employee_demographics;

-- SUBSTRING function
SELECT first_name,
SUBSTRING(last_name, 2, 1),
birth_date,
SUBSTRING(birth_date, 6, 2) AS month
FROM employee_demographics;


-- REPLACE function
SELECT first_name, REPLACE(first_name, 'o', 'X')
FROM employee_demographics;

SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics;

--- Concat function
SELECT first_name, last_name,
CONCAT(first_name, " ", last_name) as full_name
FROM employee_demographics;


-- CASE Statement:

SELECT first_name, last_name, age,
CASE
	WHEN age >= 40 THEN 'OLD'
    WHEN age >=20 and age < 40 THEN 'Adult'
END as Age_order
FROM employee_demographics;

SELECT first_name, salary,
CASE
	WHEN salary <= 50000 THEN    salary + (salary * 0.05)
    WHEN salary >= 50000 THEN  salary + (salary * 0.07)
END as New_Payment,
CASE
	WHEN dept_id = 6 THEN salary * .10
END as Bonus
FROM employee_salary;

-- Subqueris 
-- employee who works in only parks_and_recreation department
-- Using subquries in WHERE 
SELECT *
FROM employee_demographics
WHERE employee_id IN (SELECT employee_id
						FROM employee_salary WHERE dept_id = 1);


-- Using SELECT

SELECT first_name, salary, 
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary;


-- using within FROM

SELECT gender, 
AVG(age) as avg_age, 
MAX(age) as max_age, 
MIN(age) as min_age, 
COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT AVG(max_age)
FROM
(SELECT gender, 
AVG(age) as avg_age, 
MAX(age) as max_age, 
MIN(age) as min_age, 
COUNT(age) as count_age
FROM employee_demographics
GROUP BY gender) AS agg_table;

-- Window functions

Select gender, AVG(salary) AS Avg_salary
from employee_demographics as ed
JOIN employee_salary as es
ON ed.employee_id = es.employee_id
group by gender;

Select ed.first_name, ed.last_name, gender, AVG(salary) OVER(partition by gender)
from employee_demographics as ed
JOIN employee_salary as es
ON ed.employee_id = es.employee_id;

Select ed.first_name, ed.last_name, gender, SUM(salary) 
OVER(partition by gender order by ed.employee_id) as Rolling_Table
from employee_demographics as ed
JOIN employee_salary as es
ON ed.employee_id = es.employee_id;

-- ROW_NUMBER()--unique ranking , RANK() -- duplicate rank like(4,4) then start at 6 position, 
-- DENSE_RANK()-- duplicate rank and start next like (4,4) then 6

Select ed.first_name, ed.last_name, gender, es.salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) as rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) as dense_rank_num
from employee_demographics as ed
JOIN employee_salary as es
ON ed.employee_id = es.employee_id;



-- CTEs

WITH CTE_Example (Gender, AVG_Sal, MAX_Sal, MIN_Sal, COUNT_Sal) AS
(SELECT gender, 
AVG(salary) as avg_sal, 
MAX(salary) as max_sal, 
MIN(salary) as min_sal, 
COUNT(salary) as count_sal
FROM employee_demographics as ed
JOIN employee_salary as es
ON ed.employee_id = es.employee_id
 GROUP BY gender
 )
SELECT AVG(avg_sal)
FROM CTE_Example
;

WITH CTE_Example1 AS
(SELECT employee_id, last_name, age
FROM employee_demographics
WHERE age > 35
),
CTE_Example2 AS 
(SELECT employee_id, salary, occupation
FROM employee_salary
WHERE salary > 55000
)
SELECT * 
FROM CTE_Example1
JOIN CTE_Example2
	ON CTE_Example1.employee_id = CTE_Example2.employee_id
;

WITH CTE_Example (Gender, AVG_Sal, MAX_Sal, MIN_Sal, COUNT_Sal) AS
(SELECT gender, 
AVG(salary) as avg_sal, 
MAX(salary) as max_sal, 
MIN(salary) as min_sal, 
COUNT(salary) as count_sal
FROM employee_demographics as ed
JOIN employee_salary as es
ON ed.employee_id = es.employee_id
 GROUP BY gender
 )
SELECT *
FROM CTE_Example
;

-- Revision:- CTEs: Common Table Expressions
-- A CTE is a temporary result set that you can reference within a SELECT, INSERT, 
-- UPDATE, or DELETE statement. It is defined using the WITH clause and exists only 
-- during the execution of the query

WITH CTE_Example3 AS
(
	SELECT d.employee_id, d.first_name, s.occupation
    FROM employee_demographics d
    JOIN employee_salary s
    ON d.employee_id = s.employee_id
)
SELECT *
FROM CTE_Example3
;


-- Temporary Tables

CREATE TEMPORARY TABLE temp_table
(
	first_name VARCHAR(50),
    last_name VARCHAR(50),
    favorite_movie VARCHAR(100)
);

SELECT *
FROM temp_table;

DELETE FROM temp_table
WHERE favorite_movie = 'The Great T';

INSERT INTO temp_table
VALUES ('Sujan', 'Magar', 'The Great Time');

-- we can also create temp table using the existing table 
-- temp table exist as long as we are in the same session
CREATE TEMPORARY TABLE salary_over_50K
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50K;

-- Stored Procedures

-- simple example of creating stored procedure
CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

-- calling the stored procedure
CALL large_salaries();

-- Another example

DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT * 
    FROM employee_salary
    WHERE salary >= 50000;
    SELECT *
    FROM employee_salary
    WHERE salary >= 10000;
END $$
DELIMITER ;

-- Using Parameters in stored procedures
DELIMITER $$
CREATE PROCEDURE large_salaries3(employee_id_param INT)
BEGIN
	SELECT salary
    FROM employee_salary
    WHERE employee_id = employee_id_param;
END $$
DELIMITER ;

CALL large_salaries3(1);


-- Triggers and Events


DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary
(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'Jean-Ralpho', 'Saperstein', 'Entertainment', 100000, 30);

ALTER TABLE employee_demographics 
MODIFY COLUMN age INT NULL;

SELECT * FROM 
employee_salary;

DELETE FROM employee_salary
where employee_id = 16;

SELECT * FROM 
employee_demographics;

-- Events
DELIMITER $$
CREATE EVENT delete_retirees1
ON SCHEDULE EVERY 30 second
DO
BEGIN
	DELETE 
    FROM employee_demographics
    WHERE age >= 60 ;
END $$
DELIMITER ;

SELECT * 
FROM employee_demographics;


