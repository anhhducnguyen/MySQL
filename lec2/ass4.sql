-- Tạo bảng Orders với các trường OrderID, OrderDate, CustomerID, và TotalAmount. Áp dụng các ràng buộc chính và ngoài (foreign key) để đảm bảo dữ liệu hợp lệ.
-- Tạo bảng Orders với OrderID là khóa chính và CustomerID là khóa ngoại tham chiếu đến bảng Customers (giả định bảng Customers đã tồn tại).
-- Thêm ràng buộc CHECK để đảm bảo TotalAmount không âm.

CREATE TABLE Orders (
     OrderID INT AUTO_INCREMENT PRIMARY KEY, 
     OrderDate DATETIME NOT NULL, 
     CustomerID INT, 
     TotalAmount DECIMAL(10,2) CHECK (TotalAmount >= 0)
     FOREIGN KEY CustomerID REFERENCES Customers(CustomerID)
);