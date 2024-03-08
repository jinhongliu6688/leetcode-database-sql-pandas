# Write your MySQL query statement below

SELECT
    policy_id,
    state,
    fraud_score
FROM (
    SELECT
        *,
        percent_rank() over(partition by state order by fraud_score desc) pr
    FROM
        Fraud
) temp
WHERE
    pr < 0.05
ORDER BY
    state,
    fraud_score DESC,
    policy_id;
