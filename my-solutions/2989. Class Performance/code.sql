# Write your MySQL query statement below

WITH cte As (
    SELECT
        DISTINCT assignment1 + assignment2 + assignment3 total,
        rank() over(order by assignment1 + assignment2 + assignment3) rnk_a,
        rank() over(order by assignment1 + assignment2 + assignment3 desc) rnk_d
    FROM
        Scores
)

SELECT
    total - (
        SELECT
            total
        FROM
            cte
        WHERE
            rnk_a = 1
    ) AS difference_in_score
FROM
    cte
WHERE
    rnk_d = 1;

# Write your MySQL query statement below

SELECT
    MAX(assignment1 + assignment2 + assignment3) - MIN(assignment1 + assignment2 + assignment3) difference_in_score
FROM
    Scores
