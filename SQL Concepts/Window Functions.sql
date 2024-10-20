-- Window Functions
-- Explanation: Window functions perform calculations over a range of table rows, providing a different result for each row.
-- When to Use: Ideal for tasks like ranking, running totals, or moving averages.

-- Example:
SELECT name, salary, RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- Output:
-- | name       | salary | salary_rank |
-- |------------|--------|-------------|
-- | John Smith | 70000  | 1           |
-- | Alice Doe  | 55000  | 2           |
-- Practical Guide: Use window functions for complex analytics without grouping results (e.g., top-N analyses).