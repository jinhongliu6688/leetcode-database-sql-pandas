# Write your MySQL query statement below

WITH n_Friendship AS (
    SELECT 
        * 
    FROM 
        Friendship
    
    UNION
    
    SELECT
        user2_id AS user1_id,
        user1_id AS user2_id
    FROM
        Friendship
)

SELECT
    user1_id,
    user2_id,
    COUNT(*) common_friend
FROM (
    SELECT
        f1.user1_id,
        f1.user2_id,
        f2.user2_id common_friend
    FROM
        n_Friendship f1,
        n_Friendship f2,
        n_Friendship f3
    WHERE
        (f1.user1_id = f2.user1_id AND
        f1.user2_id = f3.user1_id AND
        f2.user2_id = f3.user2_id)
) temp
WHERE
    user1_id < user2_id
GROUP BY
    user1_id,
    user2_id
HAVING
    COUNT(*) >= 3
