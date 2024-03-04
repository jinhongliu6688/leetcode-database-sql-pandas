# Write your MySQL query statement below

SELECT
    company_id,
    employee_id,
    employee_name,
    CASE
        WHEN max_salary < 1000 THEN ROUND(salary)
        WHEN max_salary BETWEEN 1000 AND 10000 THEN ROUND(salary * (1 - 0.24))
        ELSE ROUND(salary * (1 - 0.49))
    END AS salary
FROM
    Salaries
INNER JOIN (
        SELECT
        company_id,
        MAX(salary) max_salary
    FROM
        Salaries
    GROUP BY
        company_id
) highest
USING(company_id)

# Write your MySQL query statement below

SELECT
    company_id,
    employee_id,
    employee_name,
    CASE
        WHEN max_salary < 1000 THEN ROUND(salary)
        WHEN max_salary BETWEEN 1000 AND 10000 THEN ROUND(salary * (1 - 0.24))
        ELSE ROUND(salary * (1 - 0.49))
    END AS salary
FROM (
    SELECT
        *,
        MAX(salary) over(partition by company_id) max_salary
    FROM
    Salaries 
) temp
