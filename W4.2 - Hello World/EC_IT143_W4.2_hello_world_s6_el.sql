-- Step 6: Load the table from the view using an ad hoc SQL script.
TRUNCATE TABLE dbo.tbl_hello_world;

INSERT INTO dbo.tbl_hello_world (Row_ID, Message, Current_Date)
SELECT 1, Message, Current_Date
FROM dbo.v_hello_world;
GO