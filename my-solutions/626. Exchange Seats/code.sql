# Write your MySQL query statement below

SELECT
    SUM(count) OVER(ORDER BY id) AS id,
    student
FROM (
    SELECT
        id + 1 AS id,
        student,
        1 AS count
    FROM
        Seat
    WHERE
        id % 2 = 1

    UNION

    SELECT
        id - 1 AS id,
        student,
        1 AS count
    FROM
        Seat
    WHERE
        id % 2 = 0

    ORDER BY
        id
) temp_table

# Write your MySQL query statement below

SELECT
    IF(id % 2 = 0, id - 1, IF(id = (
        SELECT
            COUNT(*)
        FROM
            Seat
    ), id, id + 1)) AS id,
    student
FROM
    Seat
ORDER BY
    id
