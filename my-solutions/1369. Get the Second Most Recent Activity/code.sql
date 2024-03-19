# Write your MySQL query statement below

select
    username,
    activity,
    startDate,
    endDate
from (
    select
        *,
        count(*) over(partition by username) num_act,
        rank() over(partition by username order by endDate desc) date_rnk
    from
        UserActivity
) temp_2
where
    num_act = 1 or
    date_rnk = 2;

# Write your MySQL query statement below

select
    username,
    activity,
    startDate,
    endDate
from (
    select
        *,
        if(count(*) over(partition by username) = 1, 1, if(rank() over(partition by username order by endDate desc) = 2, 1, 0)) as tag
    from
        UserActivity
    ) temp
where
    tag = 1;
