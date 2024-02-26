# Write your MySQL query statement below

SELECT
    IFNULL(ROUND(SUM(count) / COUNT(*), 2), 0) AS average_sessions_per_user
FROM
(
    SELECT
        user_id,
        COUNT(DISTINCT session_id) AS count
    FROM
        Activity
    WHERE
        DATEDIFF("2019-07-27", activity_date) <= 29
    GROUP BY
        user_id
) AS table_1
