create database pet_adoption;
USE pet_adoption;

-- Drop tables if they exist to avoid duplication
DROP TABLE IF EXISTS school;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS employee;

-- Create employee table
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    age INT,
    email VARCHAR(50),
    salary INT,
    department VARCHAR(20)
);

-- Insert data into employee
INSERT INTO employee VALUES
(101, 'alex', 30, 'alex@gmail.com', 20000, 'IT'),
(102, 'bob', 20, 'bob@gmail.com', 30000, 'salesforce'),
(103, 'sunny', 40, 'sunny@gmail.com', 35000, 'HR'),
(104, 'stella', 35, 'stella@gmail.com', 35000, 'sales'),
(105, 'nani', 40, 'nani@gmail.com', 50000, 'HR'),
(106, 'stella', 35, 'stella@gmail.com', 35000, 'sales'),
(107, 'nani', 35, 'nani@gmail.com', 50000, 'HR');

-- Aggregate Queries
SELECT AVG(salary) AS avg_salary_hr FROM employee WHERE department = 'HR';
SELECT COUNT(id) AS stella_count FROM employee WHERE name = 'stella';
SELECT MAX(salary) AS max_hr_salary FROM employee WHERE department = 'HR';
SELECT COUNT(name) AS count_employee FROM employee WHERE salary = 50000;
SELECT MAX(salary) AS max_it_salary FROM employee WHERE department = 'IT';

-- Simulate transaction (MySQL autocommit must be OFF for this to work)
START TRANSACTION;
DELETE FROM employee WHERE age = 20;
ROLLBACK;

START TRANSACTION;
DELETE FROM employee WHERE age = 40;
ROLLBACK;

-- Re-insert sample data
INSERT INTO employee VALUES
(108, 'aparna', 20, 'aparna@gmail.com', 30000, 'sales'),
(109, 'stella', 20, 'stella@gmail.com', 40000, 'HR');

-- More transaction usage
START TRANSACTION;
DELETE FROM employee WHERE age = 20;
ROLLBACK;

START TRANSACTION;
DELETE FROM employee WHERE age = 40;
ROLLBACK;

-- Final employee inserts
INSERT INTO employee VALUES
(110, 'kishore', 35, 'kishore@gmail.com', 35000, 'IT'),
(111, 'lucky', 28, 'lucky@gmail.com', 60000, 'salesforce'),
(112, 'nimmi', 30, 'nimmi@gmail.com', 30000, 'IT'),
(113, 'krish', 30, 'krish@gmail.com', 45000, 'sales');

-- Create emp table and populate
CREATE TABLE emp (
    id INT,
    name VARCHAR(20),
    age INT,
    email VARCHAR(50),
    salary INT,
    department VARCHAR(20)
);

INSERT INTO emp VALUES
(201, 'bob', 45, 'bob@gmail.com', 30000, 'IT'),
(107, 'lucky', 28, 'lucky@gmail.com', 60000, 'salesforce'),
(108, 'nimmi', 30, 'nimmi@gmail.com', 30000, 'IT'),
(202, 'heshi', 45, 'heshi@gmail.com', 30000, 'HR'),
(203, 'minnu', 45, 'minnu@gmail.com', 30000, 'HR');

-- Set operations in MySQL (use DISTINCT with UNION)
SELECT * FROM employee
UNION
SELECT * FROM emp;

SELECT * FROM employee
UNION ALL
SELECT * FROM emp;

-- Intersect simulation in MySQL
SELECT * FROM employee
WHERE (id, name, age, email, salary, department) IN (
    SELECT id, name, age, email, salary, department FROM emp
);

-- Except simulation (employee - emp)
SELECT * FROM employee
WHERE (id, name, age, email, salary, department) NOT IN (
    SELECT id, name, age, email, salary, department FROM emp
);

-- Column-specific EXCEPT simulation
SELECT name, salary, age FROM employee
WHERE (name, salary, age) NOT IN (
    SELECT name, salary, age FROM emp
);

-- Create customer table
CREATE TABLE customer (
    id INT UNIQUE,
    name VARCHAR(20) NOT NULL,
    state VARCHAR(20),
    age INT CHECK(age >= 18)
);

-- Insert values into customer
INSERT INTO customer VALUES
(1, 'lucky', 'AP', 22),
(2, 'kishore', 'AP', 22),
(3, 'charan', 'UP', 25),
(4, 'ani', 'Jammu', 22),
(5, 'heshi', 'Tamilnadu', 23),
(6, 'varsha', 'Kerala', 23),
(7, 'honey', 'Jammu', 20),
(8, 'fani', 'Tamilnadu', 25),
(9, 'priya', 'UP', 25),
(10, 'mani', 'Karnataka', 22);

-- Create student table
CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    schoolname VARCHAR(50)
);

INSERT INTO student VALUES
(1, 'aaa', 'school1'),
(2, 'bbb', 'school2'),
(3, 'ccc', 'school3'),
(4, 'ddd', 'school4');

-- Create school table with foreign key
CREATE TABLE school (
    branchname VARCHAR(50),
    id INT PRIMARY KEY,
    FOREIGN KEY (id) REFERENCES student(id)
);

INSERT INTO school VALUES
('chennai', 1),
('bangalore', 2),
('mangalore', 3),
('mumbai', 4);

-- Final SELECTs
SELECT * FROM employee;
SELECT * FROM emp;
SELECT * FROM customer;
SELECT * FROM student;
SELECT * FROM school;
