# Write your MySQL query statement below

SELECT
    LOWER(TRIM(product_name)) AS product_name,
    sale_date,
    COUNT(*) AS total
FROM 
(
    SELECT
        sale_id,
        product_name,
        LEFT(sale_date, 7) AS sale_date
    FROM
        Sales
) AS table_1
GROUP BY
    LOWER(TRIM(product_name)),
    sale_date
ORDER BY
    product_name ASC,
    sale_date ASC
