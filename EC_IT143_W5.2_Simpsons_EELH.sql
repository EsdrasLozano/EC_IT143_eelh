/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_Simpsons_EELH.sql
PURPOSE: Provide systematic analysis and SQL answers to the 4 questions regarding the Simpsons community data.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/03/2026   EELH          1. Built this script for EC IT143 - Deliverable 5.2

RUNTIME: 
0m 12s

NOTES: 
This script builds the SQL answers for the Simpsons dataset. I utilized aggregate functions to analyze 
spending patterns. The questions consist of a mix of my own inquiries and one provided by a classmate.
******************************************************************************************************************/

-- Q1: How much money has each family member spent using the FBS Visa card? (Author: Me)
-- A1: I will join the family members table with the FBS Visa transactions and use SUM to calculate the total spent per member.

SELECT 
    f.MemberName,
    SUM(v.DebitAmount) AS TotalSpent,
    COUNT(v.TransactionID) AS NumberOfTransactions
FROM Family_Data f
JOIN FBS_Visa v ON f.MemberID = v.MemberID
GROUP BY f.MemberName
ORDER BY TotalSpent DESC;

-- Q2: Which family members have the highest combined spending across the available transaction tables? (Author: Me)
-- A2: For this, I am combining totals from both the Visa and the Planet Express tables to get a grand total.

SELECT 
    f.MemberName,
    SUM(ISNULL(v.DebitAmount, 0) + ISNULL(p.Amount, 0)) AS GrandTotal
FROM Family_Data f
LEFT JOIN FBS_Visa v ON f.MemberID = v.MemberID
LEFT JOIN Planet_Express p ON f.MemberID = p.MemberID
GROUP BY f.MemberName
ORDER BY GrandTotal DESC;

-- Q3: What are the most common transaction descriptions in the spending records? (Author: Me)
-- A3: I am grouping by the transaction description to see where the frequency (COUNT) is highest.

SELECT 
    v.Description,
    COUNT(*) AS TransactionCount,
    SUM(v.DebitAmount) AS TotalAmount
FROM FBS_Visa v
GROUP BY v.Description
ORDER BY TransactionCount DESC;

-- Q4: What is the average transaction amount per city, and which cities show the highest spending patterns? (Author: Classmate)
-- A4: I will join the transaction table with the city table, grouping by CityName and using the AVG function to answer my classmate's question.

SELECT 
    c.CityName,
    AVG(v.DebitAmount) AS AverageTransactionAmount,
    SUM(v.DebitAmount) AS TotalCitySpending
FROM FBS_Visa v
JOIN City_Data c ON v.CityID = c.CityID
GROUP BY c.CityName
ORDER BY TotalCitySpending DESC;