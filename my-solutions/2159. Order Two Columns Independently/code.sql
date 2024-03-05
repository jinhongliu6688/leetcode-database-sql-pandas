# Write your MySQL query statement below

WITH a AS (
    SELECT
        first_col,
        row_number() over(order by first_col) rn
    FROM
        Data
),
b AS (
    SELECT
        second_col,
        row_number() over(order by second_col DESC) rn
    FROM
        Data
)

SELECT
    first_col,
    second_col
FROM
    a
INNER JOIN
    b
USING
    (rn)
