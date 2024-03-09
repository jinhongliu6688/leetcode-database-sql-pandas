# Write your MySQL query statement below

SELECT
    id,
    company,
    salary
FROM (
    SELECT
        *,
        rank() over(partition by company order by salary, id) rnk,
        COUNT(*) over(partition by company) count_val
    FROM
        Employee
) temp
WHERE
    (count_val % 2 = 0 AND
    rnk = count_val / 2 OR
    rnk = count_val / 2 + 1) 
    OR
    (count_val % 2 = 1 AND
    rnk = ceiling(count_val / 2));
