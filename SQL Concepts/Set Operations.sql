-- Set Operations
-- Explanation: SQL set operations (UNION, INTERSECT, EXCEPT) combine results from multiple queries. UNION merges distinct results, INTERSECT finds common rows, and EXCEPT subtracts rows.
-- When to Use: Ideal for merging similar data from different tables or filtering common records across multiple datasets.

-- Example:
SELECT name FROM employees
WHERE department = 'Engineering'
UNION
SELECT name FROM contractors
WHERE department = 'Engineering';

-- Output:
-- | name       |
-- |------------|
-- | John Smith |
-- | Jane Doe   |
-- Practical Guide: Use set operations for merging data sources or performing comparisons, such as finding overlapping or unique records.