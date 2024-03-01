# Write your MySQL query statement below

SELECT
    b.book_id,
    name
FROM
    Books b
LEFT JOIN
    Orders o
ON
    b.book_id = o.book_id
WHERE
    DATEDIFF("2019-06-23", available_from) > 30
GROUP BY
    b.book_id
HAVING
    SUM(IF( DATEDIFF("2019-06-23", dispatch_date) <= 365, quantity, 0)) < 10
