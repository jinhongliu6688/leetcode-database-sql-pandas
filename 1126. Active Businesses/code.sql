# Write your MySQL query statement below

SELECT
    business_id
FROM
    Events e
INNER JOIN (
    SELECT
        event_type,
        AVG(occurrences) average
    FROM
        Events
    GROUP BY
        event_type
) average
ON
    e.event_type = average.event_type
GROUP BY
    business_id
HAVING
    SUM(IF(e.occurrences > average.average, 1, 0)) > 1
