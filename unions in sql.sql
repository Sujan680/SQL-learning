-- unions in sql
-- UNION
-- UNION is used to combine the result-set of two or more SELECT statements.
-- Each SELECT statement within UNION must have the same number of columns.
-- The columns must also have similar data types.
-- The columns in each SELECT statement must also be in the same order.

SELECT 
	employee_id,
	first_name,
    last_name
FROM
	employee_demographics
UNION
SELECT
	employee_id,
	first_name,
	last_name
FROM
	employee_salary;

-- problem 1
SELECT 
	employee_id,
	first_name,
    last_name,
    'Young' AS label
FROM
	employee_demographics
WHERE
	age > 40
UNION
SELECT
	employee_id,
    first_name,
    last_name,
    'High paid Sal' AS sal_category
FROM
	employee_salary
WHERE
	salary > 70000
ORDER BY
	first_name, 
    last_name;

-- UNION ALL
-- UNION ALL is used to combine the result-set of two or more SELECT statements.
-- The difference between UNION and UNION ALL is that UNION ALL will not remove duplicate rows.

SELECT 
	employee_id,
	first_name,
    last_name
FROM
	employee_demographics
UNION ALL
SELECT
	employee_id,
	first_name,
	last_name
FROM
	employee_salary;












