# Write your MySQL query statement below

WITH table_1 AS
    (
        SELECT
            seller_id, s.product_id, buyer_id, product_name
        FROM
            Sales s
        INNER JOIN
            Product p 
        ON 
            s.product_id = p.product_id
    )

SELECT
    DISTINCT buyer_id
FROM
    table_1
WHERE
    product_name = "S8" AND
    buyer_id NOT IN 
    (
        SELECT
            DISTINCT buyer_id
        FROM
            table_1
        WHERE
            product_name = "iPhone"
    )

# Write your MySQL query statement below

SELECT
    buyer_id
FROM
    Sales s
INNER JOIN
    Product p
ON
    s.product_id = p.product_id
GROUP BY
    buyer_id
HAVING
    SUM(IF(product_name = "S8", 1, 0)) > 0 AND
    SUM(IF(product_name = "iPhone", 1, 0)) = 0
