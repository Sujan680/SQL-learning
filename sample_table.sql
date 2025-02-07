CREATE DATABASE db_college;

USE db_college;

CREATE TABLE Student_info(
	rollno INT PRIMARY KEY,
    name VARCHAR(60),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(60)
);

INSERT INTO Student_Info
(rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 98, "A", "Mumbai"),
(103, "chetan", 86, "B", "Chennai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

SELECT * FROM Student_Info;

SELECT rollno, name, marks FROM Student_Info;

-- to extract unique rows from the table
SELECT DISTINCT city
FROM Student_Info;

SELECT * FROM Student_Info WHERE marks >= 80;
SELECT * FROM Student_Info WHERE grade = 'F';
SELECT * FROM Student_Info WHERE marks > 80 AND city = 'Delhi';
SELECT * FROM Student_Info WHERE marks > 80 OR city = 'Delhi';

SELECT * FROM Student_Info WHERE marks + 20 > 100;
SELECT * FROM Student_Info WHERE marks % 12 = 0;

SELECT * FROM Student_Info LIMIT 2;

SELECT * FROM Student_Info WHERE city IN('Pune', 'Mumbai');

SELECT * FROM Student_Info WHERE marks > 78  LIMIT 4;

SELECT * FROM Student_Info  ORDER BY marks;

-- querying top 3 marks of the student from table
SELECT * 
FROM Student_Info ORDER BY marks DESC
LIMIT 3; 

-- AGGREGATE FUNCTION: COUNT(), MAX(), MIN(), SUM(), AVG()
SELECT COUNT(MARKS) AS NumberOfStudents
FROM Student_Info;

SELECT MAX(MARKS) 
FROM Student_Info;

SELECT MIN(MARKS) 
FROM Student_Info;

SELECT AVG(MARKS) 
FROM Student_Info;

SELECT SUM(MARKS) 
FROM Student_Info;

-- Group by clause::- Groups rows that have the same values into summary rows.
-- It collects data from multiple records and groups the results by one or more column.
-- Generally used with Aggregate functions.

SELECT city, count(name) as No_Of_Students
FROM Student_Info
GROUP BY city;

SELECT city, max(marks) 
FROM Student_Info
GROUP BY city;

SELECT city, AVG(marks)
FROM Student_Info
GROUP BY city
ORDER BY AVG(marks);

SELECT grade, count(grade)
FROM Student_Info 
GROUP BY grade
ORDER BY grade;

-- HAVING CLAUSE: Similar to where i.e. applies some condition on rows;
-- Used when we want to apply any condition after applying grouping;
SELECT count(name), city
from Student_Info
group by city
having max(marks) > 90;

select * from Student_Info;

select grade, name, count(name)
from Student_Info
group by grade, name
having grade = 'C';

-- General Order
-- Select column(s)
-- From table_name
-- Whrere condition
-- Group By column
-- Having conditon(s)
-- Order by column(s) desc;

select city, count(name)
from Student_Info 
where grade = 'A' 
group by city
having max(marks) > 70
order by city;

-- query to make safe Updates off: 0 for 'off' and 1 to 'On'
SEt SQL_SAFE_UPDATES = 0;

-- Table related queries: 
-- Update

UPDATE Student_Info
SET grade = "O"
WHERE grade = "A";

update Student_Info
set marks = 72
where marks = 12;

update Student_Info
set grade = 'B'
where marks between 70 and 80;

update Student_Info
set grade = 'A'
where marks between 80 and 90;

update Student_Info 
set marks = marks - 3;

update Student_Info
set marks = 20
where rollno = 105;

-- Delete command

delete from Student_Info
where marks <= 40;


select * from Student_Info;

-- Revisiting Primary key and Foreign key in SQL
CREATE TABLE dept (
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO dept 
values
(101, 'English'),
(102, 'Science'),
(103, 'Nepali');

select * from dept;

UPDATE dept
SET id = 104
WHERE id = 103;

DELETE FROM dept
WHERE id = 102;

CREATE TABLE teacher (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- DROP TABLE teacher;

insert into teacher values
(1, 'Adam', 101),
(2, 'Sujan', 102),
(3, 'Denis', 103);

select * from teacher;

-- Cascading for Foreign key
-- on update cascade
-- on delete cascade
-- when we use this then when we do update or delete it automatically effects on another table


