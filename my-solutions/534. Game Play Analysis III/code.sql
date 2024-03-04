# Write your MySQL query statement below

SELECT
    player_id,
    event_date,
    SUM(games_played) over(partition by player_id ORDER BY event_date asc) games_played_so_far
FROM
    Activity
