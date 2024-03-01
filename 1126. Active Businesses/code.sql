# Write your MySQL query statement below

WITH business AS (
    SELECT
        business_id,
        event_type,
        AVG(occurrences) average
    FROM
        Events
    GROUP BY
        business_id,
        event_type
    ORDER BY
        business_id
),
type_avg AS (
    SELECT
        event_type,
        AVG(occurrences) average
    FROM
        Events
    GROUP BY
        event_type
)
SELECT
    business_id
FROM
    business b
INNER JOIN
    type_avg t
ON
    b.event_type = t.event_type
GROUP BY
    business_id
HAVING
    SUM(IF(b.average > t.average, 1, 0)) > 1
