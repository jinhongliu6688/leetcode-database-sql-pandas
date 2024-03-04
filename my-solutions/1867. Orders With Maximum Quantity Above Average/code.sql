# Write your MySQL query statement below

SELECT
    order_id
FROM
    OrdersDetails
GROUP BY
    order_id
HAVING
    MAX(quantity) > ALL (
        SELECT
            AVG(quantity)
        FROM
            OrdersDetails
        GROUP BY
            order_id
    )

# Write your MySQL query statement below

SELECT
    order_id
FROM (
    SELECT
        order_id,
        MAX(quantity) > MAX(AVG(quantity)) OVER() AS flag
    FROM OrdersDetails
    GROUP BY order_id
) temp
WHERE 
    flag = 1
