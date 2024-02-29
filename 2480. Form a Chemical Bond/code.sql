# Write your MySQL query statement below

SELECT
    e1.symbol AS "metal",
    e2.symbol AS "nonmetal"
FROM
    Elements e1,
    Elements e2
WHERE
    e1.type <> "Noble" AND
    e2.type <> "Noble" AND
    e1.type = "Metal" AND
    e2.type = "Nonmetal"
