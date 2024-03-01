# Write your MySQL query statement below

SELECT
    student_id,
    MIN(course_id) course_id,
    grade
FROM
    Enrollments
WHERE
    (student_id, grade) IN (
        SELECT
            student_id,
            MAX(grade) max_grade
        FROM
            Enrollments
        GROUP BY
            student_id
        ORDER BY
            student_id
    )
GROUP BY
    student_id
ORDER BY
    student_id
