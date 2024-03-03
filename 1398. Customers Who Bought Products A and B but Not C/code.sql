# Write your MySQL query statement below

SELECT
    c.customer_id,
    customer_name
FROM
    Customers c
INNER JOIN
    Orders o
ON
    c.customer_id = o.customer_id
GROUP BY
    c.customer_id
HAVING
    GROUP_CONCAT(product_name) LIKE "%A%" AND
    GROUP_CONCAT(product_name) LIKE "%B%" AND
    GROUP_CONCAT(product_name) NOT LIKE "%C%"
ORDER BY
    c.customer_id
