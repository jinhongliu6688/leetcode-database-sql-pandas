# Write your MySQL query statement below

SELECT
    *
FROM (
    SELECT
        "succeeded" period_state,
        MIN(success_date) start_date,
        MAX(success_date) end_date
    FROM (
        SELECT
            success_date,
            row_number() over (order by success_date) rn,
            DATEDIFF(success_date, "2000-01-01") - row_number() over (order by success_date) tag
        FROM
            Succeeded
        WHERE
            success_date between "2019-01-01" AND "2019-12-31"
    ) s_table
    GROUP BY
        tag

    UNION

    SELECT
        "failed" period_state,
        MIN(fail_date) start_date,
        MAX(fail_date) end_date
    FROM (
        SELECT
            fail_date,
            row_number() over (order by fail_date) rn,
            DATEDIFF(fail_date, "2000-01-01") - row_number() over (order by fail_date) tag
        FROM
            Failed
        WHERE
            fail_date between "2019-01-01" AND "2019-12-31"
    ) f_table
    GROUP BY
        tag
) temp
ORDER BY
    start_date

# Write your MySQL query statement below

SELECT
    *
FROM (
    SELECT
        "succeeded" period_state,
        MIN(success_date) start_date,
        MAX(success_date) end_date
    FROM (
        SELECT
            success_date,
            row_number() over (order by success_date) rn,
            SUBDATE(success_date, row_number() over (order by success_date)) tag
        FROM
            Succeeded
        WHERE
            YEAR(success_date) = 2019
    ) s_table
    GROUP BY
        tag

    UNION

    SELECT
        "failed" period_state,
        MIN(fail_date) start_date,
        MAX(fail_date) end_date
    FROM (
        SELECT
            fail_date,
            row_number() over (order by fail_date) rn,
            SUBDATE(fail_date, row_number() over (order by fail_date)) tag
        FROM
            Failed
        WHERE
            YEAR(fail_date) = 2019
    ) f_table
    GROUP BY
        tag
) temp
ORDER BY
    start_date
