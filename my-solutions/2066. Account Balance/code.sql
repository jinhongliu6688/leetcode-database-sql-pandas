# Write your MySQL query statement below

SELECT
    account_id,
    day,
    SUM(amount) over(partition by account_id order by day) balance
FROM (
    SELECT
        account_id,
        day,
        IF(type = "Withdraw", -amount, amount) AS amount
    FROM
        Transactions
) temp
