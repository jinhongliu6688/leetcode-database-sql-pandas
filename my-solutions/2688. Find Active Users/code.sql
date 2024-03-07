# Write your MySQL query statement below

# Be careful, same user_id could buy the same item with the same purchase amount on the same day.

SELECT
    distinct u1.user_id
FROM
    Users u1,
    Users u2
WHERE
    datediff(u2.created_at, u1.created_at) BETWEEN 0 AND 7 AND
    u1.user_id = u2.user_id
GROUP BY
    u1.user_id,
    u1.created_at
HAVING
    COUNT(*) >= 2;
