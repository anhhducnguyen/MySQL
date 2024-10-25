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


-- ALTER TABLE Invoices
-- ADD CONSTRAINT fk_invoiceID FOREIGN KEY (invoiceID) REFERENCES InvoiceDetails(invoiceID);

-- ALTER TABLE Products
-- ADD CONSTRAINT fk_productID FOREIGN KEY (productID) REFERENCES InvoiceDetails(productID);