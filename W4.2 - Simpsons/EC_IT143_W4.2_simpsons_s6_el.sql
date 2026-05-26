-- Step 6: Load the table from the view using an ad hoc SQL script.
TRUNCATE TABLE dbo.tbl_simpsons_spent_by_category;

INSERT INTO dbo.tbl_simpsons_spent_by_category (Category, Total_Spent)
SELECT Category, Total_Spent
FROM dbo.v_simpsons_spent_by_category;
GO