# Write your MySQL query statement below

SELECT
    from_id person1,
    to_id person2,
    COUNT(duration) call_count,
    SUM(duration) total_duration
FROM (
    SELECT
        IF(from_id < to_id, from_id, to_id) from_id,
        IF(from_id > to_id, from_id, to_id) to_id,
        duration
    FROM
        Calls 
) temp
GROUP BY
    from_id,
    to_id
