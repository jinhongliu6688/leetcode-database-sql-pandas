# Write your MySQL query statement below

SELECT
    MAX(num) num
FROM (
    SELECT
        num
    FROM
        MyNumbers
    GROUP BY
        num
    HAVING 
        COUNT(num) = 1
) table1

# Write your MySQL query statement below

SELECT (
    SELECT
        num
    FROM
        MyNumbers
    GROUP BY
        num
    HAVING 
        COUNT(num) = 1
    ORDER BY
        num DESC
    LIMIT
        1
) num

# Write your MySQL query statement below

SELECT
    IFNULL(
        (SELECT num
         FROM MyNumbers
         GROUP BY num
         HAVING COUNT(num) = 1
         ORDER BY num DESC
         LIMIT 1),
    NULL) AS num
