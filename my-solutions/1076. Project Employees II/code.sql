# Write your MySQL query statement below

SELECT
    project_id
FROM
    Project
GROUP BY
    project_id
HAVING
    COUNT(*) = 
    (
        SELECT
            MAX(count) AS most
        FROM 
        (
            SELECT
                COUNT(*) AS count
            FROM
                Project
            GROUP BY
                project_id
        ) table_1
    )

# Write your MySQL query statement below

SELECT
    project_id
FROM
    Project
GROUP BY
    project_id
HAVING
    COUNT(*) = 
    (
        SELECT
            COUNT(*)
        FROM
            Project
        GROUP BY
            project_id
        ORDER BY
            COUNT(*) DESC
        LIMIT
            1
    )
