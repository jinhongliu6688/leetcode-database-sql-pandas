# Write your MySQL query statement below

SELECT
    Queries.id,
    Queries.year,
    IFNULL(npv, 0) AS npv
FROM
    Queries
LEFT JOIN
    NPV
ON
    Queries.id = NPV.id AND
    Queries.year = NPV.year
