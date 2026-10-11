-- 1757. Recyclable and Low Fat Products (Easy)
-- https://leetcode.com/problems/recyclable-and-low-fat-products/
-- Concepts: SELECT, WHERE, AND

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';

-- Notes:
-- * 'Y' is a string, so it needs quotes. Without them, Y is read as a column name.
-- * SQL compares with a single "=", not "==".
-- * AND keeps a row only when both conditions are true. OR would keep it if either one is true.
