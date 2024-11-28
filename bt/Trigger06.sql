CREATE DATABASE InventoryManagement;
USE InventoryManagement;

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL
);

CREATE TABLE InventoryChanges (
    ChangeID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    OldQuantity INT,
    NewQuantity INT,
    ChangeDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ProductRestock (
    RestockID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    RestockQuantity INT,
    RestockDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


DELIMITER $$

CREATE TRIGGER AfterProductUpdateRestock
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    IF NEW.Quantity < 10 THEN
        INSERT INTO ProductRestock (ProductID, RestockQuantity)
        VALUES (NEW.ProductID, 100);  
    END IF;
END$$

DELIMITER ;


INSERT INTO Products (ProductName, Quantity) VALUES ('Laptop', 50);
INSERT INTO Products (ProductName, Quantity) VALUES ('Smartphone', 15);
INSERT INTO Products (ProductName, Quantity) VALUES ('Tablet', 8);


UPDATE Products SET Quantity = 5 WHERE ProductID = 3; 


SELECT * FROM ProductRestock;
