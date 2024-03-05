# Write your MySQL query statement below

WITH cte AS (
    SELECT
        school_id,
        MAX(student_count) max_student
    FROM
        Schools s
    LEFT JOIN
        Exam e
    ON
        s.capacity >= e.student_count
    GROUP BY
        school_id
)

SELECT
    school_id,
    IFNULL(MIN(score), -1) score
FROM
    cte c
LEFT JOIN
    Exam e
ON
    c.max_student = e.student_count
GROUP BY
    school_id
