# Write your MySQL query statement below

SELECT
    *
FROM
    Orders
WHERE
    order_type = 0 OR
    (order_type = 1 AND 
    customer_id NOT IN (
        SELECT
            customer_id
        FROM
            Orders
        WHERE
            order_type = 0
    ))

# Write your MySQL query statement below

SELECT
    order_id,
    customer_id,
    order_type
FROM (
    SELECT
        *,
        avg(order_type) over(partition by customer_id) tag
    FROM
        Orders
) temp
WHERE
    order_type = 0 OR
    order_type - tag = 0
