-- 197. Rising Temperature (Easy)
-- https://leetcode.com/problems/rising-temperature/
-- Concepts: self join, DATEDIFF

SELECT today.id
FROM Weather today
JOIN Weather yesterday ON DATEDIFF(today.recordDate, yesterday.recordDate) = 1
WHERE today.temperature > yesterday.temperature;

-- How it works:
-- * WHERE looks at one row at a time, so it cannot compare a row with the previous day.
--   Joining the table to itself puts "today" and "yesterday" on the same row.
-- * Conceptually, JOIN pairs every row with every row, and ON keeps only the pairs
--   where the dates differ by exactly 1 day.
--
-- Pitfalls:
-- * Don't use `id - 1` for "yesterday". ids are not guaranteed to follow date order,
--   and dates can have gaps. Compare dates instead.
-- * DATEDIFF(a, b) = a - b in days, so argument order matters.
--   DATEDIFF(yesterday, today) = 1 would actually pair each day with "tomorrow".
