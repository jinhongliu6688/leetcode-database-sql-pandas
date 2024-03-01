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

# Write your MySQL query statement below

SELECT
    student_id,
    course_id,
    grade
FROM (
    SELECT
        student_id,
        course_id,
        grade,
        rank() over(partition by student_id order by grade desc, course_id) r
    FROM
        Enrollments
) temp
WHERE
    r = 1
ORDER BY
    student_id
