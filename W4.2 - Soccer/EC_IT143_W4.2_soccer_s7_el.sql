-- Step 7: Turn the ad hoc SQL script into a stored procedure.
IF OBJECT_ID('dbo.usp_load_soccer_player_count_by_position', 'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_load_soccer_player_count_by_position;
GO

CREATE PROCEDURE dbo.usp_load_soccer_player_count_by_position AS
/**
Rev: 1.0
Dev: Esdras Lozano Hurtado
Desc: Automates the ETL process to refresh the player count table from its source view.
**/
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.tbl_soccer_player_count_by_position;

    INSERT INTO dbo.tbl_soccer_player_count_by_position (Position_ID, Total_Players)
    SELECT Position_ID, Total_Players 
    FROM dbo.v_soccer_player_count_by_position;
END;
GO