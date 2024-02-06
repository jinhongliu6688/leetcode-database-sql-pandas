# Write your MySQL query statement below

SELECT
    P.product_id, 
    IFNULL(ROUND(SUM(price * units) / SUM(units), 2), 0) AS average_price
FROM 
    Prices P LEFT JOIN UnitsSold U
ON 
    P.product_id = U.product_id
WHERE 
    (U.purchase_date BETWEEN P.start_date AND P.end_date) OR 
    (U.product_id IS NULL)
GROUP BY 
    P.product_id;
