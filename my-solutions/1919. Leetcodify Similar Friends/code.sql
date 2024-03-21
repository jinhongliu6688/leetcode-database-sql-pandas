# Write your MySQL query statement below

select
    distinct 
    l1.user_id as user1_id,
    l2.user_id as user2_id
from
    Listens l1,
    Listens l2
where
    l1.user_id < l2.user_id and
    exists (
        select
            *
        from
            Friendship
        where
            l1.user_id = user1_id and
            l2.user_id = user2_id
    ) and
    l1.song_id = l2.song_id and
    l1.day = l2.day
group by
    l1.user_id,
    l2.user_id,
    l1.day
having
    count(distinct l1.song_id) >= 3;
