# Write your MySQL query statement below

SELECT
    gender,
    day,
    SUM(score_points) over(partition by gender order by day) as total
FROM
   Scores
GROUP BY
    gender,
    day
ORDER BY
    gender,
    day
