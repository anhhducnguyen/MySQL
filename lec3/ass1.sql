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