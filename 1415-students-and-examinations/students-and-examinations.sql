with exams_grouped as
    (SELECT student_id
        ,subject_name
        ,COUNT(*) as attended
    FROM Examinations
    GROUP BY 1, 2
    )

SELECT s.student_id
    ,s.student_name
    ,sb.subject_name
    ,COALESCE(e.attended, 0) as attended_exams
FROM Students s
CROSS JOIN Subjects sb
LEFT JOIN exams_grouped e
    ON s.student_id=e.student_id
    AND sb.subject_name=e.subject_name
ORDER BY 1, 3;