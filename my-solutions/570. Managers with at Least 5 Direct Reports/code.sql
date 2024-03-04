# Write your MySQL query statement below

WITH tempTable AS (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
)
SELECT name
FROM Employee
INNER JOIN tempTable
ON id = tempTable.managerID;
