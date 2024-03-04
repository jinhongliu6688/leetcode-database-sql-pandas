# Write your MySQL query statement below

SELECT
    team_name,
    SUM(matches_played) matches_played,
    SUM(points) points,
    SUM(goal_for) goal_for,
    SUM(goal_against) goal_against,
    SUM(goal_for) - SUM(goal_against) goal_diff
FROM (
    SELECT
        home_team_id team_id,
        COUNT(*) matches_played,
        SUM(IF(home_team_goals > away_team_goals, 3, IF(home_team_goals = away_team_goals, 1, 0))) points,
        SUM(home_team_goals) goal_for,
        SUM(away_team_goals) goal_against
    FROM
        Matches
    GROUP BY
        home_team_id

    UNION ALL

    SELECT
        away_team_id team_id,
        COUNT(*) matches_played,
        SUM(IF(home_team_goals < away_team_goals, 3, IF(home_team_goals = away_team_goals, 1, 0))) points,
        SUM(away_team_goals) goal_for,
        SUM(home_team_goals) goal_against
    FROM
        Matches
    GROUP BY
        away_team_id
) temp
INNER JOIN
    Teams
USING
    (team_id)
GROUP BY
    team_id
ORDER BY
    points DESC,
    goal_diff DESC,
    team_name
