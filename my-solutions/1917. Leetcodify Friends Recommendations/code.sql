# Write your MySQL query statement below

with cte as (
    select
        l1.user_id user_id,
        l2.user_id recommended_id
    from
        Listens l1,
        Listens l2
    where
        l1.user_id < l2.user_id and
        l1.song_id = l2.song_id and
        l1.day = l2.day
    group by
        l1.user_id,
        l2.user_id,
        l1.day
    having
        count(distinct l1.song_id) >= 3
), 
temp as (
    select
        user_id,
        recommended_id
    from
        cte
    left join
        Friendship f
    on
        cte.user_id = f.user1_id and
        cte.recommended_id = f.user2_id
    where
        f.user1_id is null 
)

select
    *
from
    temp

union

select
    recommended_id as user_id,
    user_id as recommended_id
from
    temp

# Write your MySQL query statement below

with cte as (
    select
        l1.user_id user_id,
        l2.user_id recommended_id
    from
        Listens l1,
        Listens l2
    where
        l1.user_id < l2.user_id and
        l1.song_id = l2.song_id and
        l1.day = l2.day
    group by
        l1.user_id,
        l2.user_id,
        l1.day
    having
        count(distinct l1.song_id) >= 3
)

select
    *
from
    cte

union

select
    recommended_id as user_id,
    user_id as recommended_id
from
    cte

except

select
    user1_id user_id,
    user2_id recommended_id
from
    Friendship

except

select
    user2_id user_id,
    user1_id recommended_id
from
    Friendship

# Write your MySQL query statement below

with cte as (
    select
        l1.user_id user_id,
        l2.user_id recommended_id
    from
        Listens l1,
        Listens l2
    where
        l1.user_id < l2.user_id and
        l1.song_id = l2.song_id and
        l1.day = l2.day and
        not exists (
            select 
                * 
            from 
                Friendship f
            where
                l1.user_id = f.user1_id and
                l2.user_id = f.user2_id
            )
    group by
        l1.user_id,
        l2.user_id,
        l1.day
    having
        count(distinct l1.song_id) >= 3
)

select
    *
from
    cte

union

select
    recommended_id as user_id,
    user_id as recommended_id
from
    cte;
