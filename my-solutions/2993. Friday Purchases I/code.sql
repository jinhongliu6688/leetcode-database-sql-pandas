# Write your MySQL query statement below

SELECT
    ceiling(datediff(purchase_date, "2023-11-01") / 7) week_of_month,
    MAX(purchase_date) purchase_date,
    SUM(amount_spend) total_amount
FROM
    Purchases
WHERE
    weekday(purchase_date) = 4
GROUP BY
    purchase_date
ORDER BY
    1;
