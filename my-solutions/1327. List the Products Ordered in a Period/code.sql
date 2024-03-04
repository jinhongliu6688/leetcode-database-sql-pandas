# Write your MySQL query statement below

SELECT
    product_name,
    SUM(unit) AS unit
FROM
    Products P
INNER JOIN
    Orders O
ON
    P.product_id = O.product_id
WHERE
    order_date LIKE "2020-02%"
GROUP BY
    P.product_id
HAVING
    SUM(unit) >= 100
