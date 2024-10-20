-- JSON Handling in SQL
-- Explanation: JSON support in databases allows querying semi-structured data directly.
-- When to Use: Useful when dealing with JSON data types (e.g., in web applications) without having to preprocess the data.

-- Example:
SELECT json_data->>'name' AS employee_name
FROM employee_records
WHERE json_data->>'position' = 'Manager';

-- Output:
-- | employee_name |
-- |---------------|
-- | John Smith    |
-- Practical Guide: Use JSON functions for querying data stored in JSON format without normalizing it into a tabular structure.