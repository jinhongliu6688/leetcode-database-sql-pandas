# Write your MySQL query statement below

SELECT
    candidate
FROM (
    SELECT
        candidate,
        rank() over(order by sum(tag) desc) rnk
    FROM (
        SELECT
            voter,
            candidate,
            1/COUNT(candidate) over(partition by voter) tag
        FROM
            Votes
        WHERE
            candidate IS NOT NULL
    ) temp_1
    GROUP BY
        candidate
) temp_2
WHERE
    rnk = 1
ORDER BY
    1;
