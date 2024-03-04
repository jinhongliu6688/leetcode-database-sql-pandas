# Write your MySQL query statement below

WITH recursive temp_table(task_id, subtask_id) AS (
    SELECT
        task_id,
        subtasks_count
    FROM
        Tasks
    
    UNION ALL

    SELECT
        task_id,
        subtask_id - 1
    FROM
        temp_table
    WHERE
        subtask_id > 1
)

SELECT
    *
FROM 
    temp_table
    
EXCEPT

SELECT
    *
FROM
    Executed
