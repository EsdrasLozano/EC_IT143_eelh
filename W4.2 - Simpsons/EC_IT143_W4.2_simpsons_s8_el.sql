-- Step 8: Call the stored procedure.
EXEC dbo.usp_load_simpsons_spent_by_category;

SELECT * FROM dbo.tbl_simpsons_spent_by_category;