CREATE DATABASE ECommerceDB;
USE ECommerceDB;

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    `Description` TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT, 
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    PriceAtOrder DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    UserID INT,
    Rating INT CHECK(Rating BETWEEN 1 AND 5),
    ReviewText TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE Orders
ADD CONSTRAINT fk_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID);

ALTER TABLE OrderDetails
ADD CONSTRAINT fk_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);

ALTER TABLE OrderDetails
ADD CONSTRAINT fk_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

ALTER TABLE Reviews
ADD CONSTRAINT fk_ProductID_Reviews FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

ALTER TABLE Reviews
ADD CONSTRAINT fk_UserID_Reviews FOREIGN KEY (UserID) REFERENCES Users(UserID);



-- Thực Hiện Các Thao Tác DML:
-- Insert:
-- Thêm ít nhất 3 người dùng mới vào bảng Users.

INSERT INTO Users (Username, PasswordHash, Email, CreatedAt) VALUES
('ducanh', '1234', 'ducanh@gmail.com', NOW()),
('maingan', '1234', 'maingan@gmail.com', NOW()),
('ngochuyen', '1234', 'ngochuyen@gmail.com', NOW());

-- Thêm 5 sản phẩm mới vào bảng Products.

INSERT INTO Products (ProductName, `Description`, Price, Stock) VALUES
('ProductName 1', 'Description 1', 10000, 10),
('ProductName 2', 'Description 2', 20000, 20),
('ProductName 3', 'Description 3', 50000, 30),
('ProductName 4', 'Description 4', 30000, 30),
('ProductName 5', 'Description 5', 20000, 10);

-- Thêm 2 đơn hàng mới vào bảng Orders, mỗi đơn hàng cần có ít nhất 2 chi tiết đơn hàng trong bảng OrderDetails.

INSERT INTO Orders (UserID, OrderDate, TotalAmount) VALUES
(1, NOW(), 30000),
(2, NOW(), 70000);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, PriceAtOrder) VALUES
(1, 1, 1, 10000),   -- Chi tiết đơn hàng cho OrderID 1
(1, 2, 1, 20000),   
(2, 2, 1, 20000),   -- Chi tiết đơn hàng cho OrderID 2
(2, 3, 1, 50000);   

-- Thêm ít nhất 3 đánh giá cho các sản phẩm trong bảng Reviews.

INSERT INTO Reviews (ProductID, UserID, Rating, ReviewText) VALUES
(1, 1, 5, 'Sản phẩm rất tốt, đáng tiền!'),
(2, 2, 4, 'Chất lượng ổn, giá cả hợp lý.'),
(3, 1, 3, 'Sản phẩm bình thường, không có gì đặc biệt.');


-- Update:
-- Cập nhật giá của một sản phẩm trong bảng Products.

UPDATE Products
SET Price = 35.00
WHERE ProductID = 2;

-- Cập nhật số lượng sản phẩm trong kho của một sản phẩm cụ thể.

UPDATE Products
SET Stock = 12
WHERE ProductID = 1;

-- Thay đổi địa chỉ email của một người dùng trong bảng Users.


UPDATE Users
SET Email = 'anhnguyen2k3@gmail.com'
WHERE UserID = 1;

-- Delete:
-- Xóa một sản phẩm khỏi bảng Products (đảm bảo rằng các bản ghi liên quan trong bảng OrderDetails và Reviews cũng được xử lý).

DELETE FROM Reviews
WHERE ProductID = 1;

DELETE FROM OrderDetails
WHERE ProductID = 1;

DELETE FROM Products
WHERE ProductID = 1;

-- Xóa một đơn hàng cụ thể và các chi tiết liên quan trong bảng OrderDetails.

DELETE FROM OrderDetails
WHERE OrderID = 1;

DELETE FROM Orders
WHERE OrderID = 1;




