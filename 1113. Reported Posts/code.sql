# Write your MySQL query statement below

SELECT
    extra AS report_reason,
    COUNT(DISTINCT post_id) AS report_count
FROM
    Actions
WHERE
    extra IS NOT NULL AND
    action_date = "2019-07-04" AND
    action = "report"
GROUP BY
    extra
