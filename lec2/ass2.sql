-- use companydb;

-- Tạo bảng Products với kiểu dữ liệu phù hợp cho từng trường ProductID, ProductName, Category, Price, và StockQuantity.
-- Chèn 3 bản ghi vào bảng Products.

CREATE TABLE Products (
     ProductID INT AUTO_INCREMENT PRIMARY KEY, 
     ProductName NVARCHAR(255) NOT NULL, 
     Category NVARCHAR(255) NOT NULL, 
     Price DECIMAL(10,2) NOT NULL, 
     StockQuantity INT NOT NULL
);

INSERT INTO Products (ProductName, Category, Price, StockQuantity)  VALUES 
('ProductName A', 'Category A', 10000, 1),
('ProductName B', 'Category B', 20000, 2),
('ProductName C', 'Category C', 30000, 1);

SELECT *
FROM products;
