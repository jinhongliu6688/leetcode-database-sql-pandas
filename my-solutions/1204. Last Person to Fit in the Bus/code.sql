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

# Write your MySQL query statement below

SELECT
    person_name
FROM (
    SELECT
        *,
        SUM(weight) OVER(ORDER BY turn) AS sum_weight
    FROM
        Queue
) AS table1
WHERE
    sum_weight <= 1000
ORDER BY
    sum_weight DESC
LIMIT
    1
