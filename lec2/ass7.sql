CREATE DATABASE test;
USE test;



CREATE TABLE SalesDetails (
    SaleDetailID INT AUTO_INCREMENT PRIMARY KEY,
    SaleID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    SaleDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10,2)
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName NVARCHAR(255),
    Category NVARCHAR(255),
    Price DECIMAL(10,2)
);

ALTER TABLE SalesDetails
ADD CONSTRAINT fk_SaleID FOREIGN KEY (SaleID) REFERENCES Sales(SaleID);

ALTER TABLE SalesDetails
ADD CONSTRAINT fk_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

INSERT INTO Products (ProductName, Category, Price)
VALUES 
    ('Laptop', 'Electronics', 1000.00),
    ('Smartphone', 'Electronics', 600.00),
    ('Headphones', 'Accessories', 100.00),
    ('Tablet', 'Electronics', 300.00),
    ('Keyboard', 'Accessories', 50.00);

INSERT INTO Sales (SaleDate, CustomerID, TotalAmount)
VALUES 
    ('2024-10-01', 1, 1700.00),
    ('2024-10-02', 2, 600.00),
    ('2024-10-03', 1, 350.00),
    ('2024-10-04', 3, 100.00);

INSERT INTO SalesDetails (SaleID, ProductID, Quantity, UnitPrice)
VALUES 
    (1, 1, 1, 1000.00), -- Laptop
    (1, 3, 2, 100.00),  -- Headphones
    (2, 2, 1, 600.00),  -- Smartphone
    (3, 4, 1, 300.00),  -- Tablet
    (3, 5, 1, 50.00),   -- Keyboard
    (4, 3, 1, 100.00);  -- Headphones




WITH RecentQuarter AS (
    SELECT 
        QUARTER(MAX(SaleDate)) AS LastQuarter,
        YEAR(MAX(SaleDate)) AS LastYear
    FROM Sales
)
SELECT 
    
    p.Category,
    SUM(sd.Quantity * sd.UnitPrice) AS TotalRevenue
FROM 
    Sales s
JOIN 
    SalesDetails sd ON s.SaleID = sd.SaleID
JOIN 
    Products p ON sd.ProductID = p.ProductID
JOIN 
    RecentQuarter rq ON QUARTER(s.SaleDate) = rq.LastQuarter
                      AND YEAR(s.SaleDate) = rq.LastYear
GROUP BY 
    p.Category
ORDER BY 
    TotalRevenue DESC;


SELECT 
    Category,
    TotalRevenue
FROM (
    SELECT 
        p.Category,
        SUM(sd.Quantity * sd.UnitPrice) AS TotalRevenue
    FROM 
        Sales s
    JOIN 
        SalesDetails sd ON s.SaleID = sd.SaleID
    JOIN 
        Products p ON sd.ProductID = p.ProductID
    WHERE 
        QUARTER(s.SaleDate) = (SELECT QUARTER(MAX(SaleDate)) FROM Sales)
        AND YEAR(s.SaleDate) = (SELECT YEAR(MAX(SaleDate)) FROM Sales)
    GROUP BY 
        p.Category
) AS CategoryRevenue
ORDER BY 
    TotalRevenue DESC
LIMIT 1;

