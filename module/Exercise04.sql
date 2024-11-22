use shopeefake;
-- Tạo view (Bảng ảo) để hiển thị dữ liệu theo các yêu cầu sau
-- View hiển thị tên sản phẩm (productName) và giá (price) từ bảng products với giá trị giá (price) lớn hơn 500,000 có tên là expensive_products
CREATE VIEW expensive_products AS
SELECT 
	productName,
    price
FROM products
WHERE price > 500000;

-- Truy vấn dữ liệu từ view vừa tạo expensive_products
SELECT * FROM expensive_products;
-- Làm thế nào để cập nhật giá trị của view? Ví dụ, cập nhật giá (price) thành 600,000 cho sản phẩm có tên Product A trong view expensive_products.
UPDATE expensive_products
SET price = 600000
WHERE productName = "Product A";

-- Làm thế nào để xóa view expensive_products?
DROP VIEW expensive_products;

--  Tạo một view hiển thị tên sản phẩm (productName), tên danh mục (categoryName) bằng cách kết hợp bảng products và categories.
CREATE VIEW product_category_view AS
SELECT 
    p.productName, 
    c.categoryName
FROM products p
JOIN categories c ON p.categoryId = c.categoryId;

SELECT * FROM product_category_view;