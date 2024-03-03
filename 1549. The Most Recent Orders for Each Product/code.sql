# Write your MySQL query statement below

SELECT
    p.product_name,
    p.product_id,
    o.order_id,
    o.order_date
FROM
    Customers c
INNER JOIN
    Orders o
ON
    c.customer_id = o.customer_id
RIGHT JOIN
    Products p
ON
    o.product_id = p.product_id
GROUP BY
    p.product_id,
    o.order_id
HAVING
    (p.product_id, order_date) IN (
        SELECT
            p.product_id,
            MAX(order_date)
        FROM
            Orders o
        INNER JOIN
            Products p
        ON
            o.product_id = p.product_id
        GROUP BY
            p.product_id
    )
ORDER BY
    1,
    2,
    3
