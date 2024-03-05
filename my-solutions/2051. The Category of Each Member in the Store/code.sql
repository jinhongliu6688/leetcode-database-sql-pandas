# Write your MySQL query statement below

SELECT
    member_id,
    name,
    CASE
        WHEN COUNT(visit_id) = 0 THEN "Bronze"
        WHEN COUNT(charged_amount) * 100 / COUNT(visit_id) >= 80 THEN "Diamond"
        WHEN COUNT(charged_amount) * 100 / COUNT(visit_id) >= 50 THEN "Gold"
        ELSE "Silver"
    END AS category
FROM
    Members m
LEFT JOIN
    Visits v
USING
    (member_id)
LEFT JOIN
    Purchases p
USING
    (visit_id)
GROUP BY
    member_id
