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
    (year(start_date) = "2021" OR
    year(end_date) = "2021") AND 
    year(stream_date) <> "2021"
