-- CREATE DATABASE testtdb;
-- USE testtdb;

CREATE TABLE `SalesDetails` (
    `saleDetailID` INT AUTO_INCREMENT PRIMARY KEY,
    `saleID` INT,
    `productID` INT,
    `quantity` INT,
    `unitPrice` DECIMAL(10,2)
);

CREATE TABLE `Sales` (
    `saleID` INT AUTO_INCREMENT PRIMARY KEY,
    `saleDate` DATE,
    `customerID` INT,
    `totalAmount` DECIMAL(10, 2)
);

CREATE TABLE `Products` (
    `productID` INT AUTO_INCREMENT PRIMARY KEY,
    `productName` NVARCHAR(255),
    `category` NVARCHAR(255),
    `price` DECIMAL(10, 2)
);

ALTER TABLE SalesDetails
ADD CONSTRAINT fk_saleID FOREIGN KEY (saleID) REFERENCES Sales(saleID);


ALTER TABLE SalesDetails
ADD CONSTRAINT fk_productID FOREIGN KEY (productID) REFERENCES Products(productID);


-- Thêm dữ liệu vào bảng Products
INSERT INTO Products (productName, category, price)
VALUES 
    ('Product A', 'Category 1', 100.00),
    ('Product B', 'Category 1', 200.00),
    ('Product C', 'Category 2', 150.00),
    ('Product D', 'Category 3', 250.00),
    ('Product E', 'Category 2', 300.00);

-- Thêm dữ liệu vào bảng Sales
INSERT INTO Sales (saleDate, customerID, totalAmount)
VALUES 
    ('2023-01-15', 1, 500.00),
    ('2023-02-10', 2, 450.00),
    ('2023-03-05', 3, 800.00),
    ('2023-04-20', 1, 600.00);

-- Thêm dữ liệu vào bảng SalesDetails
INSERT INTO SalesDetails (saleID, productID, quantity, unitPrice)
VALUES 
    (1, 1, 2, 100.00),
    (1, 2, 1, 200.00),
    (2, 2, 2, 200.00),
    (2, 3, 1, 150.00),
    (3, 4, 3, 250.00),
    (4, 5, 2, 300.00);

-- SELECT * FROM Sales;

-- Viết một câu lệnh T-SQL để tính toán doanh thu hàng tháng của năm trước.

SELECT MONTH(saleDate) AS monthSale, SUM(totalAmount) AS total
FROM sales
WHERE YEAR(saleDate) = YEAR(CURRENT_DATE()) - 1
GROUP BY MONTH(saleDate)

-- Dự báo doanh thu cho tháng hiện tại dựa trên doanh thu hàng tháng của năm trước.

SELECT MONTH(saleDate) AS monthlyCurrent, AVG(totalAmount) AS forecast
FROM Sales
WHERE YEAR(saleDate) = YEAR(CURRENT_DATE()) - 1
GROUP BY MONTH(saleDate);

