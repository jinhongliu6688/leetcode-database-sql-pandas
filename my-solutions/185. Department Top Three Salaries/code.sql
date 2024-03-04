# Write your MySQL query statement below

SELECT
    Department.name AS Department,
    table1.name AS Employee,
    salary AS Salary
FROM (
    SELECT
        e1.departmentId AS departmentId,
        e1.name,
        e1.salary
    FROM
        Employee e1,
        Employee e2
    WHERE
        e1.departmentId = e2.departmentId AND
        e1.salary <= e2.salary
    GROUP BY
        e1.id
    HAVING
        COUNT(DISTINCT e2.salary) <= 3
) AS table1
INNER JOIN
    Department
ON
    table1.departmentId = Department.id
