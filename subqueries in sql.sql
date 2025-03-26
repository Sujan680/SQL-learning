-- Subqueries
-- A subquery is a query within another query. 
-- It is also called an inner query or inner select. 
-- The subquery is executed first, and its output is used as the input for the main query. 
-- The main query then filters the data further or aggregates it in some way.

select *
from employee_demographics;

-- IN SELECT statement

SELECT 
	first_name,
    salary,
    (SELECT AVG(salary) FROM employee_salary) AS average_sal
FROM 
	employee_salary;
    
-- subqueries From statement
SELECT
    AVG(max_age)
FROM (
SELECT
	gender,
    AVG(age) AS avg_age,
    MAX(age) AS max_age,
    MIN(age) AS min_age,
    COUNT(age) AS count_age
FROM 
	employee_demographics
GROUP BY 
	gender) AS Agg_table;
    
-- subqueries in WHERE
SELECT
	*
FROM 
	employee_demographics
WHERE
	employee_id IN (
					SELECT employee_id
						FROM employee_salary
							WHERE dept_id = 1);
                            
                            