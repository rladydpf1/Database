explain plan for
SELECT I.Name, T.course_id, S.Semester, S.year, ROUND(AVG(U.Tot_cred), 2) AS Avg_cred
FROM teaches t, student u, section s, takes k, instructor i
WHERE S.semester = t.semester
AND S.year = t.year
and k.id = u.id
and s.semester = k.semester
and s.year = k.year
and i.id = t.id
group by i.name, t.course_id, s.semester, s.year;

select * from table(DBMS_XPLAN.DISPLAY('PLAN_TABLE', NULL, 'BASIC', NULL));
