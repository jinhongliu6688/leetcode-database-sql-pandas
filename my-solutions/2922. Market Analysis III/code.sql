# Write your MySQL query statement below

SELECT
    seller_id,
    num_items
FROM (
    SELECT
        seller_id,
        COUNT(distinct item_id) num_items,
        rank() over(order by COUNT(distinct item_id) desc) rnk
    FROM
        Users u
    INNER JOIN
        Orders o
    USING
        (seller_id)
    INNER JOIN
        Items i
    USING
        (item_id)
    WHERE
        favorite_brand <> item_brand
    GROUP BY
        seller_id
) temp
WHERE
    rnk = 1
ORDER BY
    1;
