# Write your MySQL query statement below

select
    user_id,
    page_id,
    count(*) as friends_likes
from (
    select
        user1_id as user_id,
        page_id,
        1 as tag
    from (
        select user1_id, user2_id from Friendship
        union
        select user2_id user1_id, user1_id user2_id from Friendship
    ) temp
    inner join
        Likes l1
    on
        temp.user2_id = l1.user_id
    
    union all

    select *, 0 as tag from Likes
) temp
group by
    1,
    2
having
    min(tag) <> 0
