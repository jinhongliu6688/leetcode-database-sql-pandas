# Write your MySQL query statement below

SELECT
    p1.id P1,
    p2.id P2,
    ABS(p1.x_value - p2.x_value) * ABS(p1.y_value - p2.y_value) AREA
FROM
    Points p1,
    Points p2
WHERE
    p1.id < p2.id AND
    p1.x_value <> p2.x_value AND
    p1.y_value <> p2.y_value
ORDER BY
    3 DESC,
    1,
    2
