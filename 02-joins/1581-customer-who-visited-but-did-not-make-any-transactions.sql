-- 1581. Customer Who Visited but Did Not Make Any Transactions (Easy)
-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
-- Concepts: LEFT JOIN + IS NULL (anti-join), GROUP BY, COUNT

SELECT v.customer_id, COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id;

-- How it works:
-- 1. LEFT JOIN keeps every visit. Visits with no transaction get NULL in t's columns.
-- 2. WHERE t.visit_id IS NULL keeps only visits without a transaction.
-- 3. GROUP BY v.customer_id puts each customer's visits into one group.
-- 4. COUNT(*) counts the rows in each group.
--
-- Pattern: "LEFT JOIN ... WHERE right.key IS NULL" finds rows with NO match
-- in another table (e.g. users who never ordered). It is very common in interviews.
--
-- Pitfall: COUNT(column) ignores NULLs.
-- COUNT(t.transaction_id) would return 0 here, because after the WHERE filter
-- every t column is NULL. Use COUNT(*) or count a column from v.
