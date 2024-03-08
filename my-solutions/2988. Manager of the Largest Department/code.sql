# Write your MySQL query statement below

WITH cte AS (
    SELECT
        dep_id
    FROM (
        SELECT
            *,
            rank() over(order by count_val desc) rnk
        FROM (
            SELECT
                dep_id,
                COUNT(*) count_val
            FROM
                Employees
            GROUP BY
                dep_id
        ) temp_1
    ) temp_2
    WHERE
        rnk = 1
)

SELECT
    emp_name manager_name,
    dep_id
FROM
    Employees e
INNER JOIN
    cte c
USING
    (dep_id)
WHERE
    position = "Manager"
ORDER BY
    dep_id;

# Write your MySQL query statement below

WITH cte AS (
    SELECT
        dep_id
    FROM (
        SELECT
            dep_id,
            rank() over(order by COUNT(*) desc) rnk
        FROM
            Employees
        GROUP BY
            dep_id
    ) temp_1
    WHERE
        rnk = 1
)

SELECT
    emp_name manager_name,
    dep_id
FROM
    Employees 
WHERE
    position = "Manager" AND dep_id IN (SELECT dep_id FROM cte)
ORDER BY
    dep_id;
