
-- Common Table Expression(CTE) is a temporary result set that you can reference 
-- within a SELECT, INSERT, UPDATE, or DELETE statement.
-- CTEs are similar to a derived table in that they are not stored as an object and 
-- last only for the duration of the query.
-- CTEs are defined using the WITH keyword.

WITH CTE_Example AS (
SELECT
	gender,
    AVG(salary) AS avg_sal,
    MAX(salary) AS max_sal,
    MIN(salary) AS min_sal,
    COUNT(salary) AS count_sal
FROM 
	employee_demographics dem
JOIN
	employee_salary sal
ON
	dem.employee_id = sal.employee_id
GROUP BY 
	gender
)
SELECT 
	AVG(max_sal)
FROM CTE_Example;

-- USING THE subqueries the same above written code
SELECT
	AVG(avg_sal)
FROM (
SELECT
	gender,
    AVG(salary) AS avg_sal,
    MAX(salary) AS max_sal,
    MIN(salary) AS min_sal,
    COUNT(salary) AS count_sal
FROM 
	employee_demographics dem
JOIN
	employee_salary sal
ON
	dem.employee_id = sal.employee_id
GROUP BY 
	gender
) AS subquery_example;


-- writing the multiple CTEs in sql
WITH CTE_Example1 AS(
	SELECT 
		employee_id,
        gender,
        birth_date
	FROM
		employee_demographics
	WHERE	
		birth_date > '1985-02-01'
), 
CTE_Example2 AS (
	SELECT
		employee_id,
        salary
	FROM 
		employee_salary
	WHERE 
		salary > 50000
)
SELECT *
FROM 
	CTE_Example1 
JOIN
	CTE_Example2
ON CTE_Example1.employee_id = CTE_Example2.employee_id;
