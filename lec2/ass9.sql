CREATE DATABASE EcommerceDB;
USE EcommerceDB;

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    CreateAt DATETIME
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    PriceAtOrder DECIMAL(10, 2) NOT NULL  
);

CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    UserID INT,
    Rating INT,
    ReviewText TEXT,
    CreatedAt DATETIME
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL
);

ALTER TABLE Orders
ADD CONSTRAINT fk_UserID_Orders FOREIGN KEY (UserID) REFERENCES Users(UserID);

ALTER TABLE Reviews
ADD CONSTRAINT fk_UserID_Reviews FOREIGN KEY (UserID) REFERENCES Users(UserID);

ALTER TABLE OrderDetails
ADD CONSTRAINT fk_ProductID_OrderDetails FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

ALTER TABLE OrderDetails
ADD CONSTRAINT fk_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);

ALTER TABLE Reviews
ADD CONSTRAINT fk_ProductID_Reviews FOREIGN KEY (ProductID) REFERENCES Products(ProductID);


INSERT INTO Users (UserName, PasswordHash, Email, CreateAt)
VALUES 
('Nguyen Van A', 'hashed_password_1', 'nguyenvana@example.com', NOW()),
('Tran Thi B', 'hashed_password_2', 'tranthib@example.com', NOW()),
('Le Van C', 'hashed_password_3', 'levanc@example.com', NOW());


INSERT INTO Products (ProductName, Description, Price, Stock)
VALUES 
('Product 1', 'Description for product 1', 100.00, 50),
('Product 2', 'Description for product 2', 150.00, 30),
('Product 3', 'Description for product 3', 200.00, 20);


INSERT INTO Orders (UserID, OrderDate, TotalAmount)
VALUES 
(1, NOW(), 250.00),
(2, NOW(), 150.00),
(3, NOW(), 300.00);


INSERT INTO OrderDetails (OrderID, ProductID, Quantity, PriceAtOrder)
VALUES 
(1, 1, 2, 100.00),
(1, 2, 1, 150.00),
(2, 1, 1, 100.00),
(2, 3, 1, 200.00),
(3, 2, 2, 150.00);


INSERT INTO Reviews (ProductID, UserID, Rating, ReviewText, CreatedAt)
VALUES 
(1, 1, 5, 'Excellent product!', NOW()),
(2, 2, 4, 'Very good quality.', NOW()),
(3, 3, 3, 'Satisfactory.', NOW()),
(1, 2, 4, 'Liked it very much!', NOW()),
(2, 1, 2, 'Could be better.', NOW());
