-- Sorting Data
-- Explanation: The ORDER BY clause arranges query results in ascending (ASC) or descending (DESC) order, based on one or more columns.
-- When to Use: Sorting is helpful when displaying data in an ordered manner, such as sorting employees by salary or arranging products by price.

-- Example:
SELECT name, salary
FROM employees
ORDER BY salary DESC;

-- Output:
-- | name       | salary |
-- |------------|--------|
-- | John Smith | 70000  |
-- | Alice Doe  | 55000  |
-- Practical Guide: Use sorting to make data presentation clearer, especially in reports or dashboards where order matters (e.g., top 10 highest-paid employees).