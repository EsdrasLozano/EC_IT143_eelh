/*****************************************************************************************************************
NAME:    dbo.udf_parse_last_name
PURPOSE: Extract the last name from a full contact name string.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/08/2026   ELOZANO       1. Built this UDF for EC IT143

RUNTIME: 
1s

NOTES: 
This scalar function finds the first space and extracts everything after it to isolate the last name.
******************************************************************************************************************/
CREATE FUNCTION dbo.udf_parse_last_name 
(
    @FullName VARCHAR(100)
)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @LastName VARCHAR(50);
    
    SET @LastName = CASE 
                        WHEN CHARINDEX(' ', LTRIM(RTRIM(@FullName))) > 0 
                        THEN SUBSTRING(LTRIM(RTRIM(@FullName)), CHARINDEX(' ', LTRIM(RTRIM(@FullName))) + 1, LEN(@FullName))
                        ELSE '' 
                    END;
                    
    RETURN @LastName;
END;
GO