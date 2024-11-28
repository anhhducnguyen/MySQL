DELIMITER $$

CREATE TRIGGER BeforeProductUpdateSetDate
BEFORE UPDATE ON Products
FOR EACH ROW
BEGIN
    SET NEW.LastUpdated = NOW();
END$$

DELIMITER ;

UPDATE Products SET Quantity = 60 WHERE ProductID = 1;
UPDATE Products SET Quantity = 30 WHERE ProductID = 2;

SELECT * FROM Products;
