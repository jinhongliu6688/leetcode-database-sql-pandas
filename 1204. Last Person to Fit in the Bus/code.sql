# Write your MySQL query statement below

SELECT
    Q1.person_name
FROM
    Queue Q1,
    Queue Q2
WHERE
    Q1.turn >= Q2.turn
GROUP BY
    Q1.turn
HAVING
    SUM(Q2.weight) <= 1000
ORDER BY
    Q1.turn DESC
LIMIT
    1
