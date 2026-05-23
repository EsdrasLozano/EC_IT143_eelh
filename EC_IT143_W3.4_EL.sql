/*****************************************************************************************************************
NAME:    EC_IT143_W3.4_EL.sql
PURPOSE: Create Answers for AdventureWorks Questions

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/22/2026   ELozano       1. Built this script for EC IT143
******************************************************************************************************************/

USE AdventureWorks2022;
GO

-- Q1 Business User question—Marginal complexity
-- Author: Esdras Lozano (Me)
-- Question: What are the different colors available for our bicycles in the current inventory?
SELECT DISTINCT 
    Color 
FROM 
    Production.Product 
WHERE 
    Color IS NOT NULL;
GO

-- Q2 Business User question—Marginal complexity
-- Author: Josué Ernesto Mercado Rivero (Another Student)
-- Question: Which products require the most days to manufacture?
SELECT TOP 10 
    Name AS ProductName, 
    DaysToManufacture
FROM 
    Production.Product
ORDER BY 
    DaysToManufacture DESC;
GO

-- Q3 Business User question—Moderate complexity
-- Author: David Akpan (Another Student)
-- Question: We need to review our vendor partnerships. Can you provide a list of all vendor names along with their current credit ratings?
SELECT 
    Name AS VendorName, 
    CreditRating
FROM 
    Purchasing.Vendor
ORDER BY 
    CreditRating ASC; -- 1 = Superior, 5 = Inferior
GO

-- Q4 Business User question—Moderate complexity
-- Author: David Akpan (Another Student)
-- Question: Management is tracking individual sales performance. Which specific sales representatives have achieved a year-to-date sales total exceeding two million dollars?
SELECT 
    p.FirstName, 
    p.LastName, 
    sp.SalesYTD
FROM 
    Sales.SalesPerson AS sp
JOIN 
    Person.Person AS p ON sp.BusinessEntityID = p.BusinessEntityID
WHERE 
    sp.SalesYTD > 2000000.00
ORDER BY 
    sp.SalesYTD DESC;
GO

-- Q5 Business User question—Increased complexity
-- Author: Joaquin Francisco Andres Soto Burgos (Another Student)
-- Question: The marketing department is reviewing seasonal sales performance for road bikes. They need a report showing monthly order quantities, total revenue, average list price, and estimated profit for road bike products sold during the first half of 2012.
SELECT 
    MONTH(soh.OrderDate) AS OrderMonth,
    SUM(sod.OrderQty) AS MonthlyOrderQuantity,
    SUM(sod.LineTotal) AS TotalRevenue,
    AVG(p.ListPrice) AS AverageListPrice,
    SUM(sod.LineTotal - (p.StandardCost * sod.OrderQty)) AS EstimatedProfit
FROM 
    Sales.SalesOrderHeader AS soh
JOIN 
    Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN 
    Production.Product AS p ON sod.ProductID = p.ProductID
JOIN 
    Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE 
    ps.Name = 'Road Bikes' 
    AND soh.OrderDate >= '2012-01-01' 
    AND soh.OrderDate <= '2012-06-30'
GROUP BY 
    MONTH(soh.OrderDate)
ORDER BY 
    OrderMonth ASC;
GO

-- Q6 Business User question—Increased complexity
-- Author: Joaquin Francisco Andres Soto Burgos (Another Student)
-- Question: Management wants to evaluate employee sales performance by territory. Create a report showing each salesperson's total sales amount, number of orders processed, sales territory region, and average revenue per order for the year 2013.
SELECT 
    p.FirstName + ' ' + p.LastName AS SalesPersonName,
    st.Name AS TerritoryRegion,
    SUM(soh.TotalDue) AS TotalSalesAmount,
    COUNT(soh.SalesOrderID) AS NumberOfOrdersProcessed,
    SUM(soh.TotalDue) / COUNT(soh.SalesOrderID) AS AverageRevenuePerOrder
FROM 
    Sales.SalesOrderHeader AS soh
JOIN 
    Sales.SalesPerson AS sp ON soh.SalesPersonID = sp.BusinessEntityID
JOIN 
    Person.Person AS p ON sp.BusinessEntityID = p.BusinessEntityID
JOIN 
    Sales.SalesTerritory AS st ON soh.TerritoryID = st.TerritoryID
WHERE 
    YEAR(soh.OrderDate) = 2013
GROUP BY 
    p.FirstName, 
    p.LastName, 
    st.Name
ORDER BY 
    TotalSalesAmount DESC;
GO

-- Q7 Metadata question
-- Author: Esdras Lozano (Me)
-- Question: Using the system information schema views, can you generate a list of all tables that contain a column named "BusinessEntityID"?
SELECT 
    TABLE_SCHEMA, 
    TABLE_NAME 
FROM 
    INFORMATION_SCHEMA.COLUMNS 
WHERE 
    COLUMN_NAME = 'BusinessEntityID';
GO

-- Q8 Metadata question
-- Author: Josué Ernesto Mercado Rivero (Another Student)
-- Question: Which AdventureWorks tables contain columns related to dates such as StartDate, EndDate, or ModifiedDate?
SELECT DISTINCT 
    TABLE_SCHEMA, 
    TABLE_NAME 
FROM 
    INFORMATION_SCHEMA.COLUMNS 
WHERE 
    COLUMN_NAME IN ('StartDate', 'EndDate', 'ModifiedDate');
GO