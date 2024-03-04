SELECT
    date login_date,
    COUNT(DISTINCT user_id) user_count
FROM (
    SELECT
        user_id,
        MIN(activity_date) date
    FROM
        Traffic
    WHERE
        activity = "login"
    GROUP BY
        user_id
    HAVING
        DATEDIFF("2019-06-30", MIN(activity_date)) <= 90
) temp
GROUP BY
    1
