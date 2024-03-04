# Write your MySQL query statement below

SELECT
    user_id,
    user_name,
    credit - IFNULL(total_pay, 0) + IFNULL(total_receive, 0) credit,
    IF(credit - IFNULL(total_pay, 0) + IFNULL(total_receive, 0) < 0, "Yes", "No") credit_limit_breached
FROM
    Users u
LEFT JOIN (
    SELECT
        paid_by,
        SUM(amount) total_pay
    FROM
        Transactions
    GROUP BY
        paid_by
) temp_1
ON
    u.user_id = temp_1.paid_by
LEFT JOIN (
    SELECT
        paid_to,
        SUM(amount) total_receive
    FROM
        Transactions
    GROUP BY
        paid_to
) temp_2
ON
    u.user_id = temp_2.paid_to
