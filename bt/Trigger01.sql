CREATE DATABASE InventoryManagement;
USE InventoryManagement;

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Quantity INT
);

CREATE TABLE InventoryChanges (
    ChangeID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    OldQuantity INT,
    NewQuantity INT,
    ChangeDate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


DELIMITER $$

CREATE TRIGGER AfterProductUpdate
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO InventoryChanges (ProductID, OldQuantity, NewQuantity, ChangeDate)
    VALUES (OLD.ProductID, OLD.Quantity, NEW.Quantity, NOW());
END$$

DELIMITER ;


-- Thêm sản phẩm vào bảng Products
INSERT INTO Products (ProductName, Quantity) VALUES ('Product A', 50);
INSERT INTO Products (ProductName, Quantity) VALUES ('Product B', 100);
INSERT INTO Products (ProductName, Quantity) VALUES ('Product C', 200);

-- Cập nhật số lượng của Product A
UPDATE Products SET Quantity = 60 WHERE ProductID = 1;

-- Cập nhật số lượng của Product B
UPDATE Products SET Quantity = 90 WHERE ProductID = 2;

SELECT * FROM InventoryChanges;