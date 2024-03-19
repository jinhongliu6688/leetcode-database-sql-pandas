# Write your MySQL query statement below

SELECT 
    REGEXP_SUBSTR(tweet,'#[0-9a-zA-Z]+') HASHTAG,
    COUNT(*) HASHTAG_COUNT 
FROM 
    Tweets
WHERE 
    LEFT(tweet_date, 7) = '2024-02'
GROUP BY 
    1
ORDER BY 
    2 DESC,
    1 DESC
LIMIT 
    3;
