
USE db_college;

CREATE TABLE Std_Info(
	rollno INT PRIMARY KEY,
    name VARCHAR(60),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(60)
);

INSERT INTO Std_Info
(rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 98, "A", "Mumbai"),
(103, "chetan", 86, "B", "Chennai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

SELECT * FROM Std_Info;

-- Alter commmand in sql: 
-- ADD column
-- ALTER TABLE table_name
-- ADD COLUMN column_name datatype constraint;

ALTER TABLE info
ADD COLUMN age INT NOT NULL DEFAULT 20;

-- DROP column
-- ALTER TABLE table_name
-- DROP COLUMN column_name;

ALTER TABLE Std_Info
DROP COLUMN age;


-- RENAME table
-- ALTER TABLE table_name
-- RENAME TO new_table_name;

ALTER TABLE Std_Info
RENAME TO info;

select * from info;

-- CHANGE column(rename)
-- ALTER TABLE table_name
-- CHANGE COLUMN old_name new_name new_datatypes new_constraint;

ALTER TABLE info
CHANGE COLUMN name std_name VARCHAR(50);

-- MODIFY column
-- ALTER TABLE table_name
-- MODIFY col_name new_datatype new_contraint;

ALTER TABLE info
MODIFY age VARCHAR(3);

INSERT INTO info
VALUES(111, 'sujan', 100, 'A', 'Pokhara', 100);

-- Truncate: to delete table's data we use TRUNCATE
TRUNCATE TABLE info;  -- It is used to delete the entire table's data not table
DROP TABLE info;				      -- Drop is used to delete the entire table


-- Practice questions:

ALTER TABLE info
CHANGE COLUMN std_name full_name VARCHAR(40);

DELETE FROM info 
WHERE marks < 80;

select * from info;

ALTER TABLE info
DROP COLUMN grade;
