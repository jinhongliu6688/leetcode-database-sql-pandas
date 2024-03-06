# Write your MySQL query statement below

SELECT
    SUM(IF(weekday(submit_date) < 5, 0, 1)) weekend_cnt,
    SUM(IF(weekday(submit_date) < 5, 1, 0)) working_cnt
FROM
    Tasks
