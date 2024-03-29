# Write your MySQL query statement below

SELECT
    query_name,
    ROUND(SUM(rating / position) / COUNT(*), 2) AS quality,
    ROUND(AVG(rating < 3) * 100, 2) AS poor_query_percentage
FROM
    Queries
WHERE
    query_name IS NOT NULL
GROUP BY
    query_name;

# Write your MySQL query statement below

SELECT
    query_name,
    ROUND(SUM(rating / position) / COUNT(rating / position), 2) AS quality,
    ROUND(COUNT(CASE WHEN rating < 3 THEN rating END)/COUNT(rating) * 100, 2) AS poor_query_percentage
FROM
    Queries
WHERE
    query_name IS NOT NULL
GROUP BY
    query_name;

# Write your MySQL query statement below

SELECT
    query_name,
    ROUND(SUM(rating / position) / COUNT(rating / position), 2) AS quality,
    ROUND(SUM(IF(rating < 3, 1, 0))/COUNT(rating) * 100, 2) AS poor_query_percentage
FROM
    Queries
WHERE
    query_name IS NOT NULL
GROUP BY
    query_name;
