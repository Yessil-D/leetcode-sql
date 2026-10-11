-- 1148. Article Views I (Easy)
-- https://leetcode.com/problems/article-views-i/
-- Concepts: DISTINCT, column alias (AS), ORDER BY

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;

-- Notes:
-- * The table has no primary key and may contain duplicate rows,
--   so DISTINCT is needed to return each author only once.
-- * DISTINCT removes duplicates from the result only. It never changes the table.
--   (DELETE would modify the data, which is not what we want here.)
-- * ORDER BY needs a column name. ASC (ascending) is the default and DESC is descending.
-- * ORDER BY can use the alias defined in SELECT (`id`).
