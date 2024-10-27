CREATE VIEW CustomerOrders_view AS 
(
    SELECT o.OrderID, c.CustomerName, o.OrderDate, o.TotalAmount
    FROM customers c
    JOIN orders o ON c.CustomerID= o.CustomerID
)