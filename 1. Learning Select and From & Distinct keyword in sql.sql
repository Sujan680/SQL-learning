show databases;
use parks_and_recreation;   -- USE keyword tells us which database to use

show tables;				-- show tables; command displays all the tables in the database

select *                     -- select statement tells which columns to select
from 
	employee_demographics;			-- from statement tells which tables to retrieve

select 
	employee_id,
    first_name,
    age
from employee_demographics;

select 
	employee_id,
    first_name,
    age,
    (age + 5) - 10 + (age - 5) as age_update
from employee_demographics;

-- counting the unique gender-- 
select 
	distinct gender,			-- distinct retrieves the unique column from the table
    count(gender) as num_of_gender
from employee_demographics
group by gender;

-- WHERE clause : filter data based on specified condition
-- e.g.1
SELECT	
	first_name,
    age,
    gender,
    birth_date
FROM 	
	employee_demographics
WHERE	
	first_name = 'Tom';
    
-- e.g.2
SELECT	
	first_name,
    age,
    gender,
    birth_date
FROM 	
	employee_demographics
WHERE	
	birth_date > '1985-04-22';
    
-- e.g.3
SELECT	
	first_name,
    age,
    gender,
    birth_date
FROM 	
	employee_demographics
WHERE	
	gender != 'Male';
    
-- e.g 4
SELECT
	employee_id,
	first_name,
    occupation,
    salary
FROM
	employee_salary
WHERE 
	salary >= 50000;

-- AND OR NOT --- Logical Operator
SELECT	
	first_name,
    age,
    gender,
    birth_date
FROM 	
	employee_demographics
WHERE	
	birth_date > '1985-04-22' AND gender = 'Female';
    
SELECT
	employee_id,
	first_name,
    occupation,
    salary
FROM
	employee_salary
WHERE 
	(salary >= 50000 AND occupation = 'Office Manager') OR first_name = 'Tom';
    
--- LIKE Statement 
-- % and _
-- e.g 1
SELECT
	employee_id,
	first_name,
    occupation,
    salary
FROM
	employee_salary
WHERE 
	occupation LIKE '%manager%';
    
-- e.g 2
SELECT
	employee_id,
	first_name,
    occupation,
    salary
FROM
	employee_salary
WHERE 
	occupation LIKE  'city%' or occupation LIKE '%manager%';
    
-- 3
SELECT	
	first_name,
    age,
    gender,
    birth_date
FROM 	
	employee_demographics
WHERE	
	birth_date  LIKE  '1980%' ;  


-- Group By 
select *
from
	employee_demographics;

-- 1 e.g
select 
	gender
from 
	employee_demographics
group by 
	gender;
 
 --  2..
select
	gender,
    AVG(age) as Average,
    MAX(age) Max_age,
    MIN(age) as Min_age,
    COUNT(age) as num_0f_age
from
	employee_demographics
group by
	gender;
    
-- 3. e.g
select 
	occupation,
    salary,
    AVG(salary),
    MAX(salary),
    SUM(salary) as Total_salary
from
	employee_salary
group by 
	occupation, salary;

-- ORDER BY
select *
from
	employee_demographics
order by first_name;

-- 2 eg
select *
from
	employee_demographics
order by gender, age DESC;

-- WHERE vs HAVING
select
	gender,
    avg(age)
from
	employee_demographics
where 
	avg(age) > 38    -- invalid use of where with aggregate function
group by gender;

-- vs

select
	gender,
    avg(age)
from
	employee_demographics
group by 
	gender
having
	avg(age) > 38;

select *
from employee_demographics;

-- inserting data into tables
insert into
	employee_demographics
values
(13, 'Sujan', 'Magar', 27, 'Male', '1998-10-27'),
(14, 'Dipesh', 'Pun', 29, 'Male', '1997-12-20' );

-- where vs having
select
	occupation,
    avg(salary)
from
	employee_salary
where 
	occupation LIKE '%manager%'
group by 
	occupation
having 
	avg(salary) >= 75000;
	
-- LIMIT and Alias (AS)
select *
from
	employee_demographics
order by
	age DESC
LIMIT 3;

-- ALiasing (AS)
SELECT
	gender,
    MAX(age) AS max_age
FROM
	employee_demographics
GROUP BY
	gender
HAVING 
	max_age > 43;


