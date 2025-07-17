CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Subject VARCHAR(100)
);

-- alter
ALTER TABLE Students ADD Gender VARCHAR(10);
ALTER TABLE Students MODIFY Age TINYINT;
ALTER TABLE Students CHANGE Grade GradeLetter CHAR(1);
ALTER TABLE Students DROP Gender;

ALTER TABLE Students ADD UNIQUE(Name);

Insert into Students Values(5, 'Toom', 20, 'A', 'male');
Insert into Students Values(6, 'Tom', 20, 'A', 'male'); -- will not wrk cuz of UNIQUE name key
 
 RENAME TABLE Students TO Learners;
RENAME TABLE Learners TO Students;

Insert into Teachers (Name, Subject) 
values
	('Karthik','Math'),
    ('Sarumathi','Science'),
    ('HEnna','English'),
    ('Tamzil Arasi','COmputer Science');

Select * from Teachers;

TRUNCATE TABLE Teachers;
Select * from Teachers;
show tables;
DROP TABLE Teachers;
show tables;

DESCRIBE Students;