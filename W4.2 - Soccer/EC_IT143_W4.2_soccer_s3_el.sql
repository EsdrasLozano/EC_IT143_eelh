-- Step 3: Create an ad hoc SQL query.
SELECT Position_ID, COUNT(Player_ID) AS Total_Players
FROM dbo.tblPlayerDim
GROUP BY Position_ID;