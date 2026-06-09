/*****************************************************************************************************************
NAME:    dbo.udf_parse_first_name
PURPOSE: Extract the first name from a full contact name string.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/08/2026   ELOZANO       1. Built this UDF for EC IT143

RUNTIME: 
1s

NOTES: 
This scalar function finds the first space in the string and extracts everything before it.
******************************************************************************************************************/
CREATE FUNCTION dbo.udf_parse_first_name 
(
    @FullName VARCHAR(100)
)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @FirstName VARCHAR(50);
    
    -- Using CHARINDEX to find the space. If no space is found, it returns the whole name.
    SET @FirstName = CASE 
                        WHEN CHARINDEX(' ', LTRIM(RTRIM(@FullName))) > 0 
                        THEN SUBSTRING(LTRIM(RTRIM(@FullName)), 1, CHARINDEX(' ', LTRIM(RTRIM(@FullName))) - 1)
                        ELSE @FullName 
                     END;
                     
    RETURN @FirstName;
END;
GO