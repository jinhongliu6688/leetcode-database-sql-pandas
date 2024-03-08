# Write your MySQL query statement below

SELECT
    age_bucket,
    ROUND(SUM(IF(activity_type = "send", time_spent, 0)) * 100 / SUM(time_spent), 2) send_perc,
    ROUND(SUM(IF(activity_type = "open", time_spent, 0)) * 100 / SUM(time_spent), 2) open_perc
FROM
    Activities a1
INNER JOIN
    Age a2
ON
    a1.user_id = a2.user_id
GROUP BY
    age_bucket;
