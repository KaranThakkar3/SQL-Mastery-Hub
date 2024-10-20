-- Views
-- Explanation: Views are virtual tables based on the result of a SQL query. They provide a simplified representation of complex queries.
-- When to Use: Use views for security (restricting access to certain columns) or to simplify complex queries used frequently.

-- Example:
CREATE VIEW high_salary_employees AS
SELECT name, salary
FROM employees
WHERE salary > 50000;

-- Output: Creates a view named high_salary_employees.
-- Practical Guide: Use views for reusable queries, data abstraction, or to grant specific data access to users.