# Write your MySQL query statement below

SELECT
    seller_name
FROM
    Seller
WHERE
    seller_id NOT IN (
        SELECT
            seller_id
        FROM
            Orders
        WHERE
            sale_date LIKE "2020%"
    )
ORDER BY
    seller_name

# Write your MySQL query statement below

SELECT
    seller_name
FROM
    Seller s
LEFT JOIN
    Orders o
ON 
    s.seller_id = o.seller_id AND
    sale_date LIKE "2020%"
WHERE
    order_id IS NULL
ORDER BY
    seller_name
