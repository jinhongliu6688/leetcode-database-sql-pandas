# Write your MySQL query statement below

SELECT
    bus_id,
    COUNT(passenger_id) passengers_cnt
FROM
    Buses b
LEFT JOIN (
    SELECT
        passenger_id,
        MIN(b.arrival_time) arrival_time
    FROM
    Passengers p
    INNER JOIN
        Buses b
    ON
        p.arrival_time <= b.arrival_time
    GROUP BY
        passenger_id
) temp
USING
    (arrival_time)
GROUP BY
    bus_id
ORDER BY
    bus_id
