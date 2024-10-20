-- Indexes
-- Explanation: Indexes speed up data retrieval by creating a data structure that references specific columns.
-- When to Use: Use indexes on frequently queried columns to improve query performance, especially in large datasets.

-- Example:
CREATE INDEX idx_employee_name ON employees(name);

-- Output: Creates an index on the name column to speed up searches.
-- Practical Guide: Use indexes for columns that appear often in WHERE clauses or join conditions to optimize query performance.