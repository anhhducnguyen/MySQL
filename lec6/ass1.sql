CREATE DATABASE SalesDB; 
USE SalesDB;

-- DROP DATABASE SalesDB;

CREATE TABLE Sales(
    saleID INT AUTO_INCREMENT PRIMARY KEY,
    orderID INT ,
    saleDate DATE,
    saleAmount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Customers (
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT ,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2)NOT NULL
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    PromotionID INT
);

CREATE TABLE Promotions (
    PromotionID INT AUTO_INCREMENT PRIMARY KEY,
    PromotionName VARCHAR(100) NOT NULL,
    DiscountPercentage DECIMAL(5, 2) NOT NULL
);


ALTER TABLE Sales
ADD CONSTRAINT fk_OrderID_Sales FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);

ALTER TABLE OrderDetails
ADD CONSTRAINT fk_OrderID_OrderDetails FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);

ALTER TABLE OrderDetails
ADD CONSTRAINT fk_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

ALTER TABLE Products
ADD CONSTRAINT fk_PromotionID FOREIGN KEY (PromotionID) REFERENCES Promotions(PromotionID);

ALTER TABLE Orders
ADD CONSTRAINT fk_customerID FOREIGN KEY (customerID) REFERENCES Customers(customerID);


-- Thêm dữ liệu mẫu vào bảng Promotions trước
INSERT INTO Promotions (PromotionName, DiscountPercentage)
VALUES 
    ('New Year Sale', 10.00),
    ('Black Friday', 20.00),
    ('Summer Sale', 15.00);

-- Thêm dữ liệu mẫu vào bảng Customers
INSERT INTO Customers (firstName, lastName, email)
VALUES 
    ('John', 'Doe', 'johndoe@example.com'),
    ('Jane', 'Smith', 'janesmith@example.com'),
    ('Alice', 'Johnson', 'alicejohnson@example.com'),
    ('Bob', 'Brown', 'bobbrown@example.com');

-- Thêm dữ liệu mẫu vào bảng Products
INSERT INTO Products (ProductName, Price, PromotionID)
VALUES 
    ('Laptop', 1200.00, NULL),
    ('Smartphone', 700.00, 1),
    ('Tablet', 300.00, 2),
    ('Headphones', 100.00, NULL);

-- Thêm dữ liệu mẫu vào bảng Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
    (1, '2024-10-01 10:30:00', 1500.00),
    (2, '2024-10-05 15:00:00', 700.00),
    (3, '2024-10-10 12:00:00', 1200.00),
    (1, '2024-10-15 09:45:00', 300.00);

-- Thêm dữ liệu mẫu vào bảng OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES 
    (1, 1, 1, 1200.00),
    (1, 2, 1, 300.00),
    (2, 2, 1, 700.00),
    (3, 1, 1, 1200.00),
    (4, 3, 1, 300.00);

-- Thêm dữ liệu mẫu vào bảng Sales
INSERT INTO Sales (OrderID, saleDate, saleAmount)
VALUES 
    (1, '2024-10-01', 1500.00),
    (2, '2024-10-05', 700.00),
    (3, '2024-10-10', 1200.00),
    (4, '2024-10-15', 300.00);


CREATE PROCEDURE UpdateOrderTotalAmount (
    IN inOrderID INT,
    IN inNewTotalAmount DECIMAL(10, 2)
)
BEGIN
    UPDATE Orders
    SET TotalAmount = inNewTotalAmount
    WHERE OrderID = inOrderID;
END;

SELECT * FROM Orders

CALL UpdateOrderTotalAmount(1, 1800.00);
