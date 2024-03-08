# Write your MySQL query statement below

SELECT
    N,
    CASE
        WHEN P IS NULL THEN "Root"
        WHEN N IN (SELECT P FROM Tree) THEN "Inner"
        ELSE "Leaf"
    END AS "Type"
FROM
    Tree
ORDER BY
    1;
