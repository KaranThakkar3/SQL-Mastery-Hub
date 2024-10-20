-- Order of Execution of SQL Statements
-- Explanation: Understanding the order of execution in SQL is essential for writing correct and efficient queries. SQL statements are executed in the following order:
-- FROM: Determines the source tables for the query and joins multiple tables if specified.
-- WHERE: Filters rows based on specified conditions.
-- GROUP BY: Groups rows sharing a common attribute.
-- HAVING: Filters groups based on a condition.
-- SELECT: Retrieves the columns specified.
-- DISTINCT: Removes duplicate rows from the result set.
-- ORDER BY: Sorts the result set in ascending or descending order.
-- LIMIT: Restricts the number of rows returned.
-- When to Use: Knowing the order of execution helps optimize complex queries and understand the impact of each clause.

-- Example:
SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE age > 30
GROUP BY department
HAVING AVG(salary) > 50000
ORDER BY avg_salary DESC;

-- Execution Steps:
-- The FROM clause identifies the employees table as the data source.
-- The WHERE clause filters employees with an age greater than 30.
-- The GROUP BY clause groups the remaining rows by department.
-- The HAVING clause filters out departments where the average salary is below 50,000.
-- The SELECT clause retrieves the department and average salary.
-- The ORDER BY clause sorts the results in descending order based on average salary.
