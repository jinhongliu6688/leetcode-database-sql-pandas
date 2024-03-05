-- # Write your MySQL query statement below

SELECT
    platform,
    experiment_name,
    MAX(num_experiments) num_experiments
FROM (
    SELECT
        platform,
        experiment_name,
        COUNT(*) num_experiments
    FROM
        Experiments
    GROUP BY
        platform,
        experiment_name

    UNION

    SELECT
        platform,
        experiment_name,
        p_table.num_experiments
    FROM (
        SELECT "Android" AS platform, 0 AS num_experiments
        UNION
        SELECT "IOS" AS platform, 0 AS num_experiments
        UNION
        SELECT "Web" AS platform, 0 AS num_experiments
    ) p_table, ( 
        SELECT "Reading" AS experiment_name, 0 AS num_experiments
        UNION
        SELECT "Sports" AS experiment_name, 0 AS num_experiments
        UNION
        SELECT "Programming" AS experiment_name, 0 AS num_experiments
    ) e_table
) temp
GROUP BY
    platform,
    experiment_name

-- # Write your MySQL query statement below

WITH cte AS (
    SELECT
        *
    FROM (
        SELECT "Android" AS platform
        UNION
        SELECT "IOS" AS platform
        UNION
        SELECT "Web" AS platform
    ) p_table, (
        SELECT "Reading" AS experiment_name
        UNION
        SELECT "Sports" AS experiment_name
        UNION
        SELECT "Programming" AS experiment_name
    ) e_table
)

SELECT
    platform,
    experiment_name,
    COUNT(experiment_id) num_experiments
FROM
    Experiments e
RIGHT JOIN
    cte c
USING
    (platform, experiment_name)
GROUP BY
    platform,
    experiment_name
