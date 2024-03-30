# Write your MySQL query statement below

with cte_senior as (
    select
        *
    from (
        select
            *,
            sum(salary) over(order by salary, employee_id) sum_val
        from
            Candidates
        where
            experience = 'Senior'
    ) temp
    where
        sum_val <= 70000
),
cte_junior as (
    select
        *
    from (
        select
            *,
            sum(salary) over(order by salary, employee_id) sum_val
        from
            Candidates
        where
            experience = 'Junior'
    ) temp_1
    where
        sum_val <= 70000 - ifnull((
            select
                max(sum_val)
            from
                cte_senior
        ), 0)
)

select
    employee_id
from
    cte_senior

union

select
    employee_id
from
    cte_junior
