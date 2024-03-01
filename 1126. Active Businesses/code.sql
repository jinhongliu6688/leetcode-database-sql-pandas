# Write your MySQL query statement below

WITH type_avg AS (
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
    Events e
INNER JOIN
    type_avg t
ON
    e.event_type = t.event_type
GROUP BY
    business_id
HAVING
    SUM(IF(e.occurrences > t.average, 1, 0)) > 1
