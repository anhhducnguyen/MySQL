-- Exercise 03
-- Áp dụng các kiến thức đã học về các mệnh đề truy vấn trong SQL, thực hiện các yêu cầu sau
-- Liệt kê tất cả các thông tin về sản phẩm (products).
SELECT * FROM shopeefake.products;
-- Tìm tất cả các đơn hàng (orders) có tổng giá trị (totalPrice) lớn hơn 500,000.
SELECT * FROM shopeefake.orders
WHERE totalPrice > 500.000;
-- Liệt kê tên và địa chỉ của tất cả các cửa hàng (stores).
SELECT `storeName`, `addressStore` FROM shopeefake.stores;
-- Tìm tất cả người dùng (users) có địa chỉ email kết thúc bằng '@gmail.com'.
SELECT * FROM shopeefake.users
WHERE email LIKE '%@gmail.com';
-- Hiển thị tất cả các đánh giá (reviews) với mức đánh giá (rate) bằng 5.
SELECT * FROM shopeefake.reviews WHERE rate = 5;
-- Liệt kê tất cả các sản phẩm có số lượng (quantity) dưới 10.
SELECT * FROM shopeefake.products WHERE quantity < 10;
-- Tìm tất cả các sản phẩm thuộc danh mục categoryId = 1.
SELECT * FROM shopeefake.products WHERE categoryId = 1;
-- Đếm số lượng người dùng (users) có trong hệ thống.
SELECT COUNT(*) AS `So luong nguoi dung` FROM shopeefake.users;
-- Tính tổng giá trị của tất cả các đơn hàng (orders).
SELECT SUM(totalPrice) AS `tổng giá trị của tất cả các đơn hàng` FROM shopeefake.orders;
-- Tìm sản phẩm có giá cao nhất (price).
SELECT * FROM products ORDER BY price DESC LIMIT 1;
-- Liệt kê tất cả các cửa hàng đang hoạt động (statusStore = 1).
SELECT * FROM shopeefake.stores
WHERE statusStore = 1;
-- Đếm số lượng sản phẩm theo từng danh mục (categories).
SELECT c.categoryName, COUNT(p.productId) AS `Số lượng sản phẩm`
FROM products p
JOIN categories c ON p.categoryId = c.categoryId
GROUP BY c.categoryName;
-- Tìm tất cả các sản phẩm mà chưa từng có đánh giá.
SELECT p.*, r.reviewId FROM shopeefake.products p
LEFT JOIN shopeefake.reviews r ON p.productId = r.productId
WHERE r.reviewId IS NULL;
-- Hiển thị tổng số lượng hàng đã bán (quantityOrder) của từng sản phẩm.
SELECT p.productId, p.productName, SUM(od.quantityOrder) AS `tổng số lượng hàng đã bán`
FROM shopeefake.products p
LEFT JOIN shopeefake.order_details od ON p.productId = od.productId
GROUP BY p.productId, p.productName;
-- Tìm các người dùng (users) chưa đặt bất kỳ đơn hàng nào.
SELECT u.* FROM shopeefake.users u
LEFT JOIN shopeefake.`orders` o ON u.userId = o.userId
WHERE o.orderID IS NULL;
-- Hiển thị tên cửa hàng và tổng số đơn hàng được thực hiện tại từng cửa hàng.
SELECT s.storeId, COUNT(o.orderId) AS `Tong don`
FROM shopeefake.stores s
LEFT JOIN shopeefake.orders o 
ON s.storeId = o.storeId
GROUP BY s.storeId;
-- Hiển thị thông tin của sản phẩm, kèm số lượng hình ảnh liên quan.
SELECT p.*, COUNT(i.imageId) AS `số lượng hình ảnh`
FROM shopeefake.products p
LEFT JOIN images i ON p.productId = i.productId
GROUP BY p.productId;
-- Hiển thị các sản phẩm kèm số lượng đánh giá và đánh giá trung bình.
SELECT 
    p.*, 
    COUNT(r.rate) AS totalReviews,       
    AVG(r.rate) AS averageRate    
