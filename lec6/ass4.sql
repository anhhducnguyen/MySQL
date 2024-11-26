CREATE PROCEDURE DeleteOrderAndSales
    @OrderID INT
AS
BEGIN
    -- Bắt đầu transaction
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Xóa tất cả các bản ghi liên quan từ bảng Sales
        DELETE FROM Sales
        WHERE OrderID = @OrderID;

        -- Xóa đơn hàng từ bảng Orders
        DELETE FROM Orders
        WHERE OrderID = @OrderID;

        -- Commit transaction nếu không có lỗi
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback transaction nếu có lỗi
        ROLLBACK TRANSACTION;

        -- Thông báo lỗi
        THROW;
    END CATCH
END;
