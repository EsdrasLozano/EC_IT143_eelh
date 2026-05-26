-- Step 5: Turn the view into a table.
IF OBJECT_ID('dbo.tbl_soccer_player_count_by_position', 'U') IS NOT NULL
    DROP TABLE dbo.tbl_soccer_player_count_by_position;
GO

-- Materialize data using SELECT INTO
SELECT * INTO dbo.tbl_soccer_player_count_by_position
FROM dbo.v_soccer_player_count_by_position;

-- Establish Data Architecture Integrity: PK and Restrictions
ALTER TABLE dbo.tbl_soccer_player_count_by_position
ADD CONSTRAINT PK_tbl_soccer_player_count_by_position PRIMARY KEY (Position_ID);
GO