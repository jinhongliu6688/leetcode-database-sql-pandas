# Write your MySQL query statement below

select
    event_date install_dt,
    count(8) installs,
    round(avg(tag = is_install_date), 2) Day1_retention
from (
    select
        *,
        if((player_id, event_date) in (
            select
                player_id,
                install_date
            from (
                select
                    player_id,
                    min(event_date) install_date
                from
                    Activity
                group by
                    player_id
            ) temp_1
            where
                (player_id, DATE_ADD(install_date, INTERVAL 1 DAY)) in (select player_id, event_date from Activity)
        ), 1, 0) tag,
        if((player_id, event_date) in (
            select
                player_id,
                min(event_date)
            from
                Activity
            group by
                player_id
        ), 1, 0) is_install_date 
    from
        Activity
) temp_2
where
    tag = 1 or
    is_install_date = 1
group by
    event_date
