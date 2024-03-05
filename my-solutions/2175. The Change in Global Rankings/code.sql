# Write your MySQL query statement below

SELECT
    team_id,
    name,
    CAST(rank() over(order by points DESC, name) AS SIGNED) - CAST(rank() over(order by points + points_change DESC, name) AS SIGNED) rank_diff
FROM
    TeamPoints t
INNER JOIN
    PointsChange p
USING
    (team_id)
