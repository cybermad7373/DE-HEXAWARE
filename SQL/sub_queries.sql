CREATE DATABASE IF NOT EXISTS subqueries;
USE subqueries;

CREATE TABLE studentsdetails (
    name CHAR(15),
    roll INT,
    location CHAR(15)
);

CREATE TABLE sectiondetails (
    name CHAR(15),
    roll INT,
    section CHAR(5)
);

INSERT INTO studentsdetails VALUES 
('abhi',580,'Delhi'),('kiran',581,'assam'),
('aditya',582,'hyderabad'),('ram',583,'mumbai');

INSERT INTO sectiondetails VALUES 
('abhi',580,'A'),('ram',583,'A'),
('kiran',581,'B'),('aditya',582,'C');

-- Subquery 

SELECT DISTINCT * 
FROM studentsdetails
WHERE roll IN (SELECT roll FROM sectiondetails WHERE section = 'A');

SELECT s.name, s.roll, sec.section
FROM studentsdetails s
JOIN sectiondetails sec ON s.roll = sec.roll
WHERE sec.section = 'A';

SELECT name, roll
FROM studentsdetails
WHERE roll IN (SELECT roll FROM sectiondetails WHERE roll > 581);

-- Update with subquery
UPDATE sectiondetails 
SET section = 'A'
WHERE name IN (SELECT name FROM sectiondetails WHERE name = 'aditya');

-- Insert data
INSERT INTO studentsdetails 
SELECT name, roll, NULL FROM sectiondetails;

-- Exists
SELECT name, roll
FROM studentsdetails s
WHERE EXISTS (
    SELECT 1 FROM sectiondetails sec
    WHERE s.roll = sec.roll AND section = 'B'
);

-- ALL keyword
SELECT name, roll
FROM studentsdetails
WHERE roll > ALL (SELECT 581);

-- ANY keyword
SELECT name
FROM studentsdetails
WHERE roll = ANY (SELECT roll FROM sectiondetails WHERE roll > 581);

-- Create more tables
CREATE TABLE products (
    productID INT,
    productName VARCHAR(255), 
    supplierID INT, 
    categoryID INT
);

INSERT INTO products VALUES 
(1, 'chais', 1, 1),
(2, 'chang', 1, 1),
(3, 'Aniseed syrup', 1, 2),
(4, 'Chef Antons Cajun Seasoning', 2, 2),
(5, 'Chef Antons Gumbo Mix', 2, 2);

CREATE TABLE suppliers (
    supplierID INT,
    supplierName VARCHAR(255), 
    contactName VARCHAR(255),  
    address VARCHAR(255)
);

INSERT INTO suppliers VALUES 
(1, 'Exotic Liquid', 'Charlotte Cooper', '49 Gilbert st'),
(2, 'New Orleans Cajun Delights', 'shelley burke', 'P.O.Box 78934'),
(3, 'Grandma Kellys Homestead', 'Regina Murphy','707 Oxford Rd'),
(4, 'Tokyo Traders','Yoshi Nagase','9-8 Sekimai Musashino-shi');

SELECT supplierName
FROM suppliers s
WHERE EXISTS (
    SELECT 1 FROM products p WHERE p.supplierID = s.supplierID
);

CREATE TABLE orderdetails (
    orderDetailID INT,
    orderID INT,
    productID INT,
    quantity INT
);

INSERT INTO orderdetails VALUES
(1, 10248, 11, 12),
(2, 10248, 42, 10),
(3, 10248, 72, 5),
(4, 10249, 14, 9),
(5, 10249, 51, 40),
(6, 10250, 41, 10),
(7, 10250, 51, 35);

-- Fixing ProductIDs
UPDATE orderdetails SET productID = 1 WHERE productID = 11;
UPDATE orderdetails SET productID = 2 WHERE productID = 42;
UPDATE orderdetails SET productID = 4 WHERE productID = 14;
UPDATE orderdetails SET productID = 5 WHERE productID = 51;

-- Subqueries with ANY
SELECT productName
FROM products
WHERE productID = ANY (
    SELECT productID FROM orderdetails WHERE quantity > 7
);

-- ALL subquery
SELECT productName
FROM products
WHERE productID = ALL (
    SELECT productID FROM orderdetails WHERE quantity < 14
);

-- Set Membership
SELECT * FROM studentsdetails WHERE roll IN (580);

SELECT * FROM studentsdetails
WHERE roll IN (SELECT roll FROM sectiondetails);

