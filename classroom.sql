
CREATE DATABASE college;   
CREATE DATABASE IF NOT EXISTS college;

USE college;

CREATE TABLE student
(	
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);


INSERT INTO student VALUES
(1, 'Sujan', 24),
(2, 'Binita', 34),
(3, 'Sudip', 21);

SELECT * FROM student;

insert into student values(4, 'Namita', 23);

DROP DATABASE IF EXISTS Company;

show databases;

show tables;


