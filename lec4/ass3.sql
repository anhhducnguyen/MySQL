CREATE TABLE EmployeeSalaries (
    employeeID INT AUTO_INCREMENT PRIMARY KEY,
    departmentID INT NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);


INSERT INTO EmployeeSalaries (departmentID, salary)
VALUES (101, 5000.00),
       (102, 6000.50),
       (101, 5500.75),
       (103, 7000.00),
       (102, 6200.25);


SELECT DepartmentID, SUM(salary) AS sum_salary, AVG(salary) AS avg_salary
FROM EmployeeSalaries
GROUP BY departmentID;