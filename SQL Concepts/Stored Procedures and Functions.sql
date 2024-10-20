-- Stored Procedures and Functions
-- Explanation: Stored procedures execute a series of SQL statements, while functions return a single value. Both help automate tasks.
-- When to Use: Use stored procedures for batch processing or automating database tasks. Use functions for calculations or value-based checks.

-- Example (Stored Procedure):
CREATE PROCEDURE get_employee_by_id (IN emp_id INT)
BEGIN
  SELECT * FROM employees WHERE id = emp_id;
END;

-- Output: Creates a procedure to fetch an employee by ID.
-- Practical Guide: Use stored procedures to encapsulate complex operations, while functions are helpful for calculations within queries.