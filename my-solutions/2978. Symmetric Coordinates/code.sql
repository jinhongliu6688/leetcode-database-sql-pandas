# Write your MySQL query statement below

WITH n_Coordinates AS (
    SELECT
        *,
        row_number() over() AS id
    FROM
        Coordinates
)

SELECT
    distinct c1.X,
    c1.Y
FROM
    n_Coordinates c1,
    n_Coordinates c2
WHERE
    c1.X = c2.Y AND
    c1.Y = c2.X AND
    c1.X <= c1.Y AND
    c1.id <> c2.id
ORDER BY
    1,
    2;
