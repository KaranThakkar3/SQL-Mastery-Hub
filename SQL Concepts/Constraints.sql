-- Constraints
-- Explanation: Constraints enforce rules on the data, ensuring data integrity (e.g., PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK).
-- When to Use: Use constraints during table creation to enforce data rules, like ensuring unique employee IDs or validating age ranges.

-- Example:
CREATE TABLE departments (
  id INT PRIMARY KEY,
  department_name VARCHAR(50) NOT NULL UNIQUE
);

-- Output: Creates a departments table with constraints on the columns.
-- Practical Guide: Use constraints to maintain data consistency and prevent invalid data entries.
