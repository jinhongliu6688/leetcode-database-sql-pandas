# Write your MySQL query statement below

SELECT
    project_id,
    p.employee_id
FROM
    Project p
INNER JOIN
    Employee e
ON
    p.employee_id = e.employee_id
WHERE
    (project_id, experience_years) IN (
        SELECT
            project_id,
            MAX(experience_years) max_year
        FROM
            Project p
        INNER JOIN
            Employee e
        ON
            p.employee_id = e.employee_id
        GROUP BY
            project_id
    )

# Write your MySQL query statement below

WITH temp AS (
    SELECT
        *
    FROM
        Project
    INNER JOIN
        Employee
    USING(employee_id)
)

SELECT
    project_id,
    employee_id
FROM
    temp
WHERE
    (project_id, experience_years) IN (
        SELECT
            project_id,
            MAX(experience_years) max_year
        FROM
            temp
        GROUP BY
            project_id
    )
