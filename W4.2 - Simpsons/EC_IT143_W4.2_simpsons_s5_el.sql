-- Step 5: Turn the view into a table.
IF OBJECT_ID('dbo.tbl_simpsons_spent_by_category', 'U') IS NOT NULL
    DROP TABLE dbo.tbl_simpsons_spent_by_category;
GO

-- Materialize query into physical storage
SELECT Category, Total_Spent
INTO dbo.tbl_simpsons_spent_by_category
FROM dbo.v_simpsons_spent_by_category;

-- Category is unique after GROUP BY, so it serves as the Primary Key
ALTER TABLE dbo.tbl_simpsons_spent_by_category
ADD CONSTRAINT PK_tbl_simpsons_spent_by_category PRIMARY KEY (Category);
GO