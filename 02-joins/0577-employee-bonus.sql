-- 577. Employee Bonus (Easy)
-- https://leetcode.com/problems/employee-bonus/
-- Concepts: LEFT JOIN, IS NULL

SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;

-- Notes:
-- * Employees without a bonus must appear too, so we use LEFT JOIN. Their bonus becomes NULL.
-- * `bonus < 1000` is UNKNOWN for NULL, so `OR bonus IS NULL` is required.
--
-- Pitfall: put the filter in WHERE, not in ON.
--   LEFT JOIN Bonus b ON e.empId = b.empId AND b.bonus < 1000
-- would still keep EVERY employee. The ON condition only decides whether the
-- right side matches, so Thomas (bonus 2000) would show up with a NULL bonus.
