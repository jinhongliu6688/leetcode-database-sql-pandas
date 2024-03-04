# Write your MySQL query statement below

SELECT
    *
FROM(
    SELECT
        e.employee_id
    FROM
        Employees e
    LEFT JOIN
        Salaries s
    ON
        e.employee_id = s.employee_id
    WHERE
        salary IS NULL

    UNION

    SELECT
        s.employee_id
    FROM
        Employees e
    RIGHT JOIN
        Salaries s
    ON
        e.employee_id = s.employee_id
    WHERE
        name IS NULL
) AS temp
ORDER BY
    employee_id

# Write your MySQL query statement below

SELECT
    employee_id
FROM (
    SELECT
        employee_id
    FROM
        Employees
    UNION ALL
    SELECT
        employee_id
    FROM
        Salaries
) temp
GROUP BY
    employee_id
HAVING
    COUNT(employee_id) = 1
ORDER BY
    employee_id
