use Invenza;
GO

CREATE PROCEDURE SP_CreateUser
    @Username NVARCHAR(50),
    @PasswordHash NVARCHAR(255),
    @RoleId INT,
    @Email NVARCHAR(100),
    @Phone NVARCHAR(20),
    @IpAddress NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO U01_USER
        (USERNAME, PASSWORD_HASH, ROLE_ID, EMAIL, PHONE)
    VALUES
        (@Username, @PasswordHash, @RoleId, @Email, @Phone);

    DECLARE @UserId INT = SCOPE_IDENTITY();

    INSERT INTO U01_USER_SESSION
        (USER_ID, LOGIN_TIME, IP_ADDRESS)
    VALUES
        (@UserId, GETDATE(), @IpAddress);
END;
