use invenza;
go

CREATE PROCEDURE SP_AddProduct
    @SKU NVARCHAR(50),
    @Name NVARCHAR(100),
    @CategoryId INT,
    @Brand NVARCHAR(100),
    @Unit NVARCHAR(20),
    @Price DECIMAL(18,2),
    @TaxPercent DECIMAL(5,2)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO P01_PRODUCT
        (SKU, NAME, CATEGORY_ID, BRAND, UNIT, PRICE, TAX_PERCENT)
    VALUES
        (@SKU, @Name, @CategoryId, @Brand, @Unit, @Price, @TaxPercent);
END;
