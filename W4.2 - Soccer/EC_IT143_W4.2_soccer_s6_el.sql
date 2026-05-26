-- Step 6: Load the table from the view using an ad hoc SQL script.
-- Truncate to ensure a clean load without duplicating primary keys
TRUNCATE TABLE dbo.tbl_soccer_player_count_by_position;

-- Reload data directly from the logical layer (View)
INSERT INTO dbo.tbl_soccer_player_count_by_position (Position_ID, Total_Players)
SELECT Position_ID, Total_Players 
FROM dbo.v_soccer_player_count_by_position;
GO