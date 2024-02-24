# Write your MySQL query statement below

SELECT
    product_id,
    product_name
FROM
    Product
WHERE
    product_id NOT IN (
        SELECT
            P.product_id
        FROM
            Product P
        INNER JOIN
            Sales S ON P.product_id = S.product_id 
        WHERE
            sale_date NOT BETWEEN "2019-01-01" AND "2019-03-31"
    ) AND product_id IN (
        SELECT
            product_id
        FROM
            Sales
    )

# Write your MySQL query statement below

SELECT
    P.product_id,
    P.product_name
FROM
    Product P
INNER JOIN
    Sales S ON P.product_id = S.product_id 
GROUP BY
    P.product_id
HAVING
    SUM(IF(S.sale_date BETWEEN "2019-01-01" AND "2019-03-31", 0, 1)) = 0
