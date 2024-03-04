# Write your MySQL query statement below

SELECT
    *,
    dense_rank() over(order by salary) team_id
FROM
    Employees
WHERE
    employee_id NOT IN (
        SELECT
            employee_id
        FROM
            Employees
        GROUP BY
            salary
        HAVING
            COUNT(*) = 1
    )
ORDER BY
    team_id,
    employee_id
