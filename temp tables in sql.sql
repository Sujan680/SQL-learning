-- Temp Tables
/*Temporary tables are database objects that exist temporarily during a session or transaction,
 providing a way to store intermediate results for complex queries.
 
 - Exists only for the current database session
 - Exists only for the current transacrtion
 - Automatically dropped when the sessions ends
 */

/* 
 -- SQL Server/Sybase
CREATE TABLE #TempTable (id INT, name VARCHAR(50));

-- MySQL
CREATE TEMPORARY TABLE TempTable (id INT, name VARCHAR(50));

-- Oracle
CREATE GLOBAL TEMPORARY TABLE TempTable (id INT, name VARCHAR(50)) ON COMMIT PRESERVE ROWS;

*/
show tables;
CREATE TEMPORARY TABLE temp_table (
first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100),
user_id int primary key
);


select *
from 
	temp_table;
    
INSERT INTO temp_table
VALUES('Sujan', 'Magar', 'The Hulk', 1);

SELECT *
FROM 	
	employee_salary;

CREATE TEMPORARY TABLE salary_over_60k AS
SELECT *
FROM
	employee_salary
WHERE 
	salary >= 60000;
    
SELECT *
FROM
	salary_over_60k;



