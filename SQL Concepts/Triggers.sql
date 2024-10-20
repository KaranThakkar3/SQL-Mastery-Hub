-- Triggers
-- Explanation: Triggers automatically execute SQL statements in response to certain events (e.g., insert, update, delete).
-- When to Use: Useful for enforcing business rules or keeping audit trails.

-- Example:
CREATE TRIGGER update_employee_age
BEFORE UPDATE ON employees
FOR EACH ROW
SET NEW.age = NEW.age + 1;

-- Output: Automatically updates age before an update operation.
-- Practical Guide: Use triggers for automation, such as updating logs or calculating fields.