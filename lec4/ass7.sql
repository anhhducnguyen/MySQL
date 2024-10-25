-- CREATE DATABASE listdb;
-- USE listdb;

-- CREATE TABLE products (
--     productID INT AUTO_INCREMENT PRIMARY KEY,
--     productName VARCHAR(100) NOT NULL
-- );


-- CREATE TABLE regions (
--     regionID INT AUTO_INCREMENT PRIMARY KEY,
--     regionName VARCHAR(100) NOT NULL
-- );

-- CREATE TABLE sales (
--     saleID INT AUTO_INCREMENT PRIMARY KEY,
--     productID INT NOT NULL,
--     regionID INT NOT NULL,
--     saleDate DATE NOT NULL,
--     quantity INT NOT NULL,
--     amount DECIMAL(10, 2) NOT NULL
-- );

-- ALTER TABLE sales
-- ADD CONSTRAINT fk_productID FOREIGN KEY (productID) REFERENCES products(productID);

-- ALTER TABLE sales
-- ADD CONSTRAINT fk_regionID FOREIGN KEY (regionID) REFERENCES regions(regionID);

-- INSERT INTO products (productName) VALUES
-- ('Sản phẩm A'),
-- ('Sản phẩm B'),
-- ('Sản phẩm C');

-- INSERT INTO regions (regionName) VALUES
-- ('Khu vực 1'),
-- ('Khu vực 2'),
-- ('Khu vực 3');

-- INSERT INTO sales (productID, regionID, saleDate, quantity, amount) VALUES
-- (1, 1, '2024-01-01', 10, 100.00),
-- (2, 1, '2024-01-02', 5, 50.00),
-- (1, 2, '2024-01-03', 8, 80.00),
-- (3, 3, '2024-01-04', 12, 120.00);


-- Viết truy vấn để lấy thông tin về tổng doanh thu, 
-- số lượng sản phẩm bán ra, 
-- và sản phẩm bán chạy nhất trong từng khu vực.

SELECT r.regionName,
    SUM(s.amount) AS total_revenue,
    SUM(s.quantity) AS total_quantity
FROM sales s
JOIN regions r ON s.regionID = r.regionID
JOIN products p ON s.productID = p.productID
GROUP BY r.regionID
ORDER BY 
    total_revenue DESC;


