# Write your MySQL query statement below

SELECT
    MIN(ABS(p1.x - p2.x)) AS shortest
FROM
    Point p1,
    Point p2
WHERE
    p1.x <> p2.x

# Write your MySQL query statement below

SELECT  
    x - lag(x) OVER(ORDER BY x) AS shortest
FROM 
    point
ORDER BY 
    shortest 
LIMIT 
    1
OFFSET 
    1

# Write your MySQL query statement below

SELECT 
    MIN(distance) AS shortest
FROM (
    SELECT 
        @distance := if(@previous IS NULL, NULL, x - @previous) AS distance, @previous := x
    FROM
        Point, (SELECT @distance := NULL, @previous := NULL) AS temp_1
    ORDER BY
        x ASC
) temp_2
