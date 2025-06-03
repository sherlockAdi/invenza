use invenza;
go

CREATE PROCEDURE SP_RecordStockMovement
    @ProductId INT,
    @WarehouseId INT,
    @MovementType NVARCHAR(20),
    @Quantity INT,
    @Reason NVARCHAR(255),
    @MovedBy INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO I01_STOCK_MOVEMENT
        (PRODUCT_ID, WAREHOUSE_ID, MOVEMENT_TYPE, QUANTITY, REASON, MOVED_BY)
    VALUES
        (@ProductId, @WarehouseId, @MovementType, @Quantity, @Reason, @MovedBy);

    IF @MovementType = 'IN'
        UPDATE I01_INVENTORY
        SET QUANTITY = QUANTITY + @Quantity, LAST_UPDATED = GETDATE()
        WHERE PRODUCT_ID = @ProductId AND WAREHOUSE_ID = @WarehouseId;

    ELSE IF @MovementType = 'OUT'
        UPDATE I01_INVENTORY
        SET QUANTITY = QUANTITY - @Quantity, LAST_UPDATED = GETDATE()
        WHERE PRODUCT_ID = @ProductId AND WAREHOUSE_ID = @WarehouseId;

    ELSE IF @MovementType = 'ADJUST'
        UPDATE I01_INVENTORY
        SET QUANTITY = @Quantity, LAST_UPDATED = GETDATE()
        WHERE PRODUCT_ID = @ProductId AND WAREHOUSE_ID = @WarehouseId;
END;
GO