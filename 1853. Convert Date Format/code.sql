# Write your MySQL query statement below

SELECT
    CONCAT(DAYNAME(day), ", ", DATE_FORMAT(day, "%M %e"), ", ", YEAR(day)) AS day
FROM
    Days