FROM shopeefake.products p
LEFT JOIN reviews r ON p.productId = r.productId
GROUP BY p.productId, p.productName;
-- Tìm người dùng có số lượng đánh giá nhiều nhất.
SELECT u.*, COUNT(r.reviewId) AS review_count
FROM users u
LEFT JOIN reviews r ON u.userId = r.userId
GROUP BY u.userId
ORDER BY review_count DESC
LIMIT 1;
-- Hiển thị top 3 sản phẩm bán chạy nhất (dựa trên số lượng đã bán).
SELECT p.*, SUM(od.quantityOrder) AS top_3
FROM products p
LEFT JOIN order_details od ON p.productId = od.productId
GROUP BY p.productId
ORDER BY top_3 DESC
LIMIT 3;
-- Tìm sản phẩm bán chạy nhất tại cửa hàng có storeId = 'S001'.
SELECT p.*, SUM(od.quantityOrder) AS sp_top1
FROM products p
JOIN order_details od ON p.productId = od.productId
JOIN orders o ON od.orderId = o.orderId
WHERE o.storeId = 'S001'
GROUP BY p.productId
ORDER BY sp_top1 DESC
LIMIT 1;
-- Hiển thị danh sách tất cả các sản phẩm có giá trị tồn kho lớn hơn 1 triệu (giá * số lượng).
SELECT * FROM shopeefake.products p
WHERE p.price * p.quantity > 1000000;
-- Tìm cửa hàng có tổng doanh thu cao nhất.
SELECT s.storeId, s.storeName, SUM(o.totalPrice) AS total
FROM shopeefake.stores s
INNER JOIN orders o ON s.storeId = o.storeId
GROUP BY o.storeId 
ORDER BY total DESC
LIMIT 1;
-- Hiển thị danh sách người dùng và tổng số tiền họ đã chi tiêu.
SELECT u.userId, SUM(o.totalPrice) AS total
FROM shopeefake.users u
LEFT JOIN orders o ON u.userId = o.userId
GROUP BY u.userId;

-- Tìm đơn hàng có tổng giá trị cao nhất và liệt kê thông tin chi tiết.
SELECT *
FROM orders
ORDER BY totalPrice DESC
LIMIT 1;
-- Tính số lượng sản phẩm trung bình được bán ra trong mỗi đơn hàng.
SELECT AVG(total_quantity) AS `số lượng sản phẩm trung bình được bán ra trong mỗi đơn hàng`
FROM (
  SELECT COUNT(od.orderDetailId) AS total_quantity
  FROM order_details od
  GROUP BY od.orderId
) t;

-- Hiển thị tên sản phẩm và số lần sản phẩm đó được thêm vào giỏ hàng.
SELECT p.productName, COUNT(c.cartId) AS `Số lần sản phẩm đó được thêm vào giỏ hàng`
FROM shopeefake.products p
LEFT JOIN carts c ON p.productId = c.productId
GROUP BY p.productName;
-- Tìm tất cả các sản phẩm đã bán nhưng không còn tồn kho trong kho hàng.
SELECT p.*
FROM products p
LEFT JOIN order_details od ON p.productId = od.productId
WHERE p.quantity = 0 AND od.orderDetailId IS NOT NULL;
-- Tìm các đơn hàng được thực hiện bởi người dùng có email là duong@gmail.com'.
SELECT * 
FROM shopeefake.users u
INNER JOIN orders o ON u.userId = o.userId
WHERE u.email = 'duong@gmail.com';

-- Hiển thị danh sách các cửa hàng kèm theo tổng số lượng sản phẩm mà họ sở hữu.
SELECT 
    s.storeId, 
    s.storeName, 
    COUNT(p.productId) AS `Tổng các loại sản phẩm`,
    SUM(p.quantity) AS `Tổng số lượng sản phẩm mà họ sở hữu`
FROM stores s
LEFT JOIN products p ON s.storeId = p.storeId
GROUP BY s.storeId;
