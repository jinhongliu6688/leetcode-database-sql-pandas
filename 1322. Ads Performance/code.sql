# Write your MySQL query statement below

SELECT
    ad_id,
    IFNULL(ROUND(SUM(IF(action = "Clicked", 1, 0)) / (SUM(IF(action = "Clicked", 1, 0)) + SUM(IF(action = "Viewed", 1, 0))) * 100, 2), 0) AS ctr
FROM
    Ads
GROUP BY
    ad_id
ORDER BY
    ctr DESC,
    ad_id ASC

# Write your MySQL query statement below

SELECT
    ad_id,
    IFNULL(
        ROUND(
            SUM(action = "Clicked") 
            / 
            (SUM(action = "Clicked") + SUM(action = "Viewed"))
            * 100
        , 2)
    , 0) AS ctr
FROM
    Ads
GROUP BY
    ad_id
ORDER BY
    ctr DESC,
    ad_id ASC
