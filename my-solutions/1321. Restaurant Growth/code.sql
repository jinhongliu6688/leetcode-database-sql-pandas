# Write your MySQL query statement below

WITH customer_1 AS (
    SELECT
        visited_on, 
        SUM(amount) AS amount
    FROM
        Customer
    GROUP BY
        visited_on
)

SELECT
    C1.visited_on,
    SUM(C2.amount) AS amount,
    ROUND(SUM(C2.amount) / 7, 2) AS average_amount
FROM
    customer_1 C1,
    customer_1 C2
WHERE
    DATEDIFF(C1.visited_on, C2.visited_on) <= 6 AND
    DATEDIFF(C1.visited_on, C2.visited_on) >= 0
GROUP BY
    C1.visited_on
HAVING
    COUNT(*) = 7
ORDER BY
    C1.visited_on
