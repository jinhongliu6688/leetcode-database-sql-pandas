# Write your MySQL query statement below

SELECT
    E1.employee_id,
    E1.name,
    COUNT(*) reports_count,
    ROUND(AVG(E2.age)) average_age
FROM
    Employees E1
INNER JOIN
    Employees E2
ON
    E1.employee_id = E2.reports_to
GROUP BY
    employee_id
ORDER BY
    1
