# Write your MySQL query statement below

select
    user_id seller_id,
    ifnull(2nd_item_fav_brand, "no") 2nd_item_fav_brand
from (
    select
        user_id,
        "yes" 2nd_item_fav_brand
    from (
        select
            *,
            rank() over(partition by seller_id order by order_date) rnk
        from
            Users u
        inner join
            Orders o
        on
            u.user_id = o.seller_id
        inner join
            Items i
        USING
            (item_id)
    ) temp_1
    where
        rnk = 2 and
        favorite_brand = item_brand
) temp_2
right join (
    select
        user_id
    from
        Users
) u_id
USING
    (user_id)
