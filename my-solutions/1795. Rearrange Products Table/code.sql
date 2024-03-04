# Write your MySQL query statement below

SELECT
    product_id,
    "store1" As store,
    store1 AS price
FROM
    Products
WHERE
    store1 iS NOT NULL

UNION

SELECT
    product_id,
    "store2" As store,
    store2 AS price
FROM
    Products
WHERE
    store2 iS NOT NULL

UNION

SELECT
    product_id,
    "store3" As store,
    store3 AS price
FROM
    Products
WHERE
    store3 iS NOT NULL
