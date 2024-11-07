CREATE DATABASE qlda_nv;
USE qlda_nv;

CREATE TABLE Projects (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Budget DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectID INT,
    TaskName VARCHAR(100) NOT NULL,
    AssignedTo INT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Status VARCHAR(50) NOT NULL,
    HoursWorked DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (AssignedTo) REFERENCES Employees(EmployeeID)
);

-- Insert Dữ Liệu:
-- Thêm 3 dự án vào bảng Projects.
-- Thêm 5 nhân viên vào bảng Employees.
-- Thêm 6 công việc vào bảng Tasks với liên kết đến các dự án và nhân viên.


INSERT INTO `qlda_nv`.`employees`
(`EmployeeName`,`Position`,`HireDate`,`Salary`)VALUES
('Nguyễn Văn A', 'Manager', '2023-01-15', 1500.00),
('Trần Thị B', 'Developer', '2022-05-10', 1200.00),
('Lê Văn C', 'Tester', '2022-07-20', 1000.00),
('Phạm Thị D', 'Designer', '2023-03-25', 1300.00),
('Hoàng Văn E', 'Developer', '2021-11-30', 1150.00);

INSERT INTO `qlda_nv`.`projects`
(`ProjectName`,`StartDate`,`EndDate`,`Budget`)
VALUES
('Dự án A', '2023-01-01', '2023-12-31', 5000000.00),
('Dự án B', '2023-06-15', '2024-06-14', 3000000.00),
('Dự án C', '2023-09-01', '2024-03-01', 2000000.00);

INSERT INTO `qlda_nv`.`tasks`
(`ProjectID`,`TaskName`,`AssignedTo`,`StartDate`,`EndDate`,`Status`,`HoursWorked`)
VALUES
(1, 'Thiết kế cơ bản', 4, '2023-01-10', '2023-02-20', 'Hoàn thành', 150.00),
(1, 'Phát triển module chính', 2, '2023-02-21', '2023-06-15', 'Đang tiến hành', 300.00),
(1, 'Kiểm thử hệ thống', 3, '2023-06-16', '2023-07-30', 'Chưa bắt đầu', 0.00),
(2, 'Thiết kế giao diện', 4, '2023-06-20', '2023-08-05', 'Hoàn thành', 100.00),
(2, 'Phát triển tính năng', 5, '2023-08-06', '2023-11-30', 'Đang tiến hành', 200.00),
(3, 'Triển khai và bảo trì', 1, '2024-01-10', '2024-03-01', 'Chưa bắt đầu', 0.00);

-- Update Dữ Liệu:
-- Cập nhật ngân sách của dự án có ProjectID = 2 thành 50000.00.
-- Cập nhật số giờ làm việc của công việc có TaskID = 4 thành 25.50.


UPDATE `qlda_nv`.`projects`
SET
`Budget` = 50000.00
WHERE ProjectID = 2;

UPDATE `qlda_nv`.`tasks`
SET
`HoursWorked` = 25.50
WHERE TaskID = 4;

-- Delete Dữ Liệu:
-- Xóa nhân viên với EmployeeID = 3 khỏi bảng Employees.
-- Xóa công việc với TaskID = 5 khỏi bảng Tasks.

DELETE FROM `Tasks`
WHERE  AssignedTo = 3;

DELETE FROM `Employees`
WHERE  EmployeeID = 3;

DELETE FROM `Tasks`
WHERE  TaskID  = 5;

-- Tính Tổng Chi Phí: Viết truy vấn để tính tổng chi phí cho từng dự án. 
-- Chi phí của từng dự án được tính bằng tổng số giờ làm việc của tất cả các công việc trong dự án nhân với một tỷ lệ chi phí giờ làm việc giả định là 50.00.
SELECT 
    p.ProjectID,
    p.ProjectName,
    SUM(t.HoursWorked) * 50.00 AS `Tổng Chi Phí`
FROM 
    projects p
LEFT JOIN 
    tasks t ON p.ProjectID = t.ProjectID
GROUP BY 
    p.ProjectID, p.ProjectName;



-- Thống Kê Dự Án: Viết truy vấn để lấy danh sách các dự án cùng với tổng số công việc hoàn thành và số công việc đang thực hiện. Sử dụng hàm COUNT và CASE WHEN.

SELECT 
    p.ProjectID,
    p.ProjectName,
    COUNT(CASE WHEN t.Status = 'Hoàn thành' THEN 1 END) AS CompletedTasks,
    COUNT(CASE WHEN t.Status = 'Đang tiến hành' THEN 1 END) AS InProgressTasks
FROM 
    projects p
LEFT JOIN 
    tasks t ON p.ProjectID = t.ProjectID
GROUP BY 
    p.ProjectID, p.ProjectName;

-- Thống Kê Nhân Viên: Viết truy vấn để lấy thông tin các nhân viên cùng với số lượng công việc họ đã thực hiện và tổng số giờ làm việc của họ. 
-- Sử dụng LEFT JOIN và GROUP BY.

SELECT e.*, SUM(t.HoursWorked) AS ` Tổng số giờ làm việc`
FROM employees e
LEFT JOIN tasks t ON e.EmployeeID = t.AssignedTo
GROUP BY e.EmployeeID;

-- Tính Lương Trung Bình: Viết truy vấn để tính lương trung bình của các nhân viên theo vị trí (position). Sử dụng hàm AVG và GROUP BY
SELECT Position, AVG(Salary) AS `Lương Trung Bình`
FROM employees e
GROUP BY Position;
