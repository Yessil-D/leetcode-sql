-- 584. Find Customer Referee (Easy)
-- https://leetcode.com/problems/find-customer-referee/
-- Concepts: WHERE, OR, IS NULL

SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;

-- Pitfall: NULL handling
-- * `WHERE referee_id != 2` alone drops every row where referee_id is NULL.
--   Comparing NULL with anything (=, !=, <>) gives UNKNOWN, not TRUE,
--   and WHERE keeps only TRUE rows.
-- * NULL can only be tested with IS NULL / IS NOT NULL. `= NULL` never matches.
--
-- Alternative:
--   WHERE COALESCE(referee_id, 0) != 2
