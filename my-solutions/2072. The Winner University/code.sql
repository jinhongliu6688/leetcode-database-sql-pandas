# Write your MySQL query statement below

WITH 
n_num AS (SELECT COUNT(*) AS num FROM NewYork WHERE score >= 90),
c_num AS (SELECT COUNT(*) AS num FROM California WHERE score >= 90)
SELECT
    CASE
        WHEN (SELECT num FROM n_num) > (SELECT num FROM c_num) THEN "New York University"
        WHEN (SELECT num FROM n_num) < (SELECT num FROM c_num) THEN "California University"
        ELSE "No Winner"
    END AS winner

# Write your MySQL query statement below

SELECT
    CASE
        WHEN (SELECT COUNT(*) AS num FROM NewYork WHERE score >= 90) > (SELECT COUNT(*) AS num FROM California WHERE score >= 90) THEN "New York University"
        WHEN (SELECT COUNT(*) AS num FROM NewYork WHERE score >= 90) < (SELECT COUNT(*) AS num FROM California WHERE score >= 90) THEN "California University"
        ELSE "No Winner"
    END AS winner
