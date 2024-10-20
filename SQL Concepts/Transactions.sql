-- Transactions
-- Explanation: Transactions group multiple SQL operations, ensuring data integrity. They can be rolled back if any part fails.
-- When to Use: Use transactions for operations that involve multiple steps, such as transferring funds between accounts.

-- Example:
BEGIN;
  UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
  UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;
COMMIT;

-- Output: Transfers funds between accounts, ensuring either all steps succeed or none.
-- Practical Guide: Use transactions to maintain data consistency during multi-step operations.