-- JOIN in SQL

select *
from employee_salary;

select *
from employee_demographics;

-- INNER JOIN-- retrieves only the matching values from both tables
SELECT 
	dem.employee_id,
    age,
    occupation
FROM
	employee_demographics AS dem
INNER JOIN 
	employee_salary AS sal
ON dem.employee_id = sal.employee_id;

-- OUTER JOIN-- LEFT and RIGHT JOIN
SELECT 
	*
FROM
	employee_demographics AS dem
LEFT JOIN 
	employee_salary AS sal
ON dem.employee_id = sal.employee_id;

-- RIGHT JOIN
SELECT 
	*
FROM
	employee_demographics AS dem
RIGHT JOIN 
	employee_salary AS sal
ON dem.employee_id = sal.employee_id;


-- SELF JOIN
SELECT 
	emp1.employee_id AS emp_santa,
    emp1.first_name AS first_name_santa,
    emp1.last_name AS last_name_santa,
    emp2.employee_id AS emp_name,
    emp2.first_name AS first_name_santa,
    emp2.last_name AS last_name_santa
FROM 
	employee_salary emp1
JOIN
	employee_salary emp2
ON
	emp1.employee_id + 1= emp2.employee_id;
    
    
-- Joining multiple tables
SELECT 
	dem.employee_id,
    age,
    occupation,
    department_name
FROM
	employee_demographics AS dem
INNER JOIN 
	employee_salary AS sal
ON dem.employee_id = sal.employee_id
INNER JOIN
	parks_departments AS parks
ON sal.dept_id = parks.department_id;
