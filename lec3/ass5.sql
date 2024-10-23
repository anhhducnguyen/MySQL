-- CREATE DATABASE coursesdb;
-- use coursesdb;

-- CREATE TABLE Students (
--     studentID INT AUTO_INCREMENT PRIMARY KEY,
--     studentName VARCHAR(50) NOT NULL,
--     major VARCHAR(50) NOT NULL
-- );

-- CREATE TABLE Courses (
--     courseID INT AUTO_INCREMENT PRIMARY KEY,
--     courseName VARCHAR(100) NOT NULL,
--     instructor VARCHAR(50) NOT NULL
-- );

-- Insert:
-- Thêm 4 sinh viên vào bảng Students.
-- Thêm 3 môn học vào bảng Courses.

-- INSERT INTO Students (studentName, major) VALUES 
-- ('Nguyen Van A', 'Công nghệ thông tin'),
-- ('Tran Thi B', 'Kinh tế'),
-- ('Le Van C', 'Quản trị kinh doanh'),
-- ('Pham Thi D', 'Thiết kế đồ họa');


-- INSERT INTO Courses (courseName, instructor) VALUES 
-- ('Lập trình cơ bản', 'Nguyen Minh'),
-- ('Quản lý dự án', 'Tran Thi'),
-- ('Thiết kế web', 'Le Van'),
-- ('Kinh tế vi mô', 'Pham Thi');

-- SELECT *
-- FROM Courses;

-- SELECT *
-- FROM Students;

-- Update:
-- Cập nhật tên môn học có CourseID = 2 thành 'Advanced Mathematics'.
-- Cập nhật chuyên ngành của sinh viên có StudentID = 3 thành 'Engineering'.

-- UPDATE Courses
-- SET courseName = 'Advanced Mathematics'
-- WHERE CourseID = 2;


-- UPDATE Students
-- SET major = 'Engineering'
-- WHERE StudentID = 3;


-- SELECT *
-- FROM Courses;

-- SELECT *
-- FROM Students;

-- Delete:
-- Xóa sinh viên với StudentID = 1 khỏi bảng Students.
-- Xóa môn học với CourseID = 3 khỏi bảng Courses.

-- DELETE FROM Students
-- WHERE StudentID = 1;

-- DELETE FROM Courses
-- WHERE CourseID = 3;

-- SELECT *
-- FROM Courses;

-- SELECT *
-- FROM Students;