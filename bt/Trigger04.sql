DELIMITER $$

CREATE TRIGGER AfterProductUpdateSummary
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    UPDATE ProductSummary
    SET TotalQuantity = (SELECT SUM(Quantity) FROM Products);
END$$

DELIMITER ;


INSERT INTO Products (ProductName, Quantity) VALUES ('Laptop', 50);
INSERT INTO Products (ProductName, Quantity) VALUES ('Smartphone', 30);
INSERT INTO Products (ProductName, Quantity) VALUES ('Tablet', 20);


UPDATE Products SET Quantity = 60 WHERE ProductID = 1; 
UPDATE Products SET Quantity = 25 WHERE ProductID = 2;  

SELECT * FROM ProductSummary;
