-- Null Handling Using COALESCE
-- Explanation: COALESCE returns the first non-null value from a list of expressions. It is useful for handling null values in databases, which represent missing or unknown data.
-- When to Use: Use COALESCE to provide default values for columns, avoid null-related issues in calculations, or replace nulls with more meaningful data.

-- Example:
SELECT name, COALESCE(phone_number, 'N/A') AS contact_number
FROM employees;

-- Explanation: This query retrieves employee names and their phone numbers, displaying "N/A" for those without a phone number.

-- Output:
-- | name       | contact_number |
-- |------------|----------------|
-- | John Smith | 123-456-7890   |
-- | Jane Doe   | N/A            |
-- Practical Guide: Use COALESCE for data display where null values need to be substituted with default messages, or when performing operations that should not involve null values, such as mathematical calculations.