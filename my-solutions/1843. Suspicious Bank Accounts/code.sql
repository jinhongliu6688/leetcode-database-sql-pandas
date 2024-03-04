# Write your MySQL query statement below

SELECT
    distinct account_id
FROM (
    SELECT
        account_id,
        LEFT(day, 7) month,
        SUM(amount) total_amount,
        max_income,
        CONCAT(account_id, replace(LEFT(day, 7), "-", "") - row_number() over(partition by account_id order by LEFT(day, 7))) as tag
    FROM
        Transactions t
    INNER JOIN
        Accounts a
    USING
        (account_id)
    WHERE
        type = "Creditor"
    GROUP BY
        account_id,
        LEFT(day, 7)
    HAVING
        SUM(amount) > max_income
) temp
GROUP BY
    tag
HAVING
    COUNT(*) >= 2
