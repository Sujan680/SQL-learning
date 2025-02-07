
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

-- Joins in SQL:-
-- Joins is used to combine rows from two or more tables, based on related column between them.

-- 1. Inner Joins
-- Returns the records that have matching values in both tables.

-- Syntax:  Select column(s)
-- 			From table_1
-- 			INNER JOIN table_2
--          ON table_1.col_name = table_2.col_name;


CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO student
VALUES
(101, 'adam'),
(102, 'bob'),
(103, 'casey');

select * from student;

CREATE TABLE course (
    student_id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO course
VALUES
(102, 'english'),
(105, 'math'),
(103, 'science'),
(107, 'computer');

select * from course;


SELECT * 
FROM student
INNER JOIN course
ON student.student_id = course.student_id
ORDER BY name desc;


-- 2. LEFT JOIN
-- Returns all records from the left table and the matched records from the right table.

-- Syntax
-- SELECT column(s)
-- FROM table_1
-- LEFT JOIN table_2
-- ON table_1.col_name  = table_2.col_name;

SELECT * FROM 
student LEFT JOIN
course ON student.student_id = course.student_id;

-- 3. Right JOIN
-- Returns all records from the right table and the matched records from the left table.

-- Syntax
-- SELECT column(s)
-- FROM table_1
-- RIGHT JOIN table_2
-- ON table_1.col_name  = table_2.col_name;

SELECT * FROM 
student RIGHT JOIN
course ON student.student_id = course.student_id;

-- 4. FULL JOIN
-- Returns all records when there is a match in either left or right table.
	-- Syntax:--
		-- LEFT JOIN 
		-- UNION 
		-- RIGHT JOIN

SELECT * FROM 
student as s
LEFT JOIN course AS c
ON s.student_id = c.student_id
UNION
SELECT * FROM student as s
RIGHT JOIN course as c
ON s.student_id = c.student_id; 

-- LEFT Exclusive JOIN

SELECT * FROM 
student as s
LEFT JOIN course as c
ON s.student_id = c.student_id
WHERE c.student_id IS NULL; -- it means it returns the items from s that doesn't match with the 
							-- corresponding entry in the another table(c)

-- RIGHT Exclusive join
-- The condition WHERE 's.student_id IS NULL' filters the results to only include rows
-- from the course table that do not have a corresponding entry in the student table.

SELECT * FROM 
student as s
RIGHT JOIN course as c
ON s.student_id = c.student_id
WHERE s.student_id IS NULL; -- it returns the items which don't have corresponding entry in table


-- ### SELF JOIN: it is a regular join but the table is joined with itself.

CREATE TABLE employee (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employee
VALUES
(101, 'adam', 103),
(102, 'bob', 104),
(103, 'casey', NULL),
(104, 'donald', 103);

select * from employee;

SELECT a.name as manager_name, b.name 
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

-- UNION in sql

SELECT id, name FROM employee
UNION
SELECT id, name FROM employee;

-- union all returns all the values from both tables with duplicate also
SELECT id, name FROM employee
UNION ALL
SELECT id, name FROM employee;



