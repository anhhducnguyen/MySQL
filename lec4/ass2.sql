CREATE DATABASE testtdb;
USE testtdb;

CREATE TABLE sales (
    saleID INT AUTO_INCREMENT PRIMARY KEY,
    productID INT NOT NULL,
    saleDate DATE NOT NULL,
    quantity INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL
);

INSERT INTO sales (productID, saleDate, quantity, amount)
VALUES (1, '2024-10-25', 5, 150.75),
       (2, '2024-10-24', 3, 89.50),
       (3, '2024-10-23', 10, 500.00),
       (1, '2024-10-22', 2, 60.00),
       (4, '2024-10-21', 1, 25.00);

SELECT productID, count(SaleID) AS total_sales
FROM sales
GROUP BY productID;


