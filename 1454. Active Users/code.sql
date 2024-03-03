# Write your MySQL query statement below

WITH d_Logins AS (
    SELECT
        DISTINCT *
    FROM
        Logins
)
SELECT
    DISTINCT id,
    name
FROM (
    SELECT
        l.id,
        name,
        DATEDIFF(login_date, '1970-01-01') - dense_rank() over(partition by a.id order by login_date) tag
    FROM
        Accounts a
    INNER JOIN
        d_Logins l
    ON
        a.id = l.id
    ORDER BY
        name,
        login_date
) temp
GROUP BY
    tag,
    id
HAVING
    COUNT(*) >= 5
ORDER BY
    id
