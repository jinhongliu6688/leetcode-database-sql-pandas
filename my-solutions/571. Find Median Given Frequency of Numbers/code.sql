# Write your MySQL query statement below

With Recursive cte AS (
    SELECT
        num,
        frequency
    FROM
        Numbers
    
    UNION ALL

    SELECT
        num,
        frequency - 1
    FROM
        cte
    WHERE
        frequency > 1
)

SELECT
    ROUND(AVG(num), 1) median
FROM (
    SELECT
        *,
        IF(
            (count_val % 2 = 0 AND 
            (rnk = count_val / 2 OR rnk = count_val / 2 + 1))
            OR
            (count_val % 2 = 1 AND 
            (rnk = ceiling(count_val / 2)))
        , 1, 0) tag
    FROM (
        SELECT
            num,
            row_number() over(order by num) rnk,
            COUNT(*) over() count_val
        FROM
            cte
        ORDER BY
            num
    ) temp_1
) temp_2
WHERE
    tag = 1
