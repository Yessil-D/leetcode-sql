-- 1280. Students and Examinations (Easy)
-- https://leetcode.com/problems/students-and-examinations/
-- Concepts: CROSS JOIN, LEFT JOIN on two conditions, COUNT(column), multi-column GROUP BY

SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;

-- How it works:
-- 1. CROSS JOIN builds every (student, subject) pair: 4 students x 3 subjects = 12 rows.
-- 2. LEFT JOIN attaches each exam record to its pair, matching both student and subject.
--    Pairs with no exams keep one row with NULLs on the e side.
-- 3. GROUP BY the pair and count the exam rows.
--
-- Pitfall: COUNT(*) would return 1 for a pair with no exams, because the LEFT JOIN
-- still keeps one row. COUNT(e.subject_name) skips NULLs, so it correctly returns 0.
-- COUNT(sub.subject_name) would be wrong too, since that column is never NULL.
