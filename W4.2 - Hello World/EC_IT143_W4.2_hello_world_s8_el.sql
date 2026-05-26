-- Step 8: Call the stored procedure.
EXEC dbo.usp_load_hello_world;

SELECT * FROM dbo.tbl_hello_world;