-- Tạo một CSDL CompanyDB.
-- Tạo một CSDL với định nghĩa bảng  Employees với các trường EmployeeID, FirstName, LastName, HireDate, và Salary.
-- Sau đó, thêm một trường Department vào bảng Employees 
-- Chỉnh sửa kiểu dữ liệu của trường Salary thành decimal(10, 2).

CREATE DATABASE CompanyDB;

use CompanyDB;

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName NVARCHAR(225) NOT NULL,
    LastName NVARCHAR(255) NOT NULL,
    HireDate DATE NOT NULL,
    Salary FLOAT
);

ALTER TABLE Employees
ADD Department NVARCHAR(225) NOT NULL;

ALTER TABLE Employees
MODIFY Salary DECIMAL(10, 2);

