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