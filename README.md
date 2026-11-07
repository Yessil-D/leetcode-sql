# LeetCode SQL

My solutions to the [LeetCode SQL 50](https://leetcode.com/studyplan/top-sql-50/) study plan (MySQL), organized by topic.

Each file has the solution plus my notes on **how it works** and **common pitfalls**.

## Progress

| # | Problem | Difficulty | Topic | Key concepts |
|---|---|---|---|---|
| 1757 | [Recyclable and Low Fat Products](01-select-and-filter/1757-recyclable-and-low-fat-products.sql) | Easy | Select | `WHERE`, `AND` |
| 584 | [Find Customer Referee](01-select-and-filter/0584-find-customer-referee.sql) | Easy | Select | `IS NULL`, NULL comparison |
| 595 | [Big Countries](01-select-and-filter/0595-big-countries.sql) | Easy | Select | `OR` |
| 1148 | [Article Views I](01-select-and-filter/1148-article-views-i.sql) | Easy | Select | `DISTINCT`, alias, `ORDER BY` |
| 1683 | [Invalid Tweets](01-select-and-filter/1683-invalid-tweets.sql) | Easy | Select | `LENGTH` vs `CHAR_LENGTH` |
| 1378 | [Replace Employee ID With The Unique Identifier](02-joins/1378-replace-employee-id-with-the-unique-identifier.sql) | Easy | Joins | `LEFT JOIN`, aliases |
| 1581 | [Customer Who Visited but Did Not Make Any Transactions](02-joins/1581-customer-who-visited-but-did-not-make-any-transactions.sql) | Easy | Joins | anti-join, `GROUP BY`, `COUNT` |
| 197 | [Rising Temperature](02-joins/0197-rising-temperature.sql) | Easy | Joins | self join, `DATEDIFF` |
| 577 | [Employee Bonus](02-joins/0577-employee-bonus.sql) | Easy | Joins | `LEFT JOIN`, filter in `WHERE` vs `ON` |
| 1280 | [Students and Examinations](02-joins/1280-students-and-examinations.sql) | Easy | Joins | `CROSS JOIN`, `COUNT(col)` → 0 |
| 1661 | [Average Time of Process per Machine](02-joins/1661-average-time-of-process-per-machine.sql) | Easy | Joins | self join on 2 columns, `AVG`, `ROUND` |
| 570 | [Managers with at Least 5 Direct Reports](02-joins/0570-managers-with-at-least-5-direct-reports.sql) | Medium | Joins | `HAVING`, subquery with `IN` |
| 620 | [Not Boring Movies](03-aggregate-functions/0620-not-boring-movies.sql) | Easy | Aggregate | `%` for odd ids, `ORDER BY ... DESC` |

**Solved: 13 / 50**

## Key takeaways

- **NULL** can't be compared with `=` or `!=`. Use `IS NULL` / `IS NOT NULL`.
- **`COUNT(*)`** counts rows, while **`COUNT(col)`** skips NULLs.
- **"For each X"** in a question means `GROUP BY X`.
- **`LEFT JOIN ... WHERE right.key IS NULL`** finds rows with no match.
- **Self join** compares a row with another row of the same table.
- **`CROSS JOIN`** builds every combination. Pair it with `LEFT JOIN` + `COUNT(right.col)` to show 0 for missing data.
- **`WHERE`** filters rows before grouping; **`HAVING`** filters groups after `GROUP BY`.
- Write **subqueries** inside-out: test the inner query alone, then wrap it.
- With `LEFT JOIN`, filter results in **`WHERE`**. A condition in `ON` only controls matching.
- **`CHAR_LENGTH`** counts characters and **`LENGTH`** counts bytes in MySQL. This matters for Cyrillic and Chinese text.
