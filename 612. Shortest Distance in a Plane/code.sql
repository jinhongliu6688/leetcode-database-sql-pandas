# Write your MySQL query statement below

SELECT
    ROUND(MIN(distance), 2) shortest
FROM (
    SELECT
        SQRT(POWER((p1.x - p2.x), 2) + POWER((p1.y - p2.y), 2)) distance
    FROM
        Point2D p1,
        Point2D p2
    WHERE
        NOT (p1.x = p2.x AND p1.y = p2.y)
) temp
