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

-- counting the unique gender-- 
select 
	distinct gender,			-- distinct retrieves the unique column from the table
    count(gender) as num_of_gender
from employee_demographics
group by gender;




