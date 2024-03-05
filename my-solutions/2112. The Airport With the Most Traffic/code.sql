# Write your MySQL query statement below

SELECT
    airport_id
FROM(
    SELECT
        airport_id,
        rank() over(order by count_val desc) ranking
    FROM (
        SELECT
            airport_id,
            SUM(flights_count) count_val
        FROM (
            SELECT
                departure_airport airport_id,
                flights_count
            FROM
                Flights
            UNION ALL
            SELECT
                arrival_airport airport_id,
                flights_count
            FROM
                Flights
        ) temp_1
        GROUP BY
            airport_id
    ) temp_2
) temp_3
WHERE
    ranking = 1
