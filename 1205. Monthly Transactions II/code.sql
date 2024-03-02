# Write your MySQL query statement below

WITH approve AS (
    SELECT
        LEFT(trans_date, 7) month,
        country,
        COUNT(state) approved_count,
        SUM(amount) approved_amount
    FROM
        Transactions
    WHERE
        state = "approved"
    GROUP BY
        LEFT(trans_date, 7),
        country
),
charge AS (
    SELECT
        LEFT(c.trans_date, 7) month,
        country,
        COUNT(trans_id) chargeback_count,
        SUM(amount) chargeback_amount
    FROM
        Transactions t
    right JOIN
        Chargebacks c
    ON
        t.id = c.trans_id
    GROUP BY
        LEFT(c.trans_date, 7),
        country
)

SELECT
    COALESCE(a.month, c.month) month,
    COALESCE(a.country, c.country) country,
    IFNULL(approved_count, 0) approved_count,
    IFNULL(approved_amount, 0) approved_amount,
    IFNULL(chargeback_count, 0) chargeback_count,
    IFNULL(chargeback_amount, 0) chargeback_amount
FROM
    approve a
LEFT JOIN
    charge c
ON
    a.month = c.month AND
    a.country = c.country
WHERE
    NOT(approved_count = 0 AND 
    approved_amount = 0 AND
    chargeback_count = 0 AND
    chargeback_amount = 0)

UNION


SELECT
    COALESCE(a.month, c.month) month,
    COALESCE(a.country, c.country) country,
    IFNULL(approved_count, 0) approved_count,
    IFNULL(approved_amount, 0) approved_amount,
    IFNULL(chargeback_count, 0) chargeback_count,
    IFNULL(chargeback_amount, 0) chargeback_amount
FROM
    approve a
RIGHT JOIN
    charge c
ON
    a.month = c.month AND
    a.country = c.country
WHERE
    NOT(approved_count = 0 AND 
    approved_amount = 0 AND
    chargeback_count = 0 AND
    chargeback_amount = 0)
