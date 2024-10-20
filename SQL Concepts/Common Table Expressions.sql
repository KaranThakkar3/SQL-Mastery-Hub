-- Common Table Expressions (CTEs)
-- Explanation: CTEs provide temporary result sets, improving query readability and allowing recursion.
-- When to Use: Use CTEs for complex queries, self-joins, or hierarchical data processing.

-- Example:
WITH DepartmentCount AS (
  SELECT department, COUNT(*) AS total_employees
  FROM employees
  GROUP BY department
)
SELECT * FROM DepartmentCount WHERE total_employees > 10;

-- Output:
-- | department | total_employees |
-- |------------|-----------------|
-- | IT         | 25              |
-- Practical Guide: Use CTEs to break down complex queries or when the same subquery is reused multiple times.