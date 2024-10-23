-- CREATE DATABASE bestdb
-- USE bestdb

-- Quản lý cơ sở dữ liệu cho một ứng dụng thương mại điện tử và cần theo dõi thông tin về khách hàng và đơn hàng của họ. Bạn có các bảng Customers, Orders, và OrderDetails. 
-- Tạo bảng

-- CREATE TABLE Orders (
--     OrderID INT AUTO_INCREMENT PRIMARY KEY,
--     OrderDate DATE NOT NULL,
--     CustomerID INT NOT NULL
-- );

-- CREATE TABLE OrderDetails (
--     OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
--     OrderID INT NOT NULL,
--     ProductID INT NOT NULL,
--     Quantity INT NOT NULL,
--     UnitPrice DECIMAL(10,2) NOT NULL
-- );

-- CREATE TABLE Customers (
--     CustomerID INT AUTO_INCREMENT PRIMARY KEY,
--     CustomerName NVARCHAR(100) NOT NULL,
--     Email NVARCHAR(100) NOT NULL,
--     Phone NVARCHAR(15) NOT NULL
-- );

-- ALTER TABLE OrderDetails
-- ADD CONSTRAINT fk_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);

-- ALTER TABLE Orders
-- ADD CONSTRAINT fk_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);


-- Thêm dữ liệu 
-- Chèn ít nhất 2 khách hàng vào bảng Customers.

-- Chèn ít nhất 3 đơn hàng vào bảng Orders, liên kết với các khách hàng đã thêm.

-- Chèn ít nhất 5 chi tiết đơn hàng vào bảng OrderDetails, liên kết với các đơn hàng và sản phẩm.

-- INSERT INTO Customers (CustomerName, Email, Phone) VALUES
-- ('Nguyen Van A', '21012477@st.phenikaa-uni.edu.vn', '0981402765'),
-- ('Nguyen Van B', '21012497@st.phenikaa-uni.edu.vn', '0981422985');

-- INSERT INTO Orders (OrderDate, CustomerID) VALUES 
-- ('2024-10-17', 1),
-- ('2024-10-19', 2),
-- ('2024-10-22', 1);

-- INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES 
-- (1, 1, 2, 30.00),  -- Đơn hàng 1, sản phẩm 1, số lượng 2, giá 30.00
-- (1, 2, 1, 45.00),  -- Đơn hàng 1, sản phẩm 2, số lượng 1, giá 45.00
-- (2, 3, 3, 20.00),  -- Đơn hàng 2, sản phẩm 3, số lượng 3, giá 20.00
-- (3, 1, 4, 30.00),  -- Đơn hàng 3, sản phẩm 1, số lượng 4, giá 30.00
-- (3, 2, 2, 45.00);  -- Đơn hàng 3, sản phẩm 2, số lượng 2, giá 45.00

-- SELECT *
-- FROM Orders;

-- SELECT *
-- FROM OrderDetails;

-- SELECT *
-- FROM Customers;


-- Cập nhật dữ liệu
-- Cập nhật số điện thoại của một khách hàng cụ thể trong bảng Customers.

-- Xóa tất cả các đơn hàng của khách hàng không còn hoạt động (dựa trên một tiêu chí, ví dụ: khách hàng không còn tồn tại trong bảng Customers).

-- UPDATE Customers
-- SET Phone = '0944961056'
-- WHERE CustomerID = 1;

-- SELECT *
-- FROM Customers;




