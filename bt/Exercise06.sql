-- Thiết kế cơ sở dữ liệu và data cho các thành viên trong công ty để có thể theo dõi và thống kê được mức lương của các thành viên. 
-- Cơ sở dữ liệu cần cung cấp được thông tin cơ bản như mã nhân viên, tên nhân viên, tuổi, mức lương cũng như bộ phận làm việc. 1 nhân viên có thể làm ở nhiều bộ phận, và tên các bộ phận không được trùng nhau.


CREATE DATABASE sampledb;
USE sampledb;

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE Employee_Department (
    employee_id INT,
    department_id INT,
    PRIMARY KEY (employee_id, department_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);



INSERT INTO Employee (employee_id, name, age, salary) 
VALUES
(1, 'Nguyễn Văn A', 30, 1000000),
(2, 'Trần Thị B', 28, 1200000),
(3, 'Phan Minh C', 35, 1500000);


INSERT INTO Department (department_id, department_name)
VALUES
(1, 'Kế toán'),
(2, 'Marketing'),
(3, 'Tài chính'),
(4, 'Nhân sự');

INSERT INTO Employee_Department (employee_id, department_id)
VALUES
(1, 1), 
(1, 2), 
(2, 3), 
(3, 4), 
(3, 1); 

-- a. Viết câu lệnh SQL để liệt kê tất cả các nhân viên trong bộ phận có tên là "Kế toán". Kết quả cần hiển thị mã nhân viên và tên nhân viên.


SELECT 
    e.employee_id AS `Mã nhân viên`, 
    e.`name` AS `Tên nhân viên`
FROM Employee e
INNER JOIN Employee_Department ed ON e.employee_id = ed.employee_id
INNER JOIN Department d ON ed.department_id = d.department_id
WHERE d.department_name = 'Kế toán';

-- b. Viết câu lệnh SQL để tìm các nhân viên có mức lương lớn hơn 50,000. Kết quả trả về cần bao gồm mã nhân viên, tên nhân viên và mức lương.

SELECT 
    e.employee_id AS `Mã nhân viên`, 
    e.name AS `Tên nhân viên`, 
    e.salary AS `Mức lương`
FROM Employee e
WHERE e.salary > 50000;

-- c. Viết câu lệnh SQL để hiển thị tất cả các bộ phận và số lượng nhân viên trong từng bộ phận. Kết quả trả về cần bao gồm tên bộ phận và số lượng nhân viên.

SELECT 
    d.department_name AS `Tên bộ phận`, 
    COUNT(ed.employee_id) AS `Số lượng nhân viên`
FROM Department d
LEFT JOIN Employee_Department ed ON d.department_id = ed.department_id
GROUP BY d.department_name;

-- d. Viết câu lệnh SQL để tìm ra các thành viên có mức lương cao nhất theo từng bộ phận. Kết quả trả về là một danh sách theo bất cứ thứ tự nào. Nếu có nhiều nhân viên bằng lương nhau nhưng cũng là mức lương cao nhất thì hiển thị tất cả những nhân viên đó ra.


SELECT 
    e.employee_id AS `Mã nhân viên`, 
    e.name AS `Tên nhân viên`, 
    e.salary AS `Mức lương`, 
    d.department_name AS `Tên bộ phận`
FROM Employee e
INNER JOIN Employee_Department ed ON e.employee_id = ed.employee_id
INNER JOIN Department d ON ed.department_id = d.department_id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM Employee e2
    INNER JOIN Employee_Department ed2 ON e2.employee_id = ed2.employee_id
    INNER JOIN Department d2 ON ed2.department_id = d2.department_id
    WHERE d2.department_name = d.department_name
)
ORDER BY d.department_name;

-- e. Viết câu lệnh SQL để tìm các bộ phận có tổng mức lương của nhân viên vượt quá 100,000 (hoặc một mức tùy chọn khác). Kết quả trả về bao gồm tên bộ phận và tổng mức lương của bộ phận đó.

SELECT 
    d.department_name AS `Tên bộ phận`, 
    SUM(e.salary) AS `Tổng mức lương`
FROM Department d
INNER JOIN Employee_Department ed ON d.department_id = ed.department_id
INNER JOIN Employee e ON ed.employee_id = e.employee_id
GROUP BY d.department_name
HAVING SUM(e.salary) > 100000;  

-- f.Viết câu lệnh SQL để liệt kê tất cả các nhân viên làm việc trong hơn 2 bộ phận khác nhau. Kết quả cần hiển thị mã nhân viên, tên nhân viên và số lượng bộ phận mà họ tham gia.



SELECT 
    e.employee_id, 
    e.`name`, 
    COUNT(ed.department_id) AS department_count
FROM employee e
JOIN employee_department ed ON e.employee_id = ed.employee_id
GROUP BY e.employee_id, e.`name`
HAVING COUNT(ed.department_id) > 2;



