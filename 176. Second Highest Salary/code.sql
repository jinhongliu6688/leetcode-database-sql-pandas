# Write your MySQL query statement below

SELECT
    IF(COUNT(*) = 0, 
        NULL, 
        IF(1 = (
            SELECT
                COUNT(DISTINCT salary)
            FROM
                Employee
        ), NULL, salary)
    ) AS SecondHighestSalary
FROM (
    SELECT
        salary,
        (SUM(count) OVER(ORDER BY salary DESC)) AS salary_order
    FROM (
        SELECT
            DISTINCT salary,
            1 AS count
        FROM
            Employee
    ) AS temp_table_1
) AS temp_table_2
WHERE
    salary_order = 2
