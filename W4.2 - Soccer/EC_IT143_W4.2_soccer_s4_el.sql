-- Step 4: Turn the ad hoc SQL query into a view.
IF OBJECT_ID('dbo.v_soccer_player_count_by_position', 'V') IS NOT NULL
    DROP VIEW dbo.v_soccer_player_count_by_position;
GO

CREATE VIEW dbo.v_soccer_player_count_by_position AS
/**
Rev: 1.0
Dev: Esdras Lozano Hurtado
Desc: Summarizes total player count categorized by distinct position IDs.
**/
SELECT Position_ID, COUNT(Player_ID) AS Total_Players
FROM dbo.tblPlayerDim
GROUP BY Position_ID;
GO