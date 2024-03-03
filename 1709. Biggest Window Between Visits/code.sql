# Write your MySQL query statement below

SELECT
    user_id,
    MAX(date_diff) biggest_window
FROM (
    SELECT
        user_id,
        visit_date,
        IFNULL(-DATEDIFF(visit_date, LEAD(visit_date) over(partition by user_id ORDER BY visit_date)), DATEDIFF("2021-1-1", visit_date)) date_diff
    FROM (
        SELECT
            DISTINCT user_id,
            visit_date
        FROM
            UserVisits
    ) temp_1
) temp_2
GROUP BY
    user_id
ORDER BY
    1
