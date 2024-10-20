-- Filtering Data
-- Explanation: Filtering involves narrowing down query results using various operators (LIKE, IN, BETWEEN, AND, OR). This helps refine searches based on certain conditions.
-- When to Use: Useful when you need specific records, such as finding products within a price range, employees in a particular department, or customers whose names start with a certain letter.

-- Example:
SELECT name
FROM products
WHERE category = 'Electronics' AND price BETWEEN 100 AND 500;

-- Output:
-- | name                |
-- |---------------------|
-- | Wireless Earbuds    |
-- | Bluetooth Speaker   |

-- Practical Guide: Use filtering to limit data returned from large datasets, making queries more efficient and results more manageable.