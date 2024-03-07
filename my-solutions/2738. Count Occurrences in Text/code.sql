# Write your MySQL query statement below

SELECT
    "bull" word,
    SUM(IF(content LIKE "% bull %", 1, 0)) count
FROM
    Files

UNION

SELECT
    "bear" word,
    SUM(IF(content LIKE "% bear %", 1, 0)) count
FROM
    Files;

# Write your MySQL query statement below

SELECT
    "bull" word,
    COUNT(*) count
FROM
    Files
WHERE
    content LIKE "% bull %"

UNION

SELECT
    "bear" word,
    COUNT(*) count
FROM
    Files
WHERE
    content LIKE "% bear %";
