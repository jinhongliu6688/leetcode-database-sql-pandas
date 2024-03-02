# Write your MySQL query statement below

WITH temp AS (
    SELECT
        *,
        CASE
            WHEN host_goals > guest_goals THEN 3
            WHEN host_goals = guest_goals THEN 1
            ELSE 0
        END AS host_scores,
        CASE
            WHEN guest_goals > host_goals THEN 3
            WHEN guest_goals = host_goals THEN 1
            ELSE 0
        END AS guest_scores
    FROM
        Matches
)
SELECT
    Teams.team_id,
    team_name,
    IFNULL(SUM(num_points), 0) AS num_points
FROM (
    SELECT
        host_team team_id,
        SUM(host_scores) num_points
    FROM
        temp
    GROUP BY
        host_team

    UNION ALL

    SELECT
        guest_team team_id,
        SUM(guest_scores) num_points
    FROM
        temp
    GROUP BY
        guest_team
) temp_1
RIGHT JOIN
    Teams
ON
    temp_1.team_id = Teams.team_id
GROUP BY
    Teams.team_id
ORDER BY
    num_points DESC,
    team_id
