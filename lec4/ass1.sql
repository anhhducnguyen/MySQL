CREATE DATABASE basicdb;
USE basicdb;

CREATE TABLE customers (
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    customerName VARCHAR(100) NOT NULL,
    contactEmail VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    customerID INT NOT NULL,
    orderDate DATE NOT NULL,
    totalAmount DECIMAL(10, 2) NOT NULL
);

ALTER TABLE orders
ADD CONSTRAINT fk_customerID FOREIGN KEY (customerID) REFERENCES customers(customerID);

INSERT INTO customers (customerName, contactEmail) VALUES 
('Nguyễn Văn A', 'nguyenvana@example.com'),
('Trần Thị B', 'tranthib@example.com'),
('Lê Văn C', 'levanc@example.com'),
('Phạm Thị D', 'phamthid@example.com'),
('Đỗ Văn E', 'dovanE@example.com');


INSERT INTO orders (customerID, orderDate, totalAmount) VALUES 
(1, '2024-10-01', 150.00),
(1, '2024-10-05', 75.50),
(2, '2024-10-03', 200.00),
(3, '2024-10-07', 120.75),
(4, '2024-10-10', 300.00),
(5, '2024-10-12', 60.25);


SELECT o.orderID, o.orderDate, o.totalAmount , c.contactEmail, c.customerName
FROM customers c
JOIN orders o ON c.customerID = o.customerID;