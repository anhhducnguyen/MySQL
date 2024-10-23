-- CREATE DATABASE stockdb;
-- use stockdb;

-- CREATE TABLE Products (
--     productID INT AUTO_INCREMENT PRIMARY KEY,
--     productName VARCHAR(100) NOT NULL,
--     supplierID INT,
--     price DECIMAL(10,2) NOT NULL,
--     stock INT NOT NULL
-- );

-- CREATE TABLE Suppliers (
--     supplierID INT AUTO_INCREMENT PRIMARY KEY,
--     supplierName VARCHAR(100) NOT NULL,
--     contactEmail VARCHAR(100) NOT NULL
-- );

-- ALTER TABLE Products
-- ADD CONSTRAINT fk_supplierID FOREIGN KEY (supplierID) REFERENCES Suppliers(supplierID);

-- Insert:
-- Thêm 3 nhà cung cấp vào bảng Suppliers.
-- Thêm 4 sản phẩm vào bảng Products với liên kết đến nhà cung cấp.

-- INSERT INTO Suppliers (supplierName, contactEmail) VALUES
-- ('Nhà cung cấp A', 'nccA@example.com'),
-- ('Nhà cung cấp B', 'nccB@example.com'),
-- ('Nhà cung cấp C', 'nccC@example.com');

-- INSERT INTO Products (productName, supplierID, price, stock) VALUES
-- ('Sản phẩm 1', 1, 100.00, 50),
-- ('Sản phẩm 2', 1, 150.00, 30),
-- ('Sản phẩm 3', 2, 200.00, 20),
-- ('Sản phẩm 4', 3, 250.00, 10);

-- SELECT *
-- FROM Suppliers;

-- SELECT *
-- FROM Products;


-- Update:
-- Cập nhật giá của sản phẩm có ProductID = 2 thành 45.99.
-- Cập nhật tên nhà cung cấp có SupplierID = 1.


-- UPDATE Products
-- SET price = 45.99
-- WHERE ProductID = 2;

-- UPDATE Suppliers
-- SET supplierName = 'Socola'
-- WHERE SupplierID = 1;


-- SELECT *
-- FROM Suppliers;

-- SELECT *
-- FROM Products;


-- Delete:
-- Xóa nhà cung cấp với SupplierID = 3 khỏi bảng Suppliers.
-- Xóa sản phẩm với ProductID = 4 khỏi bảng Products.

-- Do có khóa ngoại nên cần xóa ở bảng chứa khóa ngoại
DELETE FROM Products WHERE SupplierID = 3;

DELETE FROM Suppliers
WHERE SupplierID = 3;


-- DELETE FROM Products
-- WHERE ProductID = 4;

-- SELECT p.ProductID, p.ProductName, p.Price, p.stock, s.supplierName
-- FROM Products p
-- JOIN Suppliers s ON p.supplierID  = s.supplierID;