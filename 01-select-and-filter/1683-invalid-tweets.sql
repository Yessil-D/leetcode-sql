-- 1683. Invalid Tweets (Easy)
-- https://leetcode.com/problems/invalid-tweets/
-- Concepts: string functions in WHERE

SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;

-- Pitfall: LENGTH vs CHAR_LENGTH (MySQL)
-- * LENGTH()      counts BYTES
-- * CHAR_LENGTH() counts CHARACTERS
--   LENGTH('Привет') = 12, CHAR_LENGTH('Привет') = 6
--   LENGTH('你好')   = 6,  CHAR_LENGTH('你好')   = 2
-- * This problem only has ASCII characters, so both pass. The question asks for
--   "number of characters", though, so CHAR_LENGTH is the correct choice for real data
--   (e.g. Russian / Kazakh / Chinese text):
--
--   WHERE CHAR_LENGTH(content) > 15;
--
-- * In PostgreSQL, LENGTH() already counts characters.
