# Write your MySQL query statement below

SELECT
    COUNT(distinct account_id) accounts_count
FROM
    Subscriptions su
INNER JOIN
    Streams st
USING
    (account_id)
WHERE
    (year(start_date) <= 2021 AND
    year(end_date) >= 2021) AND 
    year(stream_date) <> "2021"

# Write your MySQL query statement below

SELECT
    COUNT(distinct account_id) accounts_count
FROM
    Subscriptions su
INNER JOIN
    Streams st
USING
    (account_id)
WHERE
    (2021 BETWEEN year(start_date) AND year(end_date)) AND 
    year(stream_date) <> "2021"
