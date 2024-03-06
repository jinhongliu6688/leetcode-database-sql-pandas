# Write your MySQL query statement below

SELECT
    distinct product_id
FROM (
    SELECT
        *,
        year(purchase_date),
        COUNT(*),
        year(purchase_date) - row_number() over(partition by product_id order by year(purchase_date)) tag
    FROM
        Orders
    GROUP BY
        product_id,
        year(purchase_date)
    HAVING
        COUNT(*) >= 3
) temp
GROUP BY
    product_id,
    tag
HAVING
    COUNT(*) >= 2
