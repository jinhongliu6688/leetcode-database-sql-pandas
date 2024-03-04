# Write your MySQL query statement below

SELECT
    id,
    CASE
        WHEN p_id IS NULL THEN "Root"
        WHEN id IN (SELECT p_id FROM Tree) THEN "Inner"
        ELSE "Leaf"
    END AS type
FROM
    Tree

# Write your MySQL query statement below

SELECT
    id,
    if(p_id IS NULL, "Root", 
        if(id IN (SELECT p_id FROM tree), "Inner", "Leaf")
    ) AS type
FROM
    Tree
