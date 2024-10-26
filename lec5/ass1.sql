-- CREATE DATABASE mydb;
-- USE mydb;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    CreateAt DATETIME
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Category VARCHAR(255),
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL
);

ALTER TABLE OrderDetails
ADD CONSTRAINT fk_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);


ALTER TABLE Orders
ADD CONSTRAINT fk_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);


ALTER TABLE OrderDetails
ADD CONSTRAINT fk_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID);


CREATE INDEX idx_Email ON Customers(Email);
CREATE INDEX idx_OrderDate ON Orders(OrderDate);