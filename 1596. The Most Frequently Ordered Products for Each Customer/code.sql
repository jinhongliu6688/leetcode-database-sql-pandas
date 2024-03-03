# Write your MySQL query statement below

SELECT
    customer_id,
    o.product_id,
    product_name
FROM
    Orders o
INNER JOIN
    Products p
ON
    o.product_id = p.product_id
GROUP BY
    customer_id,
    product_id
HAVING
    (customer_id, COUNT(*)) IN (
        SELECT
            customer_id,
            MAX(count_val) max_count
        FROM (
            SELECT
                customer_id,
                o.product_id,
                COUNT(*) count_val
            FROM
                Orders o
            INNER JOIN
                Products p
            ON
                o.product_id = p.product_id
            GROUP BY
                customer_id,
                product_id
        ) temp
        GROUP BY
            customer_id
    )
