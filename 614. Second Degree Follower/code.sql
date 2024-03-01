# Write your MySQL query statement below

SELECT
    followee follower,
    COUNT(*) num
FROM
    Follow
WHERE
    followee IN (SELECT follower FROM Follow)
GROUP BY
    followee
ORDER BY
    1
