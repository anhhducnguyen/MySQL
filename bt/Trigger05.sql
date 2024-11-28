CREATE DATABASE InventoryManagement2;
USE InventoryManagement2;

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY, 
    ProductName VARCHAR(100) NOT NULL,        
    Quantity INT NOT NULL,                    
    LastUpdated DATETIME                      
);

CREATE TABLE InventoryChanges (
    ChangeID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,                  
    OldQuantity INT NOT NULL,                
    NewQuantity INT NOT NULL,                
    ChangeDate DATETIME NOT NULL,            
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) 
);

DELIMITER $$

-- Tạo Trigger để tự động cập nhật trường LastUpdated
CREATE TRIGGER BeforeProductUpdateSetDate
BEFORE UPDATE ON Products
FOR EACH ROW
BEGIN
    -- Cập nhật giá trị thời gian hiện tại cho trường LastUpdated
    SET NEW.LastUpdated = NOW();
END$$

DELIMITER ;


-- Thêm sản phẩm mẫu vào bảng Products
INSERT INTO Products (ProductName, Quantity, LastUpdated)
VALUES ('Laptop', 50, NULL),
       ('Smartphone', 30, NULL),
       ('Tablet', 20, NULL);
