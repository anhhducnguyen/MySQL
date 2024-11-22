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
SELECT * FROM shopeefake.products WHERE quantity < 100;
-- Tìm tất cả các sản phẩm thuộc danh mục categoryId = 1.
SELECT * FROM shopeefake.products WHERE categoryId = 1;
-- Đếm số lượng người dùng (users) có trong hệ thống.
SELECT COUNT(userId) AS `So luong nguoi dung` FROM shopeefake.users;
-- Tính tổng giá trị của tất cả các đơn hàng (orders).
SELECT SUM(totalPrice) AS `tổng giá trị của tất cả các đơn hàng` FROM shopeefake.orders;
-- Tìm sản phẩm có giá cao nhất (price).
SELECT MAX(price) AS `sản phẩm có giá cao nhất` FROM shopeefake.products;
-- Liệt kê tất cả các cửa hàng đang hoạt động (statusStore = 1).
SELECT * FROM shopeefake.stores
WHERE statusStore = 1;
-- Đếm số lượng sản phẩm theo từng danh mục (categories).
SELECT COUNT(*) FROM shopeefake.categories;
-- Tìm tất cả các sản phẩm mà chưa từng có đánh giá.
SELECT * FROM shopeefake.products p
LEFT JOIN shopeefake.reviews r ON p.productId = r.productId;
-- Hiển thị tổng số lượng hàng đã bán (quantityOrder) của từng sản phẩm.
SELECT p.productId, p.productName, SUM(quantityOrder) AS `tổng số lượng hàng đã bán`
FROM shopeefake.products p
JOIN shopeefake.order_details od ON p.productId = od.productId
GROUP BY p.productId;
-- Tìm các người dùng (users) chưa đặt bất kỳ đơn hàng nào.
SELECT * FROM shopeefake.users u
LEFT JOIN shopeefake.`orders` o ON u.userId = o.userId;
-- Hiển thị tên cửa hàng và tổng số đơn hàng được thực hiện tại từng cửa hàng.
SELECT s.storeId, COUNT(o.orderId) AS `Tong don`
FROM shopeefake.stores s
INNER JOIN shopeefake.orders o 
ON s.storeId = o.storeId
GROUP BY s.storeId;
-- Hiển thị thông tin của sản phẩm, kèm số lượng hình ảnh liên quan.
SELECT p.productId, COUNT(i.imageId) AS `số lượng hình ảnh`
FROM shopeefake.products p
INNER JOIN images i ON p.productId = i.productId
GROUP BY p.productId;
-- Hiển thị các sản phẩm kèm số lượng đánh giá và đánh giá trung bình.
SELECT 
    p.productId, 
    p.productName, 
    COUNT(r.rate) AS totalReviews,       
    AVG(r.rate) AS averageRate    
FROM shopeefake.products p
INNER JOIN reviews r ON p.productId = r.productId
GROUP BY p.productId, p.productName;
-- Tìm người dùng có số lượng đánh giá nhiều nhất.
SELECT 
    u.userId, u.userName, MAX(r.rate) AS `số lượng đánh giá nhiều nhất`
FROM shopeefake.users u
INNER JOIN reviews r ON u.userId = r.userId
GROUP BY u.userId;
-- Hiển thị top 3 sản phẩm bán chạy nhất (dựa trên số lượng đã bán).
SELECT p.productId, p.productName, p.quantitySold
FROM shopeefake.products p 
GROUP BY p.productId, productName
LIMIT 3;
-- Tìm sản phẩm bán chạy nhất tại cửa hàng có storeId = 'S001'.
SELECT 
    p.productName, 
    p.quantitySold
FROM shopeefake.stores s
INNER JOIN shopeefake.products p ON s.storeId = p.storeId
WHERE s.storeId = 'S001'
ORDER BY p.quantitySold DESC
LIMIT 1;
-- Hiển thị danh sách tất cả các sản phẩm có giá trị tồn kho lớn hơn 1 triệu (giá * số lượng).
SELECT * FROM shopeefake.products p
WHERE p.price * p.quantity > 1000000;
-- Tìm cửa hàng có tổng doanh thu cao nhất.
SELECT s.storeId, SUM(o.totalPrice) AS total
FROM shopeefake.stores s
INNER JOIN orders o ON s.storeId = o.storeId
GROUP BY o.storeId 
ORDER BY total DESC
LIMIT 1;
-- Hiển thị danh sách người dùng và tổng số tiền họ đã chi tiêu.
SELECT u.userId, SUM(o.totalPrice) AS total
FROM shopeefake.users u
INNER JOIN orders o ON u.userId = o.userId
GROUP BY u.userId;

-- Tìm đơn hàng có tổng giá trị cao nhất và liệt kê thông tin chi tiết.
SELECT *, totalPrice FROM shopeefake.orders
WHERE totalPrice = 
(
	SELECT MAX(totalPrice)
	FROM shopeefake.orders
);
-- Tính số lượng sản phẩm trung bình được bán ra trong mỗi đơn hàng.
SELECT o.orderId, o.nameOrder, AVG(od.quantityOrder) 
FROM shopeefake.products p
INNER JOIN order_details od ON p.productId = od.productId
INNER JOIN orders o ON o.orderId = od.orderId
GROUP BY o.orderId;
-- Hiển thị tên sản phẩm và số lần sản phẩm đó được thêm vào giỏ hàng.
SELECT p.productId, p.productName, c.quantityCart  
FROM shopeefake.products p
INNER JOIN carts c ON p.productId = c.productId;
-- Tìm tất cả các sản phẩm đã bán nhưng không còn tồn kho trong kho hàng.
SELECT 
    p.productId, 
    p.productName, 
    p.quantity
FROM products p
JOIN order_details od ON p.productId = od.productId
WHERE p.quantity = 0
GROUP BY p.productId;
-- Tìm các đơn hàng được thực hiện bởi người dùng có email là duong@gmail.com'.
SELECT * 
FROM shopeefake.users u
INNER JOIN orders o ON u.userId = o.userId
WHERE u.email = 'duong@gmail.com';

-- Hiển thị danh sách các cửa hàng kèm theo tổng số lượng sản phẩm mà họ sở hữu.
SELECT 
    s.storeId, 
    s.storeName, 
    SUM(p.quantity) AS totalProducts
FROM stores s
JOIN products p ON s.storeId = p.storeId
GROUP BY s.storeId;