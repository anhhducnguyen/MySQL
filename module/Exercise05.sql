-- Làm thế nào để tạo một index trên cột productName của bảng products?
CREATE INDEX idx_product_name ON products (productName);

-- Hiển thị danh sách các index trong cơ sở dữ liệu?
SELECT 
    TABLE_NAME AS table_name,
    INDEX_NAME AS index_name
FROM information_schema.STATISTICS
WHERE TABLE_SCHEMA = 'buoi6'
GROUP BY TABLE_NAME, INDEX_NAME;

-- Trình bày cách xóa index idx_productName đã tạo trước đó?
DROP INDEX idx_product_name ON products;

-- Tạo một procedure tên getProductByPrice để lấy danh sách sản phẩm với giá lớn hơn một giá trị đầu vào (priceInput)?
DELIMITER $$
CREATE PROCEDURE getProductByPrice(IN priceInput DECIMAL(10, 2))
BEGIN
    SELECT productId, productName, price
    FROM products
    WHERE price > priceInput;
END $$
DELIMITER ;
	
-- Làm thế nào để gọi procedure getProductByPrice với đầu vào là 500000?
CAll getProductByPrice(500000);

-- Tạo một procedure getOrderDetails trả về thông tin chi tiết đơn hàng với đầu vào là orderId?
DELIMITER $$
CREATE PROCEDURE getOrderDetails(IN orderIdInput VARCHAR(100))
BEGIN
    SELECT 
        o.orderId,
        o.orderDate,
        o.customerId,
        od.productId,
        od.quantity,
        od.price
    FROM orders o
    JOIN order_details od ON o.orderId = od.orderId
    WHERE o.orderId = orderIdInput;
END $$
DELIMITER ;

-- Làm thế nào để xóa procedure getOrderDetails?
DROP PROCEDURE getOrderDetails;

-- Tạo một procedure tên addNewProduct để thêm mới một sản phẩm vào bảng products. Các tham số gồm productName, price, description, và quantity.
DELIMITER $$
CREATE PROCEDURE addNewProduct (IN productNamei VARCHAR(100),In pricei DECIMAL(10,2),IN descriptioni VARCHAR(200),IN quantityi INT )
BEGIN
	INSERT INTO products (productName, price, description, quantity)
    VALUES (productNamei,pricei,descriptioni,quantityi);
END $$
DELIMITER ;

-- Tạo một procedure tên deleteProductById để xóa sản phẩm khỏi bảng products dựa trên tham số productId.
DELIMITER $$
CREATE PROCEDURE deleteProductById(IN productIdi VARCHAR(100))
BEGIN
	DELETE FROM products
    WHERE productId=productIdi;
END $$
DELIMITER ;

-- Tạo một procedure tên searchProductByName để tìm kiếm sản phẩm theo tên (tìm kiếm gần đúng) từ bảng products.
DELIMITER $$
CREATE PROCEDURE searchProductByName(IN namei VARCHAR(50))
BEGIN
	SELECT * From products
    WHERE productName like namei;
END $$
DELIMITER ;

-- Tạo một procedure tên filterProductsByPriceRange để lấy danh sách sản phẩm có giá trong khoảng từ minPrice đến maxPrice.
DELIMITER $$
CREATE PROCEDURE filterProductsByPriceRange(IN minPrice DECIMAL(10,2),IN maxPrice DECIMAL(10,2))
BEGIN
	SELECT * From products
    WHERE price BETWEEN minPrice and maxPrice;
END $$
DELIMITER ;

-- Tạo một procedure tên paginateProducts để phân trang danh sách sản phẩm, với hai tham số pageNumber và pageSize.
DELIMITER $$
CREATE PROCEDURE paginateProducts(IN pageNumber int , IN pageSize INT )
BEGIN
	
END $$
DELIMITER ;