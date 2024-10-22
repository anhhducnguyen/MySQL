-- Làm việc với bảng Employees và Departments. Thực hiện các thao tác như truy vấn thông tin, cập nhật dữ liệu và xóa dữ liệu.
-- Truy vấn tất cả nhân viên thuộc phòng ban cụ thể.
-- Cập nhật thông tin lương của một nhân viên.
-- Xóa tất cả nhân viên có mức lương thấp hơn một giá trị nhất định.



SELECT * 
FROM Employees
WHERE Departments = 'Marketing'


UPDATE Employees
SET Salary = 100000.00
WHERE EmployeeID = 1;

DELETE FROM Employees
WHERE Salary < 30000.00;