SELECT roll, name
FROM studentsdetails 
WHERE roll NOT IN (
    SELECT roll FROM sectiondetails
);

-- Employee details
CREATE TABLE employeedetails (
    jobid VARCHAR(50), 
    departmentid INT, 
    salary INT
);

INSERT INTO employeedetails VALUES
('IT_PROG', 60, 5760),
('AC_ACCOUNT', 110, 8300),
('ST_MAN', 80, 7280),
('AD_ASST', 90, 4400),
('SH_CLERK', 50, 3215),
('FI_ACCOUNT', 90, 7920),
('PU_CLERK', 70, 780),
('SA_REP', 80, 8350),
('MK_REP', 80, 6000),
('ST_CLERK', 50, 2785);

SELECT jobid, AVG(salary) as avg_salary
FROM employeedetails
GROUP BY jobid
HAVING AVG(salary) < 10000;

-- Nested queries
CREATE TABLE stu (
    sid INT NOT NULL PRIMARY KEY,
    sname VARCHAR(40),
    semail VARCHAR(50)
);

CREATE TABLE stu_course (
    sid INT,
    cid INT,
    enroll_date DATE
);

CREATE TABLE dept (
    did INT NOT NULL PRIMARY KEY,
    dname VARCHAR(50)
);

CREATE TABLE course (
    cid INT NOT NULL PRIMARY KEY,
    cname VARCHAR(40),
    ccredits INT,
    cfee FLOAT,
    did INT
);

-- Insert values
INSERT INTO stu VALUES
(1,'harry potter','harry@gmail.com'),
(2,'ronald weasley','ron@gmail.com'),
(3,'hermione granger','hermione@gmail.com');

INSERT INTO dept VALUES (1,'IT'), (2,'COMPS');

INSERT INTO course VALUES
(1,'SQL Programming', 80, 12000, 1),
(2,'Java Programming', 100, 18000, 2),
(3,'Angular Programming', 80, 15000, 1);

INSERT INTO stu_course VALUES
(1,1,'2022-05-21'),
(1,3,'2022-05-21'),
(2,1,'2022-05-18'),
(3,2,'2022-05-20'),
(3,3,'2022-05-15');

-- Nested queries
SELECT * FROM stu
WHERE sid IN (
    SELECT sid FROM stu_course
    WHERE cid IN (
        SELECT cid FROM course
        WHERE did IN (
            SELECT did FROM dept WHERE dname='IT'
        )
    )
);

-- Stored procedure in MySQL

DELIMITER //
CREATE PROCEDURE pro1()
BEGIN
    SELECT * FROM studentsdetails;
END //
DELIMITER ;

CALL pro1();

DELIMITER //
CREATE PROCEDURE pro3()
BEGIN
    SELECT * FROM studentsdetails WHERE location = 'hyderabad';
END //
DELIMITER ;

CALL pro3();

DELIMITER //
CREATE PROCEDURE pro7(IN location VARCHAR(20))
BEGIN
    SELECT * FROM studentsdetails WHERE location = location;
END //
DELIMITER ;

CALL pro7('hyderabad');

-- Data Cleaning (Removing Duplicates)

-- 1. Add row number
CREATE TEMPORARY TABLE temp_duplicates AS
SELECT name, roll, location,
       ROW_NUMBER() OVER (PARTITION BY name ORDER BY roll) AS duplicate
FROM studentsdetails;

-- 2. Delete from studentsdetails using join
DELETE s FROM studentsdetails s
JOIN temp_duplicates t ON s.name = t.name AND s.roll = t.roll
WHERE t.duplicate > 1;

-- Remove nulls
DELETE FROM studentsdetails WHERE name IS NULL;

-- UPPER case conversion
UPDATE studentsdetails
SET location = UPPER(location);

-- Partition by examples
CREATE TABLE cars (
    car_make CHAR(25),
    car_model CHAR(25),
    car_type CHAR(25),
    car_prize INT
);

INSERT INTO cars VALUES 
('Ford', 'Mondeo', 'premium', 18200),
('Renault', 'Fuego', 'sport', 16500),
('Citroen', 'Cactus', 'premium', 19000),
('Ford', 'Falcon', 'sport', 16500),
('Ford', 'Galaxy', 'standard', 12400),
('Renault', 'Megane', 'standard', 14300),
('Citroen', 'Picasso', 'premium', 23400);

-- Partition query
SELECT car_make, car_model, car_prize,
       AVG(car_prize) OVER () AS overall_avg,
       AVG(car_prize) OVER (PARTITION BY car_type) AS type_avg
FROM cars;
