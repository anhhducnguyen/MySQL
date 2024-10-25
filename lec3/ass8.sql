-- Invoices(invoiceID, invoiceDate, customerName)
-- InvoiceDetails(detailID, invoiceID, productID, quantity, price)
-- Products(productID, productName, price)

-- CREATE DATABASE basic;
-- USE basic;

-- CREATE TABLE Invoices (
--     invoiceID INT AUTO_INCREMENT PRIMARY KEY, 
--     invoiceDate DATETIME, 
--     customerName VARCHAR(100) NOT NULL
-- );


-- CREATE TABLE InvoiceDetails (
--     detailID INT AUTO_INCREMENT PRIMARY KEY, 
--     invoiceID INT NOT NULL, 
--     productID INT NOT NULL, 
--     quantity INT NOT NULL, 
--     price DECIMAL(10, 2) NOT NULL
-- );


-- CREATE TABLE Products (
--     productID INT AUTO_INCREMENT PRIMARY KEY, 
--     productName VARCHAR(100) NOT NULL,
--     price DECIMAL(10, 2) NOT NULL
-- );


-- ALTER TABLE InvoiceDetails
-- ADD CONSTRAINT fk_invoiceID FOREIGN KEY (invoiceID) REFERENCES Invoices(invoiceID);

-- ALTER TABLE InvoiceDetails
-- ADD CONSTRAINT fk_productID FOREIGN KEY (productID) REFERENCES Products(productID);

-- Insert:
-- Thêm 3 sản phẩm vào bảng Products.
-- Thêm 2 hóa đơn vào bảng Invoices.
-- Thêm 4 chi tiết hóa đơn vào bảng InvoiceDetails liên kết với hóa đơn và sản phẩm.

-- INSERT INTO Products (productName, price) VALUES
-- ('Laptop', 1200.00),
-- ('Smartphone', 750.50),
-- ('Headphones', 150.75);

-- INSERT INTO Invoices (invoiceDate, customerName) VALUES
-- ('2024-10-25 10:30:00', 'Nguyễn Văn A'),
-- ('2024-10-23 09:20:00', 'Lê Văn B');

-- INSERT INTO InvoiceDetails (invoiceID, productID, quantity, price) VALUES
-- (1, 1, 2, 1200.00),
-- (1, 1, 1, 150.75),  
-- (2, 2, 1, 750.50),   
-- (2, 3, 1, 300.99); 

-- Update:
-- Cập nhật giá của sản phẩm có ProductID = 1 thành 55.00.
-- Cập nhật số lượng sản phẩm trong chi tiết hóa đơn có DetailID = 2 thành 10.

-- UPDATE Products
-- SET price = 55.00
-- WHERE ProductID = 1;

-- UPDATE InvoiceDetails
-- SET quantity = 10
-- WHERE DetailID = 5;


-- SELECT *
-- FROM Products;

-- SELECT *
-- FROM InvoiceDetails;


-- Delete:
-- Xóa sản phẩm với ProductID = 3 khỏi bảng Products.
-- Xóa chi tiết hóa đơn với DetailID = 1 khỏi bảng InvoiceDetails.

-- DELETE FROM InvoiceDetails
-- WHERE ProductID = 3;

-- DELETE FROM Products
-- WHERE ProductID = 3;

-- DELETE InvoiceDetails, Products
-- FROM Products
-- JOIN InvoiceDetails ON Products.productID = InvoiceDetails.productID
-- WHERE Products.productID = [productID cần xóa];

DELETE FROM InvoiceDetails
WHERE DetailID = 6;

