# Write your MySQL query statement below

with
    table1 as (
        SELECT
            product_id,
            new_price price
        FROM
            Products
        WHERE
            (product_id, change_date) IN (
                SELECT
                    product_id,
                    MAX(change_date)
                FROM
                    Products
                WHERE
                    change_date <= "2019-08-16"
                GROUP BY
                    product_id
            )
    )

SELECT
    DISTINCT product_id,
    10 price
FROM
    Products
WHERE
    product_id NOT IN (SELECT product_id FROM table1)

UNION

SELECT
    *
FROM
    table1
