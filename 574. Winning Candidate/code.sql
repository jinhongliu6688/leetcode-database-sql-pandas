# Write your MySQL query statement below

SELECT
    c.name
FROM
    Candidate c
INNER JOIN
    Vote v ON c.id = v.candidateId
GROUP BY
    v.candidateId
ORDER BY
    COUNT(*) DESC
LIMIT
    1
