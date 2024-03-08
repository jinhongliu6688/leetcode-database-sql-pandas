# Write your MySQL query statement below

SELECT
    *
FROM
    Friends

EXCEPT

SELECT
    DISTINCT f1.user_id1,
    f1.user_id2
FROM
    Friends f1,
    Friends f2,
    Friends f3
WHERE 
    (f1.user_id1 = f2.user_id1 AND
    f1.user_id2 = f3.user_id1 AND
    f2.user_id2 = f3.user_id2) OR

    (f1.user_id1 = f2.user_id1 AND
    f1.user_id2 = f3.user_id2 AND
    f2.user_id2 = f3.user_id1) OR

    (f1.user_id1 = f2.user_id2 AND
    f1.user_id2 = f3.user_id1 AND
    f2.user_id1 = f3.user_id2) OR

    (f1.user_id1 = f2.user_id2 AND
    f1.user_id2 = f3.user_id2 AND
    f2.user_id1 = f3.user_id1)
ORDER BY
    1,
    2;

# Write your MySQL query statement below

WITH temp_1 AS (
    SELECT
        user_id1,
        user_id2
    FROM
        Friends
    UNION ALL
    SELECT
        user_id2 user_id1,
        user_id1 user_id2
    FROM
        Friends
),
temp_2 AS (
    SELECT
        t1.user_id1 user_id1,
        t2.user_id1 user_id2
    FROM
        temp_1 t1,
        temp_1 t2
    WHERE
        t1.user_id1 <> t2.user_id1 AND
        t1.user_id2 = t2.user_id2
)
SELECT
    user_id1,
    user_id2
FROM
    Friends
WHERE
    (user_id1, user_id2) NOT IN (
        SELECT
            user_id1,
            user_id2
        FROM
            temp_2
    )
ORDER BY
    1,
    2;
