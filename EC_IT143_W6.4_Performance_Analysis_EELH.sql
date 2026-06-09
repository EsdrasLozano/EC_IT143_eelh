-- =======================================================================
-- Author: Esdras Enos Lozano Hurtado
-- Assignment: 6.4 Performance Analysis
-- Description: Queries and Index creation steps for missing indexes
-- =======================================================================

USE [AdventureWorks2022];
GO

-- ==========================================
-- SCENARIO 1: Person.Address Table
-- ==========================================

-- 1. Query to trigger missing index recommendation
SELECT pa.*
FROM Person.Address AS pa
WHERE pa.city = 'Bothell';
GO

-- 2. Creating the recommended index to improve performance
CREATE NONCLUSTERED INDEX IX_Person_Address_City 
ON [Person].[Address] ([City]);
GO

-- ==========================================
-- SCENARIO 2: Sales.SalesOrderDetail Table
-- ==========================================

-- 1. Query to trigger missing index recommendation
SELECT *
FROM Sales.SalesOrderDetail
WHERE CarrierTrackingNumber = '4911-403C-98';
GO

-- 2. Creating the recommended index to improve performance
CREATE NONCLUSTERED INDEX IX_SalesOrderDetail_CarrierTracking
ON [Sales].[SalesOrderDetail] ([CarrierTrackingNumber]);
GO