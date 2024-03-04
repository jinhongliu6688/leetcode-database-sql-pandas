# Write your MySQL query statement below

SELECT
    name customer_name,
    customer_id,
    order_id,
    order_date
FROM (
    SELECT
        name,
        c.customer_id,
        order_id,
        order_date,
        rank() over(partition by c.customer_id order by order_date DESC) ranking
    FROM
        Customers c
    INNER JOIN
        Orders o
    ON
        c.customer_id = o.customer_id
) temp
WHERE
    ranking <= 3
ORDER BY
    1,
    2,
    4 DESC
