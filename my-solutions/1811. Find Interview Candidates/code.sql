# Write your MySQL query statement below

WITH temp AS (
    SELECT
        *,
        CONCAT(u.user_id, contest_id - row_number() over(partition by user_id order by contest_id)) tag
    FROM
        Users u
    LEFT JOIN
        Contests c
    ON
        u.user_id = c.gold_medal OR
        u.user_id = c.silver_medal OR
        u.user_id = c.bronze_medal
    ORDER BY
        user_id,
        contest_id
)

SELECT
    name,
    mail
FROM
    Users
WHERE
    user_id IN (
        SELECT
            distinct user_id
        FROM
            temp
        WHERE
            contest_id IS NOT NULL
        GROUP BY
            tag
        HAVING
            COUNT(*) >= 3
    ) OR user_id IN (
        SELECT
            distinct gold_medal
        FROM
            Contests
        GROUP BY
            gold_medal
        HAVING
            COUNT(*) >= 3
    )
