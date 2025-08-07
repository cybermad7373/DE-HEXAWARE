USE pet_adoption;

SHOW TABLES;

SELECT * FROM employee;

CREATE TABLE IF NOT EXISTS course (
    cid INT,
    id INT,
    coursename VARCHAR(20)
);

SELECT * FROM course;

-- INNER JOIN
SELECT name, department, cid, coursename
FROM employee
INNER JOIN course ON employee.id = course.id;

-- LEFT JOIN
SELECT name, department, cid, coursename
FROM employee
LEFT JOIN course ON employee.id = course.id;

-- RIGHT JOIN
SELECT name, cid, coursename
FROM employee
RIGHT JOIN course ON employee.id = course.id;

-- FULL OUTER JOIN simulation using UNION
SELECT * FROM employee
LEFT JOIN course ON employee.id = course.id
UNION
SELECT * FROM employee
RIGHT JOIN course ON employee.id = course.id;

-- NATURAL JOIN (simulate with INNER JOIN in MySQL)
SELECT name, cid, department
FROM employee
JOIN course ON employee.id = course.id;

-- CROSS JOIN
SELECT *
FROM employee
CROSS JOIN course;

-- EQUI JOIN
SELECT *
FROM employee, course
WHERE employee.id = course.id;

-- NON-EQUI JOIN
SELECT *
FROM employee, course
WHERE employee.id >= course.id;

-- SELF JOIN with alias
SELECT e1.name, e1.id, e1.salary
FROM employee e1, employee e2
WHERE e1.salary = e2.salary AND e2.name = 'krish';

SELECT e1.name, e1.id, e1.salary
FROM employee e1, employee e2
WHERE e1.salary = e2.salary AND e2.name = 'nimmi';

-- STRING FUNCTIONS
SELECT ASCII('CB'); 
SELECT CHAR(66); 
SELECT LENGTH('Microsoft sql'); 
SELECT LOWER('JHON'); 
SELECT REPLACE('Microsoft sql','sql','server'); 
SELECT REVERSE('python'); 
SELECT UPPER('aparna'); 
SELECT FORMAT(136.564, 4);  -- FORMAT used instead of STR

-- DATE FUNCTIONS
SELECT NOW(); 
SELECT DATE_ADD('2023-12-07', INTERVAL 2 MONTH); 
SELECT TIMESTAMPDIFF(YEAR, '2006-05-06', '2009-01-01'); 
SELECT MONTH('2008-05-22'); 
SELECT DAY('2023-05-30'); 
SELECT MONTH('2023-05-31'); 
SELECT YEAR('2023-05-03'); 

-- MATHEMATICAL FUNCTIONS
SELECT ABS(-101); 
SELECT SIN(1.5); 
SELECT CEIL(14.01); 
SELECT EXP(4.5); 
SELECT FLOOR(14.75); 
SELECT LOG(5.4); 

-- RANKING FUNCTIONS (MySQL 8+)
SELECT id, name, salary, 
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num 
FROM employee;

SELECT id, name, salary, 
       RANK() OVER (ORDER BY salary DESC) AS rank_num 
FROM employee;

SELECT id, name, salary, 
       DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rankk
FROM employee;

SELECT id, name, salary, 
       NTILE(2) OVER (ORDER BY salary) AS ntile_group 
FROM employee;

SELECT name, salary, 
       NTILE(3) OVER (ORDER BY salary) AS ntile_group 
FROM employee
WHERE salary > 40000;

-- SYSTEM-LIKE FUNCTIONS (LIMITED IN MYSQL)
SELECT @@hostname AS Hostname;
-- SELECT CONNECTION_ID(); -- equivalent to session ID
-- SELECT DATABASE();      -- current database name

-- AGGREGATE FUNCTIONS
SELECT COUNT(*) AS total_records FROM employee;

SELECT COUNT(*) FROM employee WHERE salary > 30000;

SELECT department, MIN(salary) AS min_salary
FROM employee
GROUP BY department;

SELECT department, MAX(salary) AS max_salary
FROM employee
GROUP BY department;

SELECT department, SUM(salary) AS total_salary
FROM employee
GROUP BY department;

SELECT department, AVG(salary) AS avg_salary
FROM employee
GROUP BY department;
