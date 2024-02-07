# Write your MySQL query statement below

SELECT
    ROUND(COUNT(DISTINCT A1.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM
    (SELECT
        player_id,
        MIN(event_date) AS first_login_date
    FROM
        Activity
    GROUP BY
        player_id) A1
INNER JOIN
    Activity A2
ON
    DATEDIFF(A1.first_login_date, A2.event_date) = -1 AND A1.player_id = A2.player_id;



# Write your MySQL query statement below

SELECT
    ROUND(AVG(A2.event_date IS NOT NULL), 2) AS fraction
FROM
    (SELECT
        player_id,
        MIN(event_date) AS first_login_date
    FROM
        Activity
    GROUP BY
        player_id) A1
LEFT JOIN
    Activity A2
ON
    DATEDIFF(A1.first_login_date, A2.event_date) = -1 AND A1.player_id = A2.player_id;
