-- Subqueries
-- Explanation: Subqueries, or nested queries, are used inside another query. They can return a single value, a list, or a table. Correlated subqueries reference the outer query.
-- When to Use: Useful for complex filtering, such as finding records that meet certain conditions based on aggregated data.

-- Example:
SELECT name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Output:
-- | name       |
-- |------------|
-- | John Smith |
-- Practical Guide: Use subqueries for complex filters or when combining results from different sources, such as employees earning more than the company's average salary.