CREATE DATABASE testdb;
USE testdb;

customers(customerID, name, email, joinDate)
orders(orderID, customerID, orderDate, totalAmount)

CREATE TABLE customers (
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL, 
    email VARCHAR(100) NOT NULL, 
    joinDate DATE
);

CREATE TABLE orders (
    orderID INT AUTO_INCREMENT PRIMARY KEY, 
    customerID INT NOT NULL, 
    orderDate DATETIME, 
    totalAmount DECIMAL(10,2)
);

ALTER TABLE customers
ADD CONSTRAINT fk_customerID FOREIGN KEY (customerID) REFERENCES orders(customerID);

-- Insert:
-- Thêm 4 khách hàng vào bảng Customers.
-- Thêm 5 đơn hàng vào bảng Orders với liên kết đến khách hàng.

INSERT INTO customers (name, email, joinDate) VALUES
('Nguyen Van A', 'a@gmail.com', '2024-10-22'),
('Nguyen Van B', 'b@gmail.com', '2024-10-22'),
('Nguyen Van C', 'c@gmail.com', '2024-10-22'),
('Nguyen Van D', 'd@gmail.com', '2024-10-22');

INSERT INTO orders (customerID, orderDate, totalAmount) VALUES
(1, '2024-10-23', 100000),
(2, '2024-10-23', 200000),
(2, '2024-10-23', 200000),
(3, '2024-10-23', 100000),
(4, '2024-10-23', 300000);

SELECT * FROM customers;
SELECT * FROM orders;


-- Update:
-- Cập nhật tổng số tiền của đơn hàng có OrderID = 3 thành 350.00.
-- Cập nhật địa chỉ email của khách hàng có CustomerID = 2.

UPDATE orders
SET totalAmount = 350.00
WHERE OrderID = 3;

UPDATE customers
SET email = 'z@gmail.com'
WHERE CustomerID = 2;


SELECT * FROM customers;
SELECT * FROM orders;

-- Delete:
-- Xóa khách hàng với CustomerID = 4 khỏi bảng Customers.
-- Xóa đơn hàng với OrderID = 1 khỏi bảng Orders.


DELETE FROM customers
WHERE CustomerID = 4;


DELETE FROM orders
WHERE OrderID = 1;


-- Truy Vấn:
-- Viết truy vấn để lấy tất cả thông tin đơn hàng cùng với tên khách hàng.
-- Viết truy vấn để lấy tổng số tiền đơn hàng của từng khách hàng (group by CustomerID).

SELECT o.orderID, o.customerID, o.orderDate, o.totalAmount, c.name
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID;


SELECT o.customerID, SUM(o.totalAmount) as Total
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY o.customerID