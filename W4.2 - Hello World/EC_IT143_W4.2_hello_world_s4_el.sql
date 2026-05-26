-- Step 4: Turn the ad hoc SQL query into a view.
IF OBJECT_ID('dbo.v_hello_world', 'V') IS NOT NULL
    DROP VIEW dbo.v_hello_world;
GO

CREATE VIEW dbo.v_hello_world AS
/**
Rev: 1.0
Dev: Esdras Lozano Hurtado
Desc: Generates a basic greeting and system date for architecture testing.
**/
SELECT 'Hello World' AS Message, GETDATE() AS Current_Date;
GO