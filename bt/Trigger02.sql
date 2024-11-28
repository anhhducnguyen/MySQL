DELIMITER $$

CREATE TRIGGER BeforeProductDelete
BEFORE DELETE ON Products
FOR EACH ROW
BEGIN
    -- Kiểm tra nếu số lượng sản phẩm lớn hơn 10
    IF OLD.Quantity > 10 THEN
        -- Gây lỗi và ngăn việc xóa
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete product with quantity greater than 10';
    END IF;
END$$

DELIMITER ;


INSERT INTO Products (ProductName, Quantity) VALUES ('Headphones', 15);
INSERT INTO Products (ProductName, Quantity) VALUES ('Charger', 5);

-- Thử xóa sản phẩm với số lượng > 10 (Headphones)
DELETE FROM Products WHERE ProductID = 4;
-- Kết quả: Bị chặn với lỗi "Cannot delete product with quantity greater than 10"

-- Thử xóa sản phẩm với số lượng <= 10 (Charger)
DELETE FROM Products WHERE ProductID = 5;
-- Kết quả: Xóa thành công



