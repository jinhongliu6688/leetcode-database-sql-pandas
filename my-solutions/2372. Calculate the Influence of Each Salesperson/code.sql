# Write your MySQL query statement below

SELECT
    salesperson_id,
    name,
    IFNULL(SUM(price), 0) total
FROM
    Salesperson s
LEFT JOIN
    Customer c
USING
    (salesperson_id)
LEFT JOIN
    Sales
USING
    (customer_id)
GROUP BY
    salesperson_id
