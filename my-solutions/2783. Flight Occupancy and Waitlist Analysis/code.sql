# Write your MySQL query statement below

SELECT
    flight_id,
    LEAST(COUNT(passenger_id), MAX(capacity)) booked_cnt,
    IF(COUNT(passenger_id) - MAX(capacity) < 0, 0, COUNT(passenger_id) - MAX(capacity)) waitlist_cnt
FROM
    Passengers p
RIGHT JOIN
    Flights f
USING
    (flight_id)
GROUP BY
    flight_id
ORDER BY
    1;

# Write your MySQL query statement below

WITH cte AS (
    SELECT
        flight_id,
        COUNT(*) count_val
    FROM
        Passengers
    GROUP BY
        flight_id
)

SELECT
    flight_id,
    IFNULL(LEAST(capacity, count_val), 0) booked_cnt,
    IF(count_val > capacity, count_val - capacity, 0) waitlist_cnt
FROM
    Flights f
LEFT JOIN
    cte c
USING
    (flight_id)
ORDER BY
    1;
