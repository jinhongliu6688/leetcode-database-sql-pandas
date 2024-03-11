# Write your MySQL query statement below

select
    group_id GROUP_ID,
    player_id PLAYER_ID
from (
    select
        player_id,
        group_id,
        rank() over(partition by group_id order by sum(score) desc, player_id) rnk
    from (
        select
            first_player player_id,
            first_score score
        from
            Matches

        union all

        select
            second_player player_id,
            second_score score
        from
            Matches
    ) temp_table_1
    inner join
        Players
    using
        (player_id)
    group by
        player_id
) temp_table_2
where
    rnk = 1;
