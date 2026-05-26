-- Step 8: Call the stored procedure.
EXEC dbo.usp_load_soccer_player_count_by_position;

-- Validate target data payload
SELECT * FROM dbo.tbl_soccer_player_count_by_position;