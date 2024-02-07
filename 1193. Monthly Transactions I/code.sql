# Write your MySQL query statement below

SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    COUNT(CASE WHEN state = "approved" THEN state END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    IFNULL(SUM(CASE WHEN state = "approved" THEN amount END), 0) AS approved_total_amount
FROM
    Transactions
GROUP BY
    month,
    country;
