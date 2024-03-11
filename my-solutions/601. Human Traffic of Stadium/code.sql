# Write your MySQL query statement below

SELECT
    id,
    visit_date,
    people
FROM (
    SELECT
        *,
        COUNT(*) over(partition by tag) count_val
    FROM (
        SELECT
            *,
            id - row_number() over(order by visit_date) tag
        FROM
            Stadium
        WHERE
            people >= 100
    ) temp_1
) temp_2
WHERE
    count_val >= 3
ORDER BY
    visit_date
