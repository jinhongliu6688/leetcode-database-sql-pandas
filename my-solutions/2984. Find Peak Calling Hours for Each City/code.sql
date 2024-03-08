# Write your MySQL query statement below

SELECT
    city,
    peak_calling_hour,
    number_of_calls
FROM (
    SELECT
        *,
        rank() over(partition by city order by number_of_calls desc) rnk
    FROM (
        SELECT
            city,
            hour(call_time) peak_calling_hour,
            COUNT(*) number_of_calls
        FROM
            Calls
        GROUP BY
            city,
            hour(call_time)
    ) temp_1
) temp_2
WHERE
    rnk = 1
ORDER BY
    2 DESC,
    1 DESC;
