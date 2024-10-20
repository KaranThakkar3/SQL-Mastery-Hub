-- Regexp Functions
-- Explanation: Regular expression functions allow pattern matching in strings. These functions are used to search for, extract, or replace parts of a string based on specific patterns.
-- Common Functions:
-- REGEXP_LIKE: Checks if a string matches a regular expression.
-- REGEXP_REPLACE: Replaces parts of a string that match a pattern.
-- REGEXP_SUBSTR: Extracts a substring that matches a regular expression pattern.
-- When to Use: Regexp functions are useful for data validation, text search, data cleaning, and formatting tasks, such as validating email addresses, extracting phone numbers, or finding keywords.

-- Example:
SELECT name
FROM employees
WHERE name REGEXP '^J.*';

-- Explanation: This query retrieves all employee names that start with the letter 'J'.

-- Output:
-- | name       |
-- |------------|
-- | John Smith |
-- | Jane Doe   |
-- Practical Guide: Use regexp functions when working with text data that requires pattern matching, such as cleaning up inconsistent data or validating user input.