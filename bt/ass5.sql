CREATE DATABASE SalesDB;
USE SalesDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT, 
    FirstName VARCHAR(50), 
    LastName VARCHAR(50), 
    Email VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT, 
    ProductName VARCHAR(100), 
    Price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT, 
    CustomerID INT, 
    OrderDate DATE, 
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Promotions (
    PromotionID INT PRIMARY KEY AUTO_INCREMENT, 
    PromotionName VARCHAR(100), 
    DiscountPercentage DECIMAL(5, 2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT, 
    OrderID INT, 
    SaleDate DATE, 
    SaleAmount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE INDEX idx_orders_customerid ON Orders(CustomerID);
CREATE INDEX idx_sales_orderid ON Sales(OrderID);
CREATE INDEX idx_sales_saledate ON Sales(SaleDate);
CREATE INDEX idx_sales_saleamount ON Sales(SaleAmount);
CREATE INDEX idx_promotions_discountpercentage ON Promotions(DiscountPercentage);

INSERT INTO Customers (FirstName, LastName, Email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Alice', 'Brown', 'alice.brown@example.com'),
('Bob', 'Taylor', 'bob.taylor@example.com'),
('Charlie', 'Johnson', 'charlie.johnson@example.com');

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2024-07-10', 2500.00),
(2, '2024-07-12', 1800.00),
(3, '2024-07-15', 900.00),
(4, '2024-07-18', 300.00),
(5, '2024-07-20', 500.00);

INSERT INTO Promotions (PromotionName, DiscountPercentage) VALUES
('Summer Sale', 15.00),
('Black Friday', 30.00),
('Holiday Discount', 20.00),
('New Year Promo', 25.00),
('Special Offer', 10.00);

DELIMITER $$
CREATE PROCEDURE CalculateMonthlyRevenueAndApplyPromotion(
    IN monthYear VARCHAR(7), -- tháng và năm dạng 'YYYY-MM'
    IN revenueThreshold DECIMAL(10, 2) -- ngưỡng doanh thu để áp dụng khuyến mãi
)
BEGIN
    INSERT INTO Promotions (PromotionName, DiscountPercentage)
    SELECT 
        CONCAT('Promotion for Customer ', c.CustomerID) AS PromotionName,
        15.00 AS DiscountPercentage
    FROM Customers c
    INNER JOIN Orders o ON o.CustomerID = c.CustomerID
    WHERE DATE_FORMAT(o.OrderDate, '%Y-%m') = monthYear
    GROUP BY c.CustomerID
    HAVING SUM(o.TotalAmount) > revenueThreshold;
END $$
DELIMITER ;

CALL CalculateMonthlyRevenueAndApplyPromotion('2024-07', 5000);

SELECT * FROM Promotions;