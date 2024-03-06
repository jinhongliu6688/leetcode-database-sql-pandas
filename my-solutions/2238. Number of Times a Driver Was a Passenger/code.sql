# Write your MySQL query statement below

WITH temp_1 AS (
    SELECT
        passenger_id driver_id,
        COUNT(*) cnt
    FROM
        Rides
    WHERE
        passenger_id IN (
            SELECT
                driver_id
            FROM
                Rides
        )
    GROUP BY
        passenger_id
),
temp_2 AS(
    SELECT
        distinct driver_id
    FROM
        Rides
)

SELECT
    temp_2.driver_id,
    IFNULL(cnt, 0) cnt
FROM
    temp_2
LEFT JOIN
    temp_1
ON
    temp_2.driver_id = temp_1.driver_id

# Write your MySQL query statement below

SELECT
    distinct r1.driver_id,
    COUNT(r2.ride_id) cnt
FROM
    Rides r1
LEFT JOIN
    Rides r2
ON
    r1.driver_id = r2.passenger_id
GROUP BY
    r1.ride_id,
    r1.driver_id
