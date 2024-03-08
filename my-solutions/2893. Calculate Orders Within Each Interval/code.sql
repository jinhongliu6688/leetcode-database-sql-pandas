# Write your MySQL query statement below

SELECT
    ceiling(minute / 6) interval_no,
    SUM(order_count) total_orders
FROM
    Orders
GROUP BY
    interval_no
ORDER BY
    1;
