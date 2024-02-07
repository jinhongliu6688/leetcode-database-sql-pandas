# Write your MySQL query statement below

SELECT
    ROUND(AVG(column_1 = 1) * 100, 2) AS immediate_percentage
FROM
    (SELECT
        MIN(order_date) = MIN(customer_pref_delivery_date) AS column_1
    FROM
        Delivery
    GROUP BY
        customer_id) AS table_1;
