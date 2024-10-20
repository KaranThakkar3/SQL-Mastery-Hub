-- Aggregating Data
-- Explanation: Aggregates perform calculations across multiple rows, summarizing data with functions like COUNT, SUM, AVG, MIN, and MAX.
-- When to Use: Ideal for generating summary statistics, such as counting the number of employees in each department, calculating total sales, or finding the average salary.

-- Example:
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- Output:
-- | department | total_employees |
-- |------------|-----------------|
-- | HR         | 10              |
-- | IT         | 25              |
-- Practical Guide: Use aggregations for dashboards, management reports, and any data summarization to identify trends and patterns.