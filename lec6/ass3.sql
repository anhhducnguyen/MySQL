CREATE PROCEDURE GetCustomerTotalRevenue
    @CustomerID INT,
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    -- Tính tổng doanh thu
    SELECT 
        SUM(od.Quantity * od.UnitPrice * (1 - ISNULL(p.DiscountPercentage, 0) / 100)) AS TotalRevenue
    FROM 
        Orders o
    INNER JOIN 
        OrderDetails od ON o.OrderID = od.OrderID
    LEFT JOIN 
        Products pr ON od.ProductID = pr.ProductID
    LEFT JOIN 
        Promotions p ON pr.PromotionID = p.PromotionID
    WHERE 
        o.CustomerID = @CustomerID
        AND o.OrderDate BETWEEN @StartDate AND @EndDate;
END;


EXEC GetCustomerTotalRevenue @CustomerID = 1, @StartDate = '2024-01-01', @EndDate = '2024-11-26';
