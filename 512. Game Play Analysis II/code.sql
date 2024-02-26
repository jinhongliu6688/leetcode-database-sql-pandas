# Write your MySQL query statement below

SELECT
    player_id,
    device_id
FROM
    Activity
WHERE
    (player_id, event_date) IN 
        (
            SELECT
                player_id,
                MIN(event_date)
            FROM
                Activity
            GROUP BY
                player_id
        )

# Write your MySQL query statement below

SELECT
    player_id,
    device_id
FROM
    (
        SELECT
            player_id,
            device_id,
            RANK() OVER (PARTITION BY player_id ORDER BY event_date ASC) AS ranking
        FROM
            Activity
    ) AS table_1
WHERE
    ranking = 1
