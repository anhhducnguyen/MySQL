ALTER TABLE Users
ADD CONSTRAINT uq_username UNIQUE (UserName),
ADD CONSTRAINT uq_email UNIQUE (Email);

-- Đảm bảo các trường ProductName, Price, và Stock trong bảng Products không được để trống
ALTER TABLE Products
MODIFY COLUMN ProductName VARCHAR(100) NOT NULL,
MODIFY COLUMN Price DECIMAL(10, 2) NOT NULL,
MODIFY COLUMN Stock INT NOT NULL;

ALTER TABLE Orders
ADD CONSTRAINT chk_totalamount_positive CHECK (TotalAmount >= 0);

ALTER TABLE OrderDetails
ADD CONSTRAINT chk_quantity_positive CHECK (Quantity >= 0),
ADD CONSTRAINT chk_priceatorder_positive CHECK (PriceAtOrder >= 0);

ALTER TABLE Reviews
ADD CONSTRAINT chk_rating_range CHECK (Rating BETWEEN 1 AND 5);
