-- Grouping Data
-- Explanation: GROUP BY organizes query results into groups with shared values, allowing aggregate functions to operate on each group separately. The HAVING clause filters these groups.
-- When to Use: Useful for calculations on subsets of data, such as finding the total salary expense per department or identifying departments with more than a certain number of employees.

-- Example:
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 50000;

-- Output:
-- | department | total_salary |
-- |------------|--------------|
-- | IT         | 150000       |
-- | HR         | 60000        |
-- Practical Guide: Use grouping to perform segment-specific analyses, such as finding high-revenue regions or teams exceeding budgeted costs.