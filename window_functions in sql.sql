-- Windows functions
/*
Window functions are advanced SQL operations that perform calculations across a set of table 
rows related to the current row, without collapsing the result set like GROUP BY does.

Key Characteristics of Window Functions:
Preservation of Rows: Unlike aggregate functions with GROUP BY, window functions 
						don't reduce the number of rows returned.

Partitioning: Calculations can be performed within defined groups (partitions) of data.

Ordering: Functions can consider the order of rows within partitions.

Frame Specification: Define exactly which rows to include in the calculation relative 
					to the current row.
*/
-- Comparing the group by and window function

-- by group by
SELECT 
	-- dem.first_name,
--     dem.last_name,
	gender,
    AVG(salary) as average_sal
FROM
	employee_demographics dem
JOIN
	employee_salary sal
ON dem.employee_id = sal.employee_id
GROUP BY
	-- dem.first_name,
--     dem.last_name,
	gender;
    
-- by window function    
SELECT 
	dem.first_name,
    dem.last_name,
	gender,
    AVG(salary) OVER(PARTITION BY gender)
FROM
	employee_demographics dem
JOIN
	employee_salary sal
ON dem.employee_id = sal.employee_id;

-- Running total Calculation
SELECT 
	dem.first_name,
    dem.last_name,
	gender,
    salary,
    SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total
FROM
	employee_demographics dem
JOIN
	employee_salary sal
ON dem.employee_id = sal.employee_id;


-- ROW_NUMBER() OVER() ---it will give each row rank from 1 to n.
SELECT 
	dem.employee_id,
	dem.first_name,
    dem.last_name,
	gender,
    salary,
    ROW_NUMBER() OVER() 
FROM
	employee_demographics dem
JOIN
	employee_salary sal
ON dem.employee_id = sal.employee_id;

-- ROW_NUMBER() OVER(PARTITION BY gender) ---it will give each row rank based on partition by from 1 to n.
SELECT 
	dem.employee_id,
	dem.first_name,
    dem.last_name,
	gender,
    salary,
    ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) 
FROM
	employee_demographics dem
JOIN
	employee_salary sal
ON dem.employee_id = sal.employee_id;

-- RANK() function-- when there is tie then it skip the next ranking order like when its tie between 5 then it skip 6 and enters rank 7
SELECT 
	dem.employee_id,
	dem.first_name,
    dem.last_name,
	gender,
    salary,
    ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row__order,
    RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
    DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM
	employee_demographics dem
JOIN
	employee_salary sal
ON dem.employee_id = sal.employee_id;

SELECT
* FROM employee_salary;

SELECT
* FROM employee_demographics;

describe employee_demographics;

INSERT INTO employee_demographics
VALUES (5,'Jerry','Gergich', 56, 'Male', '1996-04-23');