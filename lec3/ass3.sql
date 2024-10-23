CREATE DATABASE university;
USE university;

CREATE TABLE Students (
     StudentID INT AUTO_INCREMENT PRIMARY KEY, 
     Name NVARCHAR(255) NOT NULL, 
     Age INT NOT NULL, 
     Major NVARCHAR(255) NOT NULL
);


INSERT INTO Students (Name, Age, Major) VALUES 
('Alice', 20, 'Computer Science'),
('Bob', 22, 'Mathematics'),
('Charlie', 21, 'Physics');

SELECT *
FROM Students;

UPDATE Students
SET Age = 23
WHERE StudentID = 2;

SELECT *
FROM Students;


DELETE FROM Students
WHERE StudentID = 1;

SELECT *
FROM Students;

SELECT *
FROM Students;