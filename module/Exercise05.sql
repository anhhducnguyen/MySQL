-- Làm thế nào để tạo một index trên cột productName của bảng products?
CREATE INDEX idx_productName ON products(productName);

-- Hiển thị danh sách các index trong cơ sở dữ liệu?
SHOW INDEX FROM products;

-- Trình bày cách xóa index idx_productName đã tạo trước đó?
DROP INDEX idx_productName ON products;

-- Tạo một procedure tên getProductByPrice để lấy danh sách 
-- sản phẩm với giá lớn hơn một giá trị đầu vào (priceInput)?
-- DELIMITER $$
CREATE PROCEDURE getProductByPrice(IN priceInput INT)
BEGIN
    SELECT * FROM products WHERE price > priceInput;
END $$
DELIMITER ;

-- Gọi Procedure getProductByPrice với đầu vào là 500000
-- 50000 có giá trị hơn
CALL getProductByPrice(50000);

-- Tạo một procedure getOrderDetails trả về thông tin
-- chi tiết đơn hàng với đầu vào là orderId?

DELIMITER $$

CREATE PROCEDURE getOrderDetails(IN orderIdInput VARCHAR(255))
BEGIN
    SELECT * FROM order_details WHERE orderId = orderIdInput;
END $$

DELIMITER ;


-- Làm thế nào để xóa procedure getOrderDetails?

DROP PROCEDURE getOrderDetails;

-- Tạo một procedure tên addNewProduct để thêm mới một sản phẩm vào bảng products. 
-- Các tham số gồm productName, price, description, và quantity.
DELIMITER $$
CREATE PROCEDURE addNewProduct(
    IN productName VARCHAR(255),
    IN price INT,
    IN description LONGTEXT,
    IN quantity INT
)
BEGIN
    INSERT INTO products (productName, price, description, quantity)
    VALUES (productName, price, description, quantity);
END $$
DELIMITER ;

-- Tạo một procedure tên deleteProductById
-- để xóa sản phẩm khỏi bảng products dựa trên tham số productId.
DELIMITER $$
CREATE PROCEDURE deleteProductById(IN productIdInput VARCHAR(255))
BEGIN
    DELETE FROM products WHERE productId = productIdInput;
END $$
DELIMITER ;

-- Tạo một procedure tên searchProductByName
-- để tìm kiếm sản phẩm theo tên (tìm kiếm gần đúng) từ bảng products.
DELIMITER $$
CREATE PROCEDURE searchProductByName(IN productNameInput VARCHAR(255))
BEGIN
    SELECT * FROM products WHERE productName LIKE CONCAT('%', productNameInput, '%');
END $$
DELIMITER ;

-- Tạo một procedure tên filterProductsByPriceRange 
-- để lấy danh sách sản phẩm có giá trong khoảng từ minPrice đến maxPrice.
DELIMITER $$
CREATE PROCEDURE filterProductsByPriceRange(IN minPrice INT, IN maxPrice INT)
BEGIN
    SELECT * FROM products WHERE price BETWEEN minPrice AND maxPrice;
END $$
DELIMITER ;

-- Tạo một procedure tên paginateProducts để phân trang danh sách sản phẩm,
-- với hai tham số pageNumber và pageSize.

DELIMITER $$
CREATE PROCEDURE paginateProducts(IN page_number INT, IN page_size INT)
BEGIN
DECLARE offset_value INT;
SET offset_value = page_size * (page_number-1);
SELECT * FROM Products
LIMIT page_size 
OFFSET offset_value;
END $$
DELIMITER ;