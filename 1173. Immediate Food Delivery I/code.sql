# Write your MySQL query statement below

SELECT
    ROUND(SUM(IF(customer_pref_delivery_date = order_date, 1, 0)) / COUNT(*) * 100, 2) AS immediate_percentage
FROM
    Delivery
