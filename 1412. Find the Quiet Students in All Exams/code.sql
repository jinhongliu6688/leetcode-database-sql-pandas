# Write your MySQL query statement below

SELECT
    DISTINCT student_id,
    student_name
FROM
    Student s
INNER JOIN
    Exam e
USING(student_id)
WHERE
    (student_id, student_name) NOT IN (
        SELECT
            DISTINCT student_id,
            student_name
        FROM (
            SELECT
                *,
                rank() over(partition by exam_id order by score desc) ranking
            FROM
                Student s
            INNER JOIN
                Exam e
            USING(student_id)
        ) temp_1
        WHERE
            ranking = 1

        UNION

        SELECT
            DISTINCT student_id,
            student_name
        FROM (
            SELECT
                *,
                rank() over(partition by exam_id order by score) ranking
            FROM
                Student s
            INNER JOIN
                Exam e
            USING(student_id)
        ) temp_2
        WHERE
            ranking = 1
    )
ORDER BY
    student_id
