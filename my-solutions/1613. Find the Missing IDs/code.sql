# Write your MySQL query statement below

WITH RECURSIVE temp(number) AS (
    SELECT
        1 AS number
    
    UNION ALL

    SELECT
        number + 1
    FROM
        temp
    WHERE
        number + 1 <= (SELECT MAX(customer_id) FROM Customers)
)

SELECT
    number AS ids
FROM
    temp

EXCEPT

SELECT
    customer_id
FROM
    Customers
