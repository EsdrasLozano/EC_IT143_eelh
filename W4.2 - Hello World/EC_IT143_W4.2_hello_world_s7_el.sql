-- Step 7: Turn the ad hoc SQL script into a stored procedure.
IF OBJECT_ID('dbo.usp_load_hello_world', 'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_load_hello_world;
GO

CREATE PROCEDURE dbo.usp_load_hello_world AS
/**
Rev: 1.0
Dev: Esdras Lozano Hurtado
Desc: Automates the cleanup and reload of the initial greeting table.
**/
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.tbl_hello_world;

    INSERT INTO dbo.tbl_hello_world (Row_ID, Message, Current_Date)
    SELECT 1, Message, Current_Date
    FROM dbo.v_hello_world;
END;
GO