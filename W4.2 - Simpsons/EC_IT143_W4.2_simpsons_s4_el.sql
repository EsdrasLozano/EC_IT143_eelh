-- Step 4: Turn the ad hoc SQL query into a view.
IF OBJECT_ID('dbo.v_simpsons_spent_by_category', 'V') IS NOT NULL
    DROP VIEW dbo.v_simpsons_spent_by_category;
GO

CREATE VIEW dbo.v_simpsons_spent_by_category AS
/**
Rev: 1.0
Dev: Esdras Lozano Hurtado
Desc: Displays the summary of total spending grouped by credit card commercial categories.
**/
SELECT Category, SUM(Amount) AS Total_Spent
FROM dbo.tblPlanet_Express
WHERE Category IS NOT NULL
GROUP BY Category;
GO