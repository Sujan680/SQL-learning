-- Stored Procedure
/*
Key Characteristics of Stored Procedures:
1. Precompiled Execution: Compiled once and stored in executable form

2.Reduced Network Traffic: Execute multiple statements with a single call

3. Improved Security: Control data access through procedure permissions

4. Code Reusability: Can be called from multiple applications

5. Better Performance: Execution plans are cached
*/

SELECT *
FROM 
	employee_salary;
    
    
CREATE PROCEDURE large_salary() 
SELECT *
FROM
	employee_salary
WHERE
	salary >= 50000;
    
CALL large_salary();

DROP PROCEDURE IF EXISTS `large_salaries`;

DELIMITER $$
CREATE PROCEDURE large_salaries()
BEGIN
	SELECT *
	FROM
		employee_salary
	WHERE
		salary >= 50000;
	SELECT *
	FROM
		employee_salary
	WHERE
		salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries();


-- Parameter in stored procedure
DELIMITER $$
CREATE PROCEDURE large_salaries1(id INT)
BEGIN
	SELECT *
	FROM
		employee_salary
	WHERE
		employee_id = id;
END $$
DELIMITER ;

CALL large_salaries1(4);
CALL large_salaries1(5);