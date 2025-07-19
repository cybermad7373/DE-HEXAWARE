INSERT INTO Students (StudentID, Name, Age, GradeLetter) VALUES 
(11, 'Arjun', 20, 'A','male'),
(8, 'Aravind', 21, 'B','male'),
(9, 'Rahul', 19, 'A','male'),
(10, 'Chavya', 22, 'C','female');

-- View all students
SELECT * FROM Students;
SELECT Name, GradeLetter FROM Students;
SELECT * FROM Students WHERE Age > 20;
SELECT * FROM Students ORDER BY Age DESC;


UPDATE Students 
SET GradeLetter = 'B' 
WHERE Name = 'Ram';

UPDATE Students 
SET Age = Age + 1;
-- SET SQL_SAFE_UPDATES = 0;  
SET SQL_SAFE_UPDATES = 0; 

UPDATE Students 
SET Name = 'Rameshh' 
WHERE StudentID = 1;

DELETE FROM Students 
WHERE StudentID = 4;
DELETE FROM Courses;

DELETE FROM Students 
WHERE Age < 20;

SELECT * FROM Students
WHERE Name LIKE 'R%';
