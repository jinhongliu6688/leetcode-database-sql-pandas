# Write your MySQL query statement below

SELECT
    IFNULL(SUM(b.apple_count), 0) + IFNULL(SUM(c.apple_count), 0) apple_count,
    IFNULL(SUM(b.orange_count), 0) + IFNULL(SUM(c.orange_count), 0) orange_count
FROM
    Boxes b
LEFT JOIN
    Chests c
ON
    b.chest_id = c.chest_id
