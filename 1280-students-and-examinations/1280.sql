-- method 1
SELECT
    a.student_id,
    a.student_name,
    b.subject_name,
    COUNT(b.subject_name = c.subject_name) AS attended_exams
FROM Students a CROSS JOIN Subjects b
LEFT JOIN Examinations c ON a.student_id = c.student_id AND b.subject_name = c.subject_name
GROUP BY a.student_id, b.subject_name
ORDER BY a.student_id, b.subject_name;

-- method 2
SELECT
    a.student_id,
    a.student_name,
    b.subject_name,
    COUNT(c.subject_name) AS attended_exams
FROM Students a CROSS JOIN Subjects b
LEFT JOIN Examinations c ON a.student_id = c.student_id AND b.subject_name = c.subject_name
GROUP BY a.student_id, b.subject_name
ORDER BY a.student_id, b.subject_name 
