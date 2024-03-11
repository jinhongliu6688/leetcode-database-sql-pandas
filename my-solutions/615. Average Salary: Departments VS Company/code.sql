# Write your MySQL query statement below

with company_average as (
    select
        department_id,
        left(pay_date, 7) pay_month,
        AVG(amount) de_avg
    from
        Salary s
    inner join
        Employee e
    using
        (employee_id)
    group by
        department_id,
        left(pay_date, 7)
),
month_average as (
    select
        left(pay_date, 7) pay_month,
        AVG(amount) mon_avg
    from
        Salary
    group by
        left(pay_date, 7)
)

select
    pay_month,
    department_id,
    case
        when de_avg > mon_avg then "higher"
        when de_avg = mon_avg then "same"
        else "lower"
    end as comparison
from
    company_average c
inner join
    month_average m
using
    (pay_month)
