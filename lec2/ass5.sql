CREATE DATABASE buildb
USE buildb

-- Quản lý một hệ thống bán lẻ và cần thực hiện các thao tác cơ bản với cơ sở dữ liệu để theo dõi các sản phẩm và đơn hàng. Hệ thống cơ sở dữ liệu của bạn bao gồm hai bảng chính: Products và Orders.

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName NVARCHAR(255) NOT NULL,
    Category NVARCHAR(255) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL
);

CREATE TABLE  Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATETIME NOT NULL,
    Quantity INT NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL
);

ALTER TABLE Orders
ADD ProductID INT;

ALTER TABLE Orders
ADD CONSTRAINT fk_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID);


-- Thêm dữ liệu 
-- Chèn ít nhất 3 sản phẩm vào bảng Products.
-- Chèn ít nhất 2 đơn hàng vào bảng Orders, đảm bảo rằng các đơn hàng liên kết với các sản phẩm đã được thêm vào.

INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES 
('Product A', 'Category A', 100000, 1),
('Product B', 'Category B', 200000, 2),
('Product C', 'Category C', 150000, 2)
;




SELECT *
FROM Products

INSERT INTO Orders (OrderDate, Quantity, TotalAmount, ProductID)
VALUES 
    ('2024-10-22 10:30:00', 5, 150.00, 1),
    ('2024-10-22 12:45:00', 3, 90.00, 2);


SELECT *
FROM Orders


-- Cập nhật dữ liệu
-- Cập nhật giá của một sản phẩm cụ thể trong bảng Products.
-- Tính toán và cập nhật TotalAmount trong bảng Orders dựa trên Quantity và Price của sản phẩm liên quan.


UPDATE Products
SET Price = 250000
WHERE ProductID = 1;

SELECT *
FROM Products;


SELECT *
FROM table_name
WHERE condition;


UPDATE Orders 
JOIN Products ON Orders.ProductID = Products.ProductID
SET Orders.TotalAmount = Orders.Quantity * Products.Price;


SELECT *
FROM Orders

-- Truy vấn dữ liệu
-- Viết truy vấn để lấy danh sách tất cả sản phẩm và số lượng còn lại trong kho.
-- Viết truy vấn để lấy thông tin về tất cả các đơn hàng cùng với tên sản phẩm, số lượng, và tổng số tiền của từng đơn hàng.

SELECT p.ProductName, p.StockQuantity 
FROM products p


SELECT o.OrderID, p.ProductName, o.Quantity, o.TotalAmount
FROM Products p 
JOIN Orders o ON p.ProductID = o.ProductID;