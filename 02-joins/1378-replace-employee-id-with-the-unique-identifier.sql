-- 1378. Replace Employee ID With The Unique Identifier (Easy)
-- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
-- Concepts: LEFT JOIN, table aliases

SELECT u.unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI u ON e.id = u.id;

-- Notes:
-- * Every employee must appear, even without a unique_id, so we use LEFT JOIN
--   with Employees on the left. Unmatched rows get NULL for unique_id.
-- * INNER JOIN would drop employees with no match.
-- * Swapping the tables (FROM EmployeeUNI LEFT JOIN Employees) would lose them too:
--   LEFT JOIN keeps all rows of the table after FROM.
--
-- Pitfall: both tables have an `id` column. A bare `SELECT id` raises
-- "Column 'id' in field list is ambiguous". Qualify it as e.id or u.id.
