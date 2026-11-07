-- 620. Not Boring Movies (Easy)
-- https://leetcode.com/problems/not-boring-movies/
-- Concepts: modulo for odd numbers, !=, ORDER BY ... DESC

SELECT *
FROM Cinema
WHERE id % 2 = 1 AND description != 'boring'
ORDER BY rating DESC;

-- How it works:
-- 1. id % 2 = 1 keeps odd ids (MOD(id, 2) = 1 also works).
-- 2. != 'boring' drops boring movies (text needs quotes).
-- 3. DESC sorts from highest to lowest rating (the default is ASC).
--
-- Pitfall: a NULL description would also be dropped, because NULL != 'boring'
-- is "unknown", not true. To keep NULLs:
--   (description != 'boring' OR description IS NULL)
-- Tip: copy column names from the problem and read the error message:
-- "Unknown column 'describtion'" points straight at the typo.
