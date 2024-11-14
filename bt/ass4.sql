CREATE DATABASE bt_new;
USE bt_new;

CREATE TABLE Customers  (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(100),
    Country VARCHAR(100)
);


CREATE TABLE Orders  (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL
);


CREATE TABLE Products  (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);


CREATE TABLE OrderDetails  (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT, 
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2)
);

ALTER TABLE Orders 
ADD CONSTRAINT fk_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

ALTER TABLE OrderDetails  
ADD CONSTRAINT fk_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);

ALTER TABLE OrderDetails 
ADD CONSTRAINT fk_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

-- Hãy tạo một view để hiển thị thông tin đơn hàng

CREATE VIEW view_display_orders AS 
SELECT * FROM Orders 

-- Hãy tạo một view để hiển thị chi tiết đơn hàng

CREATE VIEW view_display_orderdetails AS 
SELECT * FROM OrderDetails 

-- Hãy tạo chỉ mục cho bảng Orders

CREATE INDEX idx_order_total_amount
ON Orders(TotalAmount);

-- Hãy tạo chỉ mục cho bảng OrdersDetails
CREATE INDEX idx_order_unit_price
ON OrderDetails(UnitPrice);

