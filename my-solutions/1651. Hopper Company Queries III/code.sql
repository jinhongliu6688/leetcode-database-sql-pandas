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
        sum(ride_distance) total_ride_distance,
        sum(ride_duration) total_ride_duration
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
    *
from (
    select
        month,
        round((ifnull(total_ride_distance, 0) + lead(ifnull(total_ride_distance, 0), 1) over(order by month) + lead(ifnull(total_ride_distance, 0), 2) over(order by month)) / 3, 2) as average_ride_distance,
        round((ifnull(total_ride_duration, 0) + lead(ifnull(total_ride_duration, 0), 1) over(order by month) + lead(ifnull(total_ride_duration, 0), 2) over(order by month)) / 3, 2) as average_ride_duration
    from 
        cte
    left join
        accept
    using
        (month)
) temp
where
    month <= 10;
