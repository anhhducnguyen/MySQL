-- Tạo bảng books
CREATE TABLE books (
    BookID int AUTO_INCREMENT PRIMARY KEY,
    Title nvarchar(255) NOT NULL,
    Author nvarchar(255) NOT NULL,
    Price decimal(10,2) NOT NULL,
    PublicationDate date NOT NULL
)

-- Chèn data vào bảng
INSERT INTO books (Title, Author, Price, PublicationDate) VALUES 
('The Great Gatsby', 'F. Scott Fitzgerald', 10.99, '1925-04-10'),
('To Kill a Mockingbird', 'Harper Lee', 7.99, '1960-07-11'),
('1984', 'George Orwell', 8.99, '1949-06-08'),
('Pride and Prejudice', 'Jane Austen', 6.99, '1813-01-28'),
('The Catcher in the Rye', 'J.D. Salinger', 9.99, '1951-07-16');

-- Cập nhật tiền của cuốn The Great Gatsby và 1984
UPDATE books
SET Price = 55.99
WHERE Title = 'The Great Gatsby';

UPDATE books
SET Price = 60.99
WHERE Title = '1984';

-- 1.Viết câu lệnh T-SQL để chọn tất cả các cột từ bảng “Books” 

SELECT * FROM books;

-- 2.Viết câu lệnh T-SQL để chọn tên sách và tác giả của những cuốn sách có giá lớn hơn 50 

SELECT Title, Author FROM books WHERE Price > 50; 


Guest (GuestID, Name, Address, Email) 
Room (RoomID, RoomType, PricePerNight) 
Reservation (ReservationID, GuestID, RoomID, StartDate, EndDate) 
Service (ServiceID, Service Name, Service Price) 
ServiceUsage (ServiceUsageID, Reservation ID, ServiceCode, UsageDate)

-- use store;

-- 1. Viết một câu lệnh T-SQL để tìm top 3 cửa hàng có doanh thu cao nhất trong quý hiện tại. Đưa ra thông tin về tên cửa hàng và tổng doanh thu.

SELECT s.StoreID, SUM(sd.Quantity * sd.UnitPrice) AS TotalRevenue
FROM sales s
JOIN salesdetails sd ON s.SaleID = sd.SaleID
GROUP BY s.StoreID
LIMIT 3;

-- 2. Viết một câu lệnh T-SQL để tính toán mức độ đóng góp của mỗi sản phẩm vào tổng doanh thu của cửa hàng có ID là 5 trong năm ngoái. Đưa ra thông tin về mã sản phẩm, tên sản phẩm, và tỷ lệ đóng góp so với tổng doanh thu của cửa hàng đó.



-- 3. Viết một câu lệnh T-SQL để tìm danh sách khách hàng có số lượng đơn hàng và tổng chi tiêu cao nhất trong năm 2024. Sắp xếp kết quả theo tổng chi tiêu giảm dần và chỉ chọn các khách hàng có tổng chi tiêu lớn hơn 10,000.

CREATE INDEX idx_sales_customer ON sales(CustomerID);
CREATE INDEX idx_salesdetails_saleid ON salesdetails(SaleID);
CREATE INDEX idx_sales_saledate ON sales(SaleDate);

SELECT 
    c.CustomerID, 
    c.CustomerName, 
    COUNT(s.SaleID) as OrderCount, 
    SUM(sd.Quantity * sd.UnitPrice) as TotalSpending
FROM sales s
JOIN customers c ON s.CustomerID = c.CustomerID
JOIN salesdetails sd ON sd.SaleID = s.SaleID
WHERE YEAR(s.SaleDate) = 2024
GROUP BY c.CustomerID, c.CustomerName
HAVING SUM(sd.Quantity * sd.UnitPrice) > 10000
ORDER BY TotalSpending DESC;