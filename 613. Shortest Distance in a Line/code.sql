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
