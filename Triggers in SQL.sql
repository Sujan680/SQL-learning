-- Triggers and  Events in sql
/*
- Triggers are database objects that automatically execute in response to specific events on a 
	particular table or view.
    
 Key Characteristics of Triggers:
Automatic execution when defined events occur

Event-based (INSERT, UPDATE, DELETE)

Row-level or statement-level execution

Can access old and new data (for UPDATE operations)
*/
DROP TRIGGER IF EXISTS `employee_insert`;

SELECT *
FROM
	employee_demographics;
    
SELECT *
FROM
	employee_salary;
/*
This is a MySQL trigger that automatically copies data from one table to another 
whenever a new record is inserted. Let me break it down:
*/
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary 
VALUES (13, 'Rajin', 'Roka', 'Engineer', '86000', NULL);

-- Deletion Triggers 
/*
Here's a trigger that will automatically delete corresponding records from the 
employee_salary table when a row is deleted from employee_demographics:
*/

DELIMITER $$
CREATE TRIGGER employee_delete
	AFTER DELETE ON employee_demographics
    FOR EACH ROW
BEGIN
	DELETE FROM employee_salary
    WHERE employee_id = OLD.employee_id;
END $$
DELIMITER ;

DELETE
FROM employee_demographics
WHERE employee_id = 13;

-- Updation in triggers
-- This trigger updates the salary table when demographics are updated:

DELIMITER $$
CREATE TRIGGER employee_updation
	AFTER UPDATE ON employee_demographics
    FOR EACH ROW
BEGIN
	UPDATE employee_salary
    SET
		first_name = NEW.first_name,
        last_name = NEW.last_name
	WHERE 
		employee_id = NEW.employee_id;
END $$
DELIMITER ;

UPDATE employee_demographics
SET
	first_name = 'Martin',
    last_name = 'Odegard'
WHERE
	employee_id = 13;
