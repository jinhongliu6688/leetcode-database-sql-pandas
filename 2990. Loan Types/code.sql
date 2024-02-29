# Write your MySQL query statement below

SELECT
    user_id
FROM
    Loans
GROUP BY
    user_id
HAVING
    GROUP_CONCAT(loan_type) LIKE "%Refinance%" AND
    GROUP_CONCAT(loan_type) LIKE "%Mortgage%"
ORDER BY
    user_id
