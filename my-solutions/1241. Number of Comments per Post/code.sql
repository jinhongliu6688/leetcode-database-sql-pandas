# Write your MySQL query statement below

WITH table_1 AS 
(
    SELECT
        DISTINCT sub_id
    FROM
        Submissions
    WHERE
        parent_id IS NULL
)

SELECT
    t.sub_id AS post_id,
    COUNT(DISTINCT s.sub_id) AS number_of_comments
FROM
    table_1 t
LEFT JOIN
    Submissions s
ON
    t.sub_id = s.parent_id
GROUP BY
    t.sub_id
