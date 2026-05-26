-- Step 5: Turn the view into a table.
IF OBJECT_ID('dbo.tbl_hello_world', 'U') IS NOT NULL
    DROP TABLE dbo.tbl_hello_world;
GO

-- Add a fixed ID to establish a Primary Key
SELECT 1 AS Row_ID, Message, Current_Date
INTO dbo.tbl_hello_world
FROM dbo.v_hello_world;

-- Primary Key Constraint
ALTER TABLE dbo.tbl_hello_world
ADD CONSTRAINT PK_tbl_hello_world PRIMARY KEY (Row_ID);
GO