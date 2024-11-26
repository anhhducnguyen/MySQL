CREATE PROCEDURE UpdateOrderTotalAndApplyPromotion
    @OrderID INT,                     -- ID của đơn hàng
    @NewTotalAmount DECIMAL(10, 2),   -- Tổng doanh thu mới
    @RevenueThreshold DECIMAL(10, 2) -- Ngưỡng doanh thu để áp dụng khuyến mãi
AS
BEGIN
    -- Bắt đầu transaction
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Cập nhật tổng doanh thu của đơn hàng
        UPDATE Orders
        SET TotalAmount = @NewTotalAmount
        WHERE OrderID = @OrderID;

        -- Kiểm tra nếu tổng doanh thu vượt qua ngưỡng
        IF @NewTotalAmount > @RevenueThreshold
        BEGIN
            -- Thêm khuyến mãi vào bảng Promotions
            INSERT INTO Promotions (PromotionName, DiscountPercentage)
            VALUES ('High Revenue Discount', 10.00); -- Giả sử khuyến mãi là giảm giá 10%
        END;

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
