use invenza;
GO


CREATE PROCEDURE SP_LogUserActivity
    @UserId INT,
    @Action NVARCHAR(255),
    @Module NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO U01_USER_ACTIVITY
        (USER_ID, ACTION, MODULE)
    VALUES
        (@UserId, @Action, @Module);
END;
