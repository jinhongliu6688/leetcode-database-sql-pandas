# Write your MySQL query statement below

SELECT
    id,
    month,
    Salary
FROM (
    SELECT
        id,
        month,
        CASE
            WHEN month - lag(month) over(partition by id order by month) = 1 
                AND month - lag(month, 2) over(partition by id order by month) = 2 
                THEN salary + lag(salary) over(partition by id order by month) + lag(salary, 2) over(partition by id order by month) 
            WHEN month - lag(month) over(partition by id order by month) = 1 THEN salary + lag(salary) over(partition by id order by month)
            WHEN month - lag(month, 2) over(partition by id order by month) = 2 THEN salary + lag(salary, 2) over(partition by id order by month)
            ELSE salary
        END AS Salary,
        MAX(month) over(partition by id) tag
    FROM
        Employee
    ORDER BY
        id,
        month
) temp
WHERE
    month <> tag
ORDER BY
    id, 
    month DESC

# Write your MySQL query statement below

SELECT
    id, 
    month,
    Salary
FROm (
    select
        id,
        month,
        sum(salary) over(partition by id order by month range between 2 preceding and current row) Salary,
        max(month) over(partition by id) tag
    from
        Employee
) temp
where
    month <> tag
order by
    id,
    month desc

# Write your MySQL query statement below

select
    e1.id,
    e1.month,
    SUM(e2.salary) Salary
from
    Employee e1,
    Employee e2
where
    e1.id = e2.id and
    e1.month - e2.month between 0 and 2 and
    (e1.id, e1.month) not in (select id, max(month) from Employee group by id)
group by
    e1.id,
    e1.month
order by
    id,
    month desc
