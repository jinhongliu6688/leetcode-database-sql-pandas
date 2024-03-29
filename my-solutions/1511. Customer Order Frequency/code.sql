# Write your MySQL query statement below

WITH jun AS (
    SELECT
        c.customer_id,
        c.name
    FROM
    Customers c
    INNER JOIN
        Orders o ON c.customer_id = o.customer_id
    INNER JOIN
        Product p ON o.product_id = p.product_id
    WHERE
        order_date LIKE "2020-06%"
    GROUP BY
        c.customer_id
    HAVING
        SUM(price * quantity) >= 100
),
jul AS (
    SELECT
        c.customer_id,
        c.name
    FROM
    Customers c
    INNER JOIN
        Orders o ON c.customer_id = o.customer_id
    INNER JOIN
        Product p ON o.product_id = p.product_id
    WHERE
        order_date LIKE "2020-07%"
    GROUP BY
        c.customer_id
    HAVING
        SUM(price * quantity) >= 100
)
SELECT 
    customer_id,
    name
FROM
    Customers
WHERE
    (customer_id, name) IN (SELECT * FROM jun) AND
    (customer_id, name) IN (SELECT * FROM jul)

# Write your MySQL query statement below

SELECT
    c.customer_id,
    c.name
FROM
    Customers c
INNER JOIN
    Orders o ON c.customer_id = o.customer_id
INNER JOIN
    Product p ON o.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.name
HAVING
    SUM(IF(LEFT(order_date, 7) = "2020-06", quantity*price, 0)) >= 100 AND
    SUM(IF(LEFT(order_date, 7) = "2020-07", quantity*price, 0)) >= 100
