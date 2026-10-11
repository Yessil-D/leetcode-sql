-- 595. Big Countries (Easy)
-- https://leetcode.com/problems/big-countries/
-- Concepts: SELECT multiple columns, WHERE, OR

SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;

-- Notes:
-- * Rows are filtered with WHERE. SQL has no `IF` for this.
-- * Check column names carefully against the schema (typos like `are` instead of `area` cause errors).
