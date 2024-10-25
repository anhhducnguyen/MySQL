CREATE DATABASE testttdb;
USE testttdb;

    CREATE TABLE Sales (
        saleID INT AUTO_INCREMENT PRIMARY KEY,
        saleDate DATE NOT NULL,
        price DECIMAL(10,2) NOT NULL
    );

INSERT INTO Sales (saleDate, price) VALUES
('2024-01-15', 999.99),
('2024-01-20', 499.99),
('2024-02-05', 299.99),
('2024-02-10', 199.99),
('2024-02-15', 89.99),
('2024-03-01', 49.99),
('2024-03-10', 29.99),
('2024-03-15', 199.99),
('2024-03-20', 129.99),
('2024-04-01', 499.99);

SELECT * FROM SALES;

SELECT DATE_FORMAT(saleDate, '%Y-%m') AS month, 
        SUM(price) AS totalRevenue, 
        COUNT(saleID) AS totalOrders, 
        AVG(price) AS averageRevenuePerOrder 
FROM Sales
GROUP BY month
ORDER BY month;