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

