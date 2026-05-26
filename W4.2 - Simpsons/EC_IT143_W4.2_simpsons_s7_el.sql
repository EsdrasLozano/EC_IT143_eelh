-- Step 7: Turn the ad hoc SQL script into a stored procedure.
IF OBJECT_ID('dbo.usp_load_simpsons_spent_by_category', 'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_load_simpsons_spent_by_category;
GO

CREATE PROCEDURE dbo.usp_load_simpsons_spent_by_category AS
/**
Rev: 1.0
Dev: Esdras Lozano Hurtado
Desc: Precompiled ETL process to truncate and reload the spending summary by category.
**/
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.tbl_simpsons_spent_by_category;

    INSERT INTO dbo.tbl_simpsons_spent_by_category (Category, Total_Spent)
    SELECT Category, Total_Spent
    FROM dbo.v_simpsons_spent_by_category;
END;
GO