# Write your MySQL query statement below

WITH table_1 AS 
(
    SELECT "[0-5>" AS bin
    UNION
    SELECT "[5-10>" AS bin
    UNION
    SELECT "[10-15>" AS bin
    UNION
    SELECT "15 or more" AS bin
), 
table_2 AS 
(
    SELECT
        *,
        CASE
            WHEN duration < 5 * 60 THEN "[0-5>"
            WHEN duration < 10 * 60 THEN "[5-10>"
            WHEN duration < 15 * 60 THEN "[10-15>"
            ELSE "15 or more"
        END AS bin
    FROM
        Sessions
)

SELECT
    table_1.bin,
    COUNT(session_id) AS total
FROM 
    table_1
LEFT JOIN
    table_2
ON
    table_1.bin = table_2.bin
GROUP BY
    table_1.bin
