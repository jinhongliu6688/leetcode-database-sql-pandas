# Write your MySQL query statement below

# For each employee in the Logs table, calculate the total working minutes.
# Remember to use ceiling to round up the minutes.
WITH cte AS (
    SELECT
        employee_id,
        SUM(ceiling(timestampdiff(second, in_time, out_time) / 60) / 60) work_length
    FROM
        Logs
    GROUP BY
        employee_id
)

# Use left join to join Employees table with cte table to keep all the employee_id in the result
# Select the employee_id with not enough needed_hours or the work_length is null
SELECT
    employee_id
FROM
    Employees e
LEFT JOIN
    cte c
USING
    (employee_id)
WHERE
    needed_hours > work_length OR
    work_length IS NULL
