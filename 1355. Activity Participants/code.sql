# Write your MySQL query statement below

WITH CTE AS (
    SELECT
        MAX(count) max,
        MIN(count) min
    FROM (
        SELECT
            activity,
            COUNT(id) count
        FROM
            Friends
        GROUP BY
            activity
    ) temp
)

SELECT
    activity
FROM
    Friends
GROUP BY
    activity
HAVING
    COUNT(id) <> (SELECT max FROM CTE) AND
    COUNT(id) <> (SELECT min FROM CTE)
