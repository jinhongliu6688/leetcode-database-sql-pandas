# Write your MySQL query statement below

SELECT
    DISTINCT D.id,
    Jan_Revenue,
    Feb_Revenue,
    Mar_Revenue,
    Apr_Revenue,
    May_Revenue,
    Jun_Revenue,
    Jul_Revenue,
    Aug_Revenue,
    Sep_Revenue,
    Oct_Revenue,
    Nov_Revenue,
    Dec_Revenue
FROM Department AS D 
    LEFT JOIN 
(SELECT id, revenue AS Jan_Revenue FROM Department WHERE month = "Jan") AS Jan ON D.id = Jan.id
    LEFT JOIN 
(SELECT id, revenue AS Feb_Revenue FROM Department WHERE month = "Feb") AS Feb ON D.id = Feb.id
    LEFT JOIN 
(SELECT id, revenue AS Mar_Revenue FROM Department WHERE month = "Mar") AS Mar ON D.id = Mar.id
    LEFT JOIN 
(SELECT id, revenue AS Apr_Revenue FROM Department WHERE month = "Apr") AS Apr ON D.id = Apr.id
    LEFT JOIN 
(SELECT id, revenue AS May_Revenue FROM Department WHERE month = "May") AS May ON D.id = May.id
    LEFT JOIN 
(SELECT id, revenue AS Jun_Revenue FROM Department WHERE month = "Jun") AS Jun ON D.id = Jun.id
    LEFT JOIN 
(SELECT id, revenue AS Jul_Revenue FROM Department WHERE month = "Jul") AS Jul ON D.id = Jul.id
    LEFT JOIN 
(SELECT id, revenue AS Aug_Revenue FROM Department WHERE month = "Aug") AS Aug ON D.id = Aug.id
    LEFT JOIN 
(SELECT id, revenue AS Sep_Revenue FROM Department WHERE month = "Sep") AS Sep ON D.id = Sep.id
    LEFT JOIN 
(SELECT id, revenue AS Oct_Revenue FROM Department WHERE month = "Oct") AS Oct ON D.id = Oct.id
    LEFT JOIN 
(SELECT id, revenue AS Nov_Revenue FROM Department WHERE month = "Nov") AS Nov ON D.id = Nov.id
    LEFT JOIN 
(SELECT id, revenue AS Dec_Revenue FROM Department WHERE month = "Dec") AS Dece ON D.id = Dece.id

# Write your MySQL query statement below

SELECT
    id,
    SUM(IF(month = "Jan", revenue, NULL)) AS Jan_Revenue,
    SUM(IF(month = "Feb", revenue, NULL)) AS Feb_Revenue,
    SUM(IF(month = "Mar", revenue, NULL)) AS Mar_Revenue,
    SUM(IF(month = "Apr", revenue, NULL)) AS Apr_Revenue,
    SUM(IF(month = "May", revenue, NULL)) AS May_Revenue,
    SUM(IF(month = "Jun", revenue, NULL)) AS Jun_Revenue,
    SUM(IF(month = "Jul", revenue, NULL)) AS Jul_Revenue,
    SUM(IF(month = "Aug", revenue, NULL)) AS Aug_Revenue,
    SUM(IF(month = "Sep", revenue, NULL)) AS Sep_Revenue,
    SUM(IF(month = "Oct", revenue, NULL)) AS Oct_Revenue,
    SUM(IF(month = "Nov", revenue, NULL)) AS Nov_Revenue,
    SUM(IF(month = "Dec", revenue, NULL)) AS Dec_Revenue
FROM
    Department
GROUP BY
    id

# Write your MySQL query statement below

SELECT
    id,
    SUM(CASE WHEN month = "JAN" THEN revenue END) AS Jan_Revenue,
    SUM(CASE WHEN month = "Feb" THEN revenue END) AS Feb_Revenue,
    SUM(CASE WHEN month = "Mar" THEN revenue END) AS Mar_Revenue,
    SUM(CASE WHEN month = "Apr" THEN revenue END) AS Apr_Revenue,
    SUM(CASE WHEN month = "May" THEN revenue END) AS May_Revenue,
    SUM(CASE WHEN month = "Jun" THEN revenue END) AS Jun_Revenue,
    SUM(CASE WHEN month = "Jul" THEN revenue END) AS Jul_Revenue,
    SUM(CASE WHEN month = "Aug" THEN revenue END) AS Aug_Revenue,
    SUM(CASE WHEN month = "Sep" THEN revenue END) AS Sep_Revenue,
    SUM(CASE WHEN month = "Oct" THEN revenue END) AS Oct_Revenue,
    SUM(CASE WHEN month = "Nov" THEN revenue END) AS Nov_Revenue,
    SUM(CASE WHEN month = "Dec" THEN revenue END) AS Dec_Revenue
FROM
    Department
GROUP BY
    id
