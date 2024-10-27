CREATE DATABASE SalesDB;
USE SalesDB;


CREATE TABLE sales (
    saleID INT AUTO_INCREMENT PRIMARY KEY,
    orderID INT NOT NULL,
    saleDate DATE,
    saleAmount DECIMAL(10,2)
);

CREATE TABLE orders (
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    customerID INT NOT NULL,
    orderDate DATE,
    totalAmount DECIMAL(10,2)
);

CREATE TABLE customers (
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE products (
    productID INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100),
    price DECIMAL(10,2)
);


CREATE TABLE orderItems (
    orderItemID INT AUTO_INCREMENT PRIMARY KEY,
    orderID INT NOT NULL,
    productID INT NOT NULL,
    quantity INT,
    price DECIMAL(10,2)
);

ALTER TABLE sales
ADD CONSTRAINT fk_orderID_sales FOREIGN KEY (orderID) REFERENCES orders(orderID);

ALTER TABLE orderItems
ADD CONSTRAINT fk_orderID_orderItems FOREIGN KEY (orderID) REFERENCES orders(orderID);

ALTER TABLE orders
ADD CONSTRAINT fk_customerID FOREIGN KEY (customerID) REFERENCES customers(customerID);

ALTER TABLE orderItems
ADD CONSTRAINT fk_productID FOREIGN KEY (productID) REFERENCES products(productID);


INSERT INTO customers (firstName, lastName, email)
VALUES 
    ('Nguyen', 'Van A', 'nguyenvana@example.com'),
    ('Tran', 'Thi B', 'tranthib@example.com'),
    ('Le', 'Van C', 'levanc@example.com'),
    ('Pham', 'Thi D', 'phamthid@example.com'),
    ('Hoang', 'Van E', 'hoangvane@example.com');


INSERT INTO products (productName, price)
VALUES 
    ('Product 1', 100.00),
    ('Product 2', 150.50),
    ('Product 3', 200.75),
    ('Product 4', 80.00),
    ('Product 5', 120.00);


INSERT INTO orders (customerID, orderDate, totalAmount)
VALUES 
    (1, NOW(), 300.00),
    (1, NOW(), 450.50),
    (1, NOW(), 600.75),
    (4, NOW(), 350.00),
    (5, NOW(), 150.00);


INSERT INTO orderItems (orderID, productID, quantity, price)
VALUES 
    (1, 1, 2, 100.00),
    (1, 2, 1, 150.50),
    (2, 2, 3, 150.50),
    (3, 3, 2, 200.75),
    (4, 4, 1, 80.00),
    (5, 5, 1, 120.00);


INSERT INTO sales (orderID, saleDate, saleAmount)
VALUES 
    (1, NOW(), 300.00),
    (2, NOW(), 450.50),
    (3, NOW(), 600.75),
    (4, NOW(), 350.00),
    (5, NOW(), 150.00);


SELECT * from sales


-- Hãy tạo view CustomerOrderSummary để hiển thị:
-- CustomerID
-- CustomerName (tên đầy đủ của khách hàng)
-- TotalOrders (số lượng đơn hàng của khách hàng)
-- TotalAmountSpent (tổng số tiền đã chi tiêu)
-- Truy vấn từ view CustomerOrderSummary để tìm các khách hàng có tổng số tiền chi tiêu trên 5000


CREATE INDEX idx_customerID ON Orders(customerID);
CREATE INDEX idx_orderID ON OrderItems(orderID);
CREATE INDEX idx_productID ON OrderItems(productID);


CREATE VIEW CustomerOrderSummary_view AS
(
    SELECT c.CustomerID, CONCAT(c.firstName, ' ', c.lastName), COUNT(o.orderID) AS TotalOrders, COALESCE(SUM(o.totalAmount), 0) AS TotalAmountSpent
    FROM customers c 
    JOIN orders o ON c.customerID = o.customerID
    GROUP BY customerID
)

DROP VIEW CustomerOrderSummary_view;

SELECT * FROM CustomerOrderSummary_view
WHERE TotalAmountSpent > 150

explain SELECT * FROM CustomerOrderSummary_view
WHERE TotalAmountSpent > 150