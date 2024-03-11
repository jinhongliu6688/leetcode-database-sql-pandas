# Write your MySQL query statement below

with count_table as (
    select
        *,
        count(*) count_val
    from
        Spending
    group by
        user_id,
        spend_date
),
d_only as (
    select
        user_id,
        spend_date
    from
        count_table
    where
        count_val = 1 and
        platform = "desktop"
),
m_only as (
    select
        user_id,
        spend_date
    from
        count_table
    where
        count_val = 1 and
        platform = "mobile"
),
m_d as (
    select
        user_id, 
        spend_date
    from
        count_table
    where
        count_val = 2
),
disinct_dates as (
    select
        distinct spend_date
    from
        Spending
)

select
    spend_date,
    ifnull(platform, "mobile") platform,
    ifnull(total_amount, 0) total_amount,
    ifnull(total_users, 0) total_users
from (
    select
        spend_date,
        "mobile" platform,
        sum(amount) total_amount,
        count(distinct user_id) total_users
    from
        Spending
    where
        (user_id, spend_date) in (select * from m_only)
    group by
        spend_date,
        platform
) temp_1
right join
    disinct_dates
USING
    (spend_date)

union

select
    spend_date,
    ifnull(platform, "desktop") platform,
    ifnull(total_amount, 0) total_amount,
    ifnull(total_users, 0) total_users
from (
    select
        spend_date,
        "desktop" platform,
        sum(amount) total_amount,
        count(distinct user_id) total_users
    from
        Spending
    where
        (user_id, spend_date) in (select * from d_only)
    group by
        spend_date,
        platform
) temp_2
right join
    disinct_dates
USING
    (spend_date)

union

select
    spend_date,
    ifnull(platform, "both") platform,
    ifnull(total_amount, 0) total_amount,
    ifnull(total_users, 0) total_users
from (
    select
        spend_date,
        "both" platform,
        sum(amount) total_amount,
        count(distinct user_id) total_users
    from
        Spending s
    where
        (user_id, spend_date) in (select * from m_d)
    group by
        spend_date
) temp
right join
    disinct_dates
USING
    (spend_date)
