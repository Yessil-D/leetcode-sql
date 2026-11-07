-- 570. Managers with at Least 5 Direct Reports (Medium)
-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
-- Concepts: GROUP BY + HAVING, subquery with IN

SELECT name
FROM Employee
WHERE id IN (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
);

-- How it works:
-- 1. Inner query: count how many rows have each managerId (= number of direct
--    reports) and keep managers with >= 5. It returns manager ids, e.g. 101.
-- 2. Outer query: the same number means "my manager" in managerId but "me" in id,
--    so find the rows whose id is in that list and return their name.
--
-- Pitfall: a self-join version that groups by the manager's name breaks when two
-- managers share a name (3 + 3 reports would wrongly count as 6). Group by id.
-- Tip: write subqueries inside-out. Run the inner query alone first, check it,
-- then wrap it.
