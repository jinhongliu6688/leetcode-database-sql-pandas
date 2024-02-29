# Write your MySQL query statement below

SELECT
    candidate_id
FROM
    Candidates
GROUP BY
    candidate_id
HAVING
    GROUP_CONCAT(skill) LIKE "%Python%" AND
    GROUP_CONCAT(skill) LIKE "%Tableau%" AND
    GROUP_CONCAT(skill) LIKE "%PostgreSQL%"
ORDER BY
    candidate_id
