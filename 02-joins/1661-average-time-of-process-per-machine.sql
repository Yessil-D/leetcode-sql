-- 1661. Average Time of Process per Machine (Easy)
-- https://leetcode.com/problems/average-time-of-process-per-machine/
-- Concepts: self join on two columns, AVG, ROUND, GROUP BY

SELECT s.machine_id, ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM Activity s
JOIN Activity e
  ON s.machine_id = e.machine_id
 AND s.process_id = e.process_id
WHERE s.activity_type = 'start' AND e.activity_type = 'end'
GROUP BY s.machine_id;

-- How it works:
-- 1. Self join: one copy of the table plays "start" (s), the other plays "end" (e).
--    Matching on machine_id AND process_id pairs rows of the same process.
-- 2. WHERE keeps only the (start, end) pair, so each process gives one row
--    with both timestamps side by side.
-- 3. end - start = time of one process; AVG per machine, rounded to 3 decimals.
--
-- Pitfall: without the WHERE filter, start-start, end-end and end-start pairs
-- sneak in (differences of 0 and negative numbers). The query still runs,
-- but the average is silently wrong.
-- Tip: name the aliases after their role (s = start, e = end) to avoid mixing them up.
