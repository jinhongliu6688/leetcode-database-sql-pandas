# Write your MySQL query statement below

SELECT
    user1_id,
    user2_id
FROM (
    SELECT
        r1.user_id user1_id,
        r2.user_id user2_id,
        rank() over(order by COUNT(*) desc) ranking
    FROM
        Relations r1
    INNER JOIN
        Relations r2
    USING
        (follower_id)
    WHERE
        r1.user_id < r2.user_id
    GROUP BY
        r1.user_id,
        r2.user_id
) temp
WHERE
    ranking = 1

# Write your MySQL query statement below

WITH cte AS (
    SELECT
        r1.user_id user1_id,
        r2.user_id user2_id,
        COUNT(*) count_val
    FROM
        Relations r1
    INNER JOIN
        Relations r2
    USING
        (follower_id)
    WHERE
        r1.user_id < r2.user_id
    GROUP BY
        r1.user_id,
        r2.user_id
)

SELECT
    user1_id,
    user2_id
FROM
    cte
WHERE
    count_val = (
        SELECT
            MAX(count_val)
        FROM
            cte
    )
