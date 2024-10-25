CREATE TABLE products (
    productID INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL
);

CREATE TABLE orderDetails (
    orderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    productID INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

ALTER TABLE orderDetails
ADD CONSTRAINT fk_productID FOREIGN KEY (productID) REFERENCES products(productID);


INSERT INTO products (productName, price) VALUES
('Laptop', 999.99),
('Smartphone', 499.99),
('Tablet', 299.99),
('Smartwatch', 199.99),
('Headphones', 89.99),
('Keyboard', 49.99),
('Mouse', 29.99),
('Monitor', 199.99),
('Printer', 129.99),
('Camera', 499.99);



INSERT INTO orderDetails (productID, quantity, price) VALUES
(1, 2, 999.99),  -- 2 Laptop
(2, 1, 499.99),  -- 1 Smartphone
(3, 3, 299.99),  -- 3 Tablet
(4, 1, 199.99),  -- 1 Smartwatch
(5, 5, 89.99),   -- 5 Headphones
(6, 4, 49.99),   -- 4 Keyboard
(7, 6, 29.99),   -- 6 Mouse
(8, 2, 199.99),  -- 2 Monitor
(9, 1, 129.99),  -- 1 Printer
(10, 1, 499.99); -- 1 Camera

SELECT p.productID, p.productName, SUM(od.quantity) AS Total_quantity
FROM products p
JOIN orderDetails od ON p.productID = od.productID
GROUP BY p.productID, p.productName
ORDER BY Total_quantity DESC;

