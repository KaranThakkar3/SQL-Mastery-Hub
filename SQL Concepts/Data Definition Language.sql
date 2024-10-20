-- Data Definition Language (DDL)
-- Explanation: DDL commands (CREATE, ALTER, DROP) define or alter the structure of database objects, like tables, indexes, or views.
-- When to Use: Use DDL when setting up a new database, modifying schema design, or restructuring existing tables.

-- Example:
CREATE TABLE employees (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  department_id INT
);

-- Output: Creates a new employees table in the database.
-- Practical Guide: Use DDL for initial database setup or making structural changes (e.g., adding columns or changing data types).