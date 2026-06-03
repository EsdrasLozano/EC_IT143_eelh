/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_MyFC_EELH.sql
PURPOSE: Provide systematic analysis and SQL answers to the 4 questions regarding the MyFC (Football Club) community data.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/03/2026   EELH          1. Built this script for EC IT143 - Deliverable 5.2

RUNTIME: 
0m 18s

NOTES: 
This script answers questions regarding football club salaries, rosters, and player positions.
******************************************************************************************************************/

-- Q1: What is the total player salary per month, grouped by contract date? (Author: Me)
-- A1: I am using a GROUP BY on the contract date's month and year to sum the monthly salaries effectively.

SELECT 
    YEAR(ContractDate) AS ContractYear,
    MONTH(ContractDate) AS ContractMonth,
    SUM(MonthlySalary) AS TotalMonthlySalary
FROM Player_Salaries
GROUP BY YEAR(ContractDate), MONTH(ContractDate)
ORDER BY ContractYear, ContractMonth;

-- Q2: How many players are assigned to each position, and how does this distribution compare across seasons? (Author: Me)
-- A2: Grouping by both season and position to get a headcount using the COUNT function.

SELECT 
    Season,
    Position,
    COUNT(PlayerID) AS NumberOfPlayers
FROM Roster
GROUP BY Season, Position
ORDER BY Season DESC, NumberOfPlayers DESC;

-- Q3: Who are the highest paid players by position? (Author: Me)
-- A3: Using a subquery in the WHERE clause to filter players whose salary matches the MAX salary for their specific position.

SELECT 
    Position,
    PlayerName,
    MonthlySalary
FROM Player_Salaries
WHERE MonthlySalary IN (
    SELECT MAX(MonthlySalary) 
    FROM Player_Salaries 
    GROUP BY Position
)
ORDER BY MonthlySalary DESC;

-- Q4: We need to understand how the salaries we pay our players compare to other teams. Who are the highest paid players on the team by position? (Author: Classmate)
-- A4: I will join the core player data with the salaries table and use a TOP clause to show the highest-paid individuals overall.

SELECT TOP 10
    p.PlayerName,
    p.Position,
    s.MonthlySalary
FROM Player_Data p
JOIN Player_Salaries s ON p.PlayerID = s.PlayerID
ORDER BY s.MonthlySalary DESC;