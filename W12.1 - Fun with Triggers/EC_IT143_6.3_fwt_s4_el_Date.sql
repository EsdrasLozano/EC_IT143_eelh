/*****************************************************************************************************************
NAME:    dbo.trg_w3_customers_last_mod_date
PURPOSE: Automatically update the last_modified_date when a record is changed.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/08/2026   ELOZANO       1. Built this Trigger for EC IT143

RUNTIME: 
1s

NOTES: 
This AFTER UPDATE trigger captures the exact server time of the modification. Includes nest level protection.
******************************************************************************************************************/
CREATE TRIGGER trg_w3_customers_last_mod_date 
ON dbo.t_w3_schools_customers
AFTER UPDATE 
AS
BEGIN
    -- Freno de seguridad para evitar bucle infinito
    IF TRIGGER_NESTLEVEL() > 1 RETURN;

    UPDATE dbo.t_w3_schools_customers
    SET last_modified_date = GETDATE()
    WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Inserted);
END;
GO