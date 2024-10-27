CREATE DATABASE SalesDB;
USE SalesDB;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    CreateAt DATETIME
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Category VARCHAR(255),
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL
);

ALTER TABLE OrderDetails
ADD CONSTRAINT fk_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);


ALTER TABLE Orders
ADD CONSTRAINT fk_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);


ALTER TABLE OrderDetails
ADD CONSTRAINT fk_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

USE SalesDB;

-- Thêm dữ liệu vào bảng Customers
INSERT INTO Customers (CustomerName, Phone, CreateAt)
VALUES 
    ('Nguyen Van A', '0123456789', NOW()),
    ('Tran Thi B', '0987654321', NOW()),
    ('Le Van C', '0345678901', NOW()),
    ('Pham Thi D', '0912345678', NOW()),
    ('Hoang Van E', '0956789012', NOW());


-- Thêm nhiều dữ liệu vào bảng Products (đảm bảo ProductID từ 1 đến 10 có tồn tại)
INSERT INTO Products (ProductName, Category, Price)
VALUES 
    ('Product 1', 'Category A', 100.00),
    ('Product 2', 'Category B', 150.50),
    ('Product 3', 'Category A', 200.75),
    ('Product 4', 'Category C', 80.00),
    ('Product 5', 'Category B', 120.00),
    ('Product 6', 'Category D', 180.00);


-- Thêm nhiều dữ liệu vào bảng Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
    (1, NOW(), 300.00),
    (2, NOW(), 450.50),
    (3, NOW(), 600.75),
    (4, NOW(), 350.00),
    (5, NOW(), 150.00);


-- Thêm nhiều dữ liệu vào bảng OrderDetails (với các ProductID đã có trong bảng Products)
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES 
    (1, 1, 2, 100.00),
    (1, 2, 1, 150.50),
    (2, 2, 3, 150.50),
    (3, 3, 2, 200.75),
    (4, 4, 1, 80.00),
    (5, 5, 1, 120.00),
    (1, 6, 1, 180.00);


CREATE VIEW CustomerOrders_view AS
(
    SELECT O.OrderID, C.CustomerName, O.OrderDate, O.TotalAmount
    FROM customers C
    JOIN orders o ON  C.CustomerID = o.CustomerID
)

SELECT * FROM CustomerOrders_view;

UPDATE CustomerOrders_view
SET TotalAmount  = 250.00
WHERE OrderID = 1;