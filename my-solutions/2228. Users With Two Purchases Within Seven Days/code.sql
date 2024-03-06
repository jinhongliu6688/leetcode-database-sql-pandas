# Write your MySQL query statement below

SELECT
    distinct user_id
FROM (
    SELECT
        user_id,
        purchase_date,
        datediff(purchase_date, lag(purchase_date) over(partition by user_id order by purchase_date)) date_diff
    FROM
        Purchases
) temp
WHERE
    date_diff <= 7
order by
    1

# Write your MySQL query statement below

SELECT
    distinct p1.user_id
FROM
    Purchases p1,
    Purchases p2
WHERE
    p1.user_id = p2.user_id AND
    datediff(p2.purchase_date, p1.purchase_date) BETWEEN 0 AND 7 AND
    p1.purchase_id <> p2.purchase_id
ORDER BY
    1
