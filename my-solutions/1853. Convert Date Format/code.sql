# Write your MySQL query statement below

SELECT
    CONCAT(DAYNAME(day), ", ", DATE_FORMAT(day, "%M %e"), ", ", YEAR(day)) AS day
FROM
    Days

# Write your MySQL query statement below

SELECT
    DATE_FORMAT(day, "%W, %M %e, %Y") AS day
FROM
    Days
