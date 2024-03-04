SELECT 
    ROUND(AVG(percentage) * 100, 2) average_daily_percent
FROM (
    SELECT
        action_date,
        COUNT(DISTINCT r.post_id) / COUNT(DISTINCT a.post_id) percentage
    FROM
        Actions a
    LEFT JOIN
        Removals r
    ON
        a.post_id = r.post_id
    WHERE
        action = "report" AND
        extra = "spam"
    GROUP BY
        action_date
) temp
