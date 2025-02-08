
DROP DATABASE IF EXISTS Parks_and_Recreation;

CREATE DATABASE IF NOT EXISTS Parks_and_Recreation;

USE Parks_and_Recreation;

CREATE TABLE employee_demographics (
	employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT NOT NULL,
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
