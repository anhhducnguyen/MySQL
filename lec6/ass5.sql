-- Thêm chỉ số để cải thiện hiệu suất
CREATE INDEX idx_OrderDate ON Orders(OrderDate);
CREATE INDEX idx_CustomerID ON Orders(CustomerID);
CREATE INDEX idx_SaleDate ON Sales(SaleDate);
CREATE INDEX idx_OrderID ON Sales(OrderID);


CREATE PROCEDURE GetMonthlyRevenueByCustomer
    @CustomerID INT,
    @MonthYear VARCHAR(7) -- định dạng 'YYYY-MM'
AS
BEGIN
    -- Tính tổng doanh thu
    SELECT 
        SUM(s.SaleAmount) AS TotalRevenue
    FROM 
        Orders o
    INNER JOIN 
        Sales s ON o.OrderID = s.OrderID
    WHERE 
        o.CustomerID = @CustomerID
        AND FORMAT(s.SaleDate, 'yyyy-MM') = @MonthYear;
END;
