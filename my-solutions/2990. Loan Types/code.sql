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

# Write your MySQL query statement below

SELECT
    user_id
FROM
    Loans
WHERE
    loan_type = "Refinance" OR
    loan_type = "Mortgage"
GROUP BY
    user_id
HAVING
    COUNT(DISTINCT user_id, loan_type) = 2
ORDER BY
    user_id
