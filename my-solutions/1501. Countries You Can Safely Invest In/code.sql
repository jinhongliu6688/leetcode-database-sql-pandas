# Write your MySQL query statement below

SELECT
    country
FROM (
    SELECT
        co.name country,
        country_code,
        SUM(duration) duration,
        COUNT(*) count
    FROM
        Person p
    INNER JOIN
        Calls ca
    ON
        p.id = ca.caller_id
    INNER JOIN
        Country co
    ON
        LEFT(p.phone_number, 3) = co.country_code
    GROUP BY
        country_code

    UNION ALL

    SELECT
        co.name country,
        country_code,
        SUM(duration),
        COUNT(*) count
    FROM
        Person p
    INNER JOIN
        Calls ca
    ON
        p.id = ca.callee_id
    INNER JOIN
        Country co
    ON
        LEFT(p.phone_number, 3) = co.country_code
    GROUP BY
        country_code
) temp
GROUP BY
    country,
    country_code
HAVING
    (SUM(duration) / SUM(count)) > (SELECT AVG(duration) FROM Calls)
