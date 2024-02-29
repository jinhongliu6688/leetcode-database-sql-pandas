# Write your MySQL query statement below

SELECT
    COUNT(*) AS rich_count
FROM (
    SELECT
        customer_id
    FROM
        Store
    GROUP BY
        customer_id
    HAVING
        MAX(amount) > 500
) AS temp
