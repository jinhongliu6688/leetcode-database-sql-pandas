# Write your MySQL query statement below

SELECT
    candidate_id
FROM
    Candidates c
INNER JOIN
    Rounds r
USING
    (interview_id)
WHERE
    years_of_exp >= 2
GROUP BY
    candidate_id
HAVING
    SUM(score) > 15
