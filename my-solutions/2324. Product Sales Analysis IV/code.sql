# Write your MySQL query statement below

SELECT
    user_id,
    product_id
FROM (
    SELECT
        *,
        SUM(quantity * price) spent,
        rank() over(partition by user_id order by SUM(quantity * price) desc) rnk
    FROM
        Sales
    INNER JOIN
        Product
    USING
        (product_id)
    GROUP BY
        user_id,
        product_id
) temp
WHERE
    rnk = 1
