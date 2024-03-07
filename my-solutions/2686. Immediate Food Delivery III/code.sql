# Write your MySQL query statement below

SELECT
    order_date,
    ROUND(SUM(IF(order_date = customer_pref_delivery_date, 1, 0)) / COUNT(*) * 100, 2)  immediate_percentage
FROM
    Delivery
GROUP BY
    order_date
ORDER BY
    1;
