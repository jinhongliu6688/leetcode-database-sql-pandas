# Write your MySQL query statement below

SELECT
    temp.player_id,
    player_name,
    SUM(count_val) grand_slams_count
FROM (
    SELECT
        Wimbledon player_id,
        COUNT(*) count_val
    FROM
        Championships
    GROUP BY
        Wimbledon

    UNION ALL

    SELECT
        Fr_open player_id,
        COUNT(*) count_val
    FROM
        Championships
    GROUP BY
        Fr_open

    UNION ALL

    SELECT
        US_open player_id,
        COUNT(*) count_val
    FROM
        Championships
    GROUP BY
        US_open

    UNION ALL

    SELECT
        Au_open player_id,
        COUNT(*) count_val
    FROM
        Championships
    GROUP BY
        Au_open
) temp
LEFT JOIN
    Players
ON
    temp.player_id = Players.player_id
GROUP BY
    temp.player_id
