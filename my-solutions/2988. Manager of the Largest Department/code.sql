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
