drop database collegedb;
CREATE DATABASE CollegeDB;
use CollegeDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Grade CHAR(1)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    StudentID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);


INSERT INTO Students VALUES (1, 'Tom', 20, 'A');
INSERT INTO Students VALUES (2, 'Sam', 21, 'B');
INSERT INTO Students VALUES (3, 'Ram', 19, 'A');
INSERT INTO Students VALUES (4, 'RUthra', 22, 'C');

INSERT INTO Courses VALUES (101, 'Math', 1);
INSERT INTO Courses VALUES (102, 'Science', 2);
INSERT INTO Courses VALUES (103, 'English', 1);
INSERT INTO Courses VALUES (104, 'Math', 3);

UPDATE Students SET Grade = 'B' WHERE Name = 'Ram';

DELETE FROM Students WHERE StudentID = 4;

-- select 
SELECT * FROM Students;
SELECT Name, Grade FROM Students;
SELECT * FROM Students WHERE Age > 20;
SELECT * FROM Students WHERE Grade IN ('A', 'B');
SELECT * FROM Students WHERE Age BETWEEN 19 AND 21;
SELECT * FROM Students WHERE Name LIKE 'A%';
SELECT Name AS StudentName, Grade AS StudentGrade FROM Students;

-- String
SELECT UPPER(Name) AS UpperName, LENGTH(Name) AS NameLength FROM Students;
SELECT NOW() AS CurrentDate, CURDATE() AS Today;

-- Mmath
SELECT CEIL(4.3), FLOOR(4.7), ROUND(4.567, 2);
SELECT DATABASE() AS CurrentDatabase, CURRENT_USER() AS LoggedInUser;

-- aggregate
SELECT Grade, COUNT(*) AS CountPerGrade FROM Students GROUP BY Grade;
SELECT Name, Age FROM Students order by Age;
SELECT Name, Age FROM Students order by Age DESC;

SELECT Grade, COUNT(*) AS CountPerGrade 
FROM Students 
GROUP BY Grade 
HAVING COUNT(*) > 1;

-- Joins
SELECT s.Name, c.CourseName 
FROM Students s
JOIN Courses c ON s.StudentID = c.StudentID; -- Inner

SELECT s.Name, c.CourseName 
FROM Students s
LEFT JOIN Courses c ON s.StudentID = c.StudentID; -- left

SELECT s.Name, c.CourseName 
FROM Students s
RIGHT JOIN Courses c ON s.StudentID = c.StudentID; -- right

SELECT s.Name, c.CourseName 
FROM Students s
CROSS JOIN Courses c; -- xorss







