# Write your MySQL query statement below

select
    bus_id,
    cumu_capacity - lag(cumu_capacity, 1, 0) over(order by arrival_time) passengers_cnt
from (
    select
        bus_id,
        count_val,
        capacity,
        @cumu_capacity:= if(
            bus_id = (select bus_id from Buses order by arrival_time limit 1),
            least(count_val, capacity),
            least(count_val, @cumu_capacity + capacity)
        ) cumu_capacity,
        arrival_time
    from (
        select
            bus_id,
            count(*) count_val,
            max(capacity) capacity,
            max(b.arrival_time) arrival_time
        from
            Buses b,
            Passengers p
        where
            p.arrival_time <= b.arrival_time
        group by
            bus_id
        order by
            arrival_time
    ) temp,
    (SELECT @cumu_capacity:= 0) a
) temp_1

union

select
    bus_id,
    0 passengers_cnt
from
    Buses
where
    arrival_time < (select min(arrival_time) from Passengers)

order by
    1
