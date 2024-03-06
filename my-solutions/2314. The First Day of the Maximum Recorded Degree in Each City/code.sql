# Write your MySQL query statement below

SELECT
    city_id,
    day,
    degree
FROM (
    SELECT
        city_id,
        day,
        degree,
        rank() over(partition by city_id order by degree desc, day) rnk
    FROM
        Weather
) temp
WHERE
    rnk = 1
ORDER BY
    city_id
