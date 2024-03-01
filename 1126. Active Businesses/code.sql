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
) table_1
ON
    e.event_type = table_1.event_type
GROUP BY
    business_id
HAVING
    SUM(IF(e.occurrences > table_1.average, 1, 0)) > 1
