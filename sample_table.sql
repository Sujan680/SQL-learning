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


