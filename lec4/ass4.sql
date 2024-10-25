CREATE TABLE products (
    productID INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);


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

SELECT MIN(price) AS min_price, MAX(price) AS max_price
FROM products

SELECT productName, price
FROM products
WHERE price = (SELECT MAX(price) FROM products) OR price = (SELECT MIN(price) FROM products);