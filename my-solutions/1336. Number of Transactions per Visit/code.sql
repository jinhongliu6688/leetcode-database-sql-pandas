# Write your MySQL query statement below

with recursive a1 as (
    select
        user_id,
        transaction_date,
        COUNT(*) transactions_count
    from
        Transactions
    group by
        user_id,
        transaction_date
),
cte as (
    select
        ifnull(max(transactions_count), 0) transactions_count
    from
        a1
    
    union all

    select
        transactions_count - 1 transactions_count
    from
        cte
    where
        transactions_count > 0
)

select
    transactions_count,
    ifnull(a3.visits_count, 0) visits_count
from (
    select
        transactions_count,
        count(*) visits_count
    from (
        select
            v.user_id,
            transaction_date,
            ifnull(transactions_count, 0) transactions_count,
            visit_date
        from
            a1 a
        right join
            Visits v
        on
            a.transaction_date = v.visit_date and
            a.user_id = v.user_id
    ) a2
    group by
        transactions_count
) a3
right join
    cte
using
    (transactions_count)
order by
    1;
