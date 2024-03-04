# Write your MySQL query statement below

SELECT
    MIN(log_id) start_id,
    MAX(log_id) end_id
FROM (
    SELECT
        log_id,
        rank() over(order by log_id asc) ranking,
        log_id - rank() over(order by log_id asc) ref
    FROM
        Logs
) temp
GROUP BY
    ref
