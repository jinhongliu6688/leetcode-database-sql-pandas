# Write your MySQL query statement below

SELECT
    student_id,
    department_id,
    IFNULL(ROUND((rank() over(partition by department_id order by mark desc) - 1) * 100 / (count(*) over(partition by department_id) - 1), 2), 0) percentage
FROM
    Students
