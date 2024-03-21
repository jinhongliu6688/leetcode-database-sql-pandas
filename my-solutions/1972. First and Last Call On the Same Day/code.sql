# Write your MySQL query statement below

with cte as (
    select
        *
    from
        Calls
    
    union

    select
        recipient_id as caller_id,
        caller_id as recipient_id,
        call_time
    from
        Calls
),
cte_1 as (
    select
        *,
        rank() over(partition by caller_id, date(call_time) order by call_time) day_begin,
        rank() over(partition by caller_id, date(call_time) order by call_time desc) day_end
    from
        cte
)

select
    caller_id user_id
from 
    cte_1
where
    day_begin = 1 or
    day_end = 1
group by
    caller_id,
    recipient_id
having
    count(call_time) = 2

union

select
    caller_id user_id
from 
    cte_1
where
    day_begin = 1 and
    day_end = 1

# Write your MySQL query statement below

with cte as (
    select
        *
    from
        Calls
    
    union

    select
        recipient_id as caller_id,
        caller_id as recipient_id,
        call_time
    from
        Calls
),
cte_1 as (
    select
        *,
        rank() over(partition by caller_id, date(call_time) order by call_time) day_begin,
        rank() over(partition by caller_id, date(call_time) order by call_time desc) day_end
    from
        cte
)

select
    distinct caller_id user_id
from 
    cte_1
where
    day_begin = 1 or
    day_end = 1
group by
    caller_id,
    date(call_time)
having
    count(distinct recipient_id) = 1
