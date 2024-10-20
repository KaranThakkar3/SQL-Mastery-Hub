-- Joining Tables
-- Explanation: Joins combine data from multiple tables based on a related column. Types of joins include INNER JOIN (matches in both tables), LEFT JOIN (all rows from the left table and matched rows from the right), RIGHT JOIN, and FULL JOIN.
-- When to Use: Required when data is spread across multiple tables, like joining customer orders with customer details or employees with departments.

-- Example:
SELECT employees.name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.id;

-- Output:
-- | name       | department_name |
-- |------------|-----------------|
-- | John Smith | IT              |
-- | Alice Doe  | HR              |
-- Practical Guide: Use joins to combine datasets and form a complete view of the data, such as customer transactions including both order and payment details.