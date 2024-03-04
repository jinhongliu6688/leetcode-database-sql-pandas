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
    student_id NOT IN (
        SELECT
            student_id
        FROM(
            SELECT
                student_id,
                rank() over(partition by exam_id order by score desc) hight_to_low_rank,
                rank() over(partition by exam_id order by score asc) low_to_high_rank
            FROM
                Student s
            INNER JOIN
                Exam e
            USING(student_id)
        ) temp
        WHERE
            hight_to_low_rank = 1 OR
            low_to_high_rank = 1
    )
ORDER BY
    student_id
