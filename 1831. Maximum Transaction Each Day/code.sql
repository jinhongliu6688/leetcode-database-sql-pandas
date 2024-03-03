# Write your MySQL query statement below

SELECT
    transaction_id
FROM
    Transactions
WHERE
    (DATE_FORMAT(day, "%Y-%m-%d"), amount) IN (
        SELECT
            DATE_FORMAT(day, "%Y-%m-%d") day,
            MAX(amount) max_amount
        FROM
            Transactions
        GROUP BY
            DATE_FORMAT(day, "%Y-%m-%d")
    )
ORDER BY
    1
