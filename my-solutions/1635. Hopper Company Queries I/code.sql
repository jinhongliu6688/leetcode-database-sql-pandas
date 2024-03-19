# Write your MySQL query statement below

with recursive cte AS (
    select
        1 as month
 
    UNION ALL
 
    select
        month + 1 as month
    from
        cte
    where
        month < 12
),
accept as (
    select
        month(requested_at) month,
        count(*) accepted_rides
    from
        Rides r
    inner join
        AcceptedRides a
    using
        (ride_id)
    where
        left(requested_at, 4) = 2020
    group by
        1
)

select
    month,
    ifnull(active_drivers, 0) active_drivers,
    ifnull(accepted_rides, 0) accepted_rides
from (
    select
        cte.month,
        count(*) active_drivers
    from cte, (
        select
            if(year(join_date) < 2020, 0, month(join_date)) as month 
        from
            Drivers
        where
            left(join_date, 4) <= 2020
    ) temp
    where
        cte.month >= temp.month
    group by
        1
    order by
        1
) temp_1
left join
    accept
using
    (month)
right join
    cte
using
    (month)

# Write your MySQL query statement below

with recursive cte AS (
    select
        1 as month
 
    UNION ALL
 
    select
        month + 1 as month
    from
        cte
    where
        month < 12
),
accept as (
    select
        month(requested_at) month,
        count(*) accepted_rides
    from
        Rides r
    inner join
        AcceptedRides a
    using
        (ride_id)
    where
        left(requested_at, 4) = 2020
    group by
        1
),
d_active as (
    select
        cte.month,
        count(*) active_drivers
    from cte, (
        select
            if(year(join_date) < 2020, 0, month(join_date)) as month 
        from
            Drivers
        where
            left(join_date, 4) <= 2020
    ) temp
    where
        cte.month >= temp.month
    group by
        1
    order by
        1
)

select
    month,
    ifnull(active_drivers, 0) active_drivers,
    ifnull(accepted_rides, 0) accepted_rides
from 
    d_active
left join
    accept
using
    (month)
right join
    cte
using
    (month)
