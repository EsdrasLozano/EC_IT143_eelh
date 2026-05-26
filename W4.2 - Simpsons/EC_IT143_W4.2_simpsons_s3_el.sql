-- Step 3: Create an ad hoc SQL query.
SELECT Category, SUM(Amount) AS Total_Spent
FROM dbo.tblPlanet_Express
WHERE Category IS NOT NULL
GROUP BY Category;