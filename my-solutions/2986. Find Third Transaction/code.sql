# Write your MySQL query statement below

SELECT
    user_id,
    spend third_transaction_spend,
    transaction_date third_transaction_date
FROM (
    SELECT
        *,
        IF(row_number() over(partition by user_id order by transaction_date) = 3 AND
        spend > lag(spend, 1) over(partition by user_id order by transaction_date) AND
        spend > lag(spend, 2) over(partition by user_id order by transaction_date), 1, 0) tag
    FROM
        Transactions
) temp_1
WHERE
    tag = 1
ORDER BY
    1;
