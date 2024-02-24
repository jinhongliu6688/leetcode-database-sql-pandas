# Write your MySQL query statement below

SELECT
    D.name Department,
    E.name Employee,
    E.salary Salary
FROM
    Employee E
INNER JOIn
    Department D ON E.departmentId = D.id
WHERE
    (D.name, E.salary) IN (
        SELECT
            D.name Department,
            MAX(E.salary) Salary
        FROM
            Employee E
        INNER JOIn
            Department D ON E.departmentId = D.id
        GROUP BY
            D.id
    )



