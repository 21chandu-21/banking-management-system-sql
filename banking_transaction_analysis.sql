USE banking;

-- 1. Daily transaction summary
SELECT
    DATE(transaction_date) AS transaction_day,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_transaction_amount
FROM transactions
GROUP BY DATE(transaction_date)
ORDER BY transaction_day;

-- 2. Transaction summary by type
SELECT
    transaction_type,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_transaction_amount
FROM transactions
GROUP BY transaction_type;

-- 3. Check for duplicate transaction IDs
SELECT
    transaction_id,
    COUNT(*) AS occurrences
FROM transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;

-- 4. Check for missing or invalid transaction values
SELECT *
FROM transactions
WHERE account_id IS NULL
   OR transaction_type IS NULL
   OR amount IS NULL
   OR amount <= 0
   OR transaction_date IS NULL;

-- 5. Customer-level account and transaction analysis
SELECT
    c.customer_id,
    c.name AS customer_name,
    (SELECT COUNT(*)
     FROM accounts a
     WHERE a.customer_id = c.customer_id) AS total_accounts,
    (SELECT COUNT(*)
     FROM accounts a
     JOIN transactions t ON a.account_id = t.account_id
     WHERE a.customer_id = c.customer_id) AS total_transactions,
    (SELECT COALESCE(SUM(t.amount), 0)
     FROM accounts a
     JOIN transactions t ON a.account_id = t.account_id
     WHERE a.customer_id = c.customer_id) AS total_transaction_amount
FROM customers c
ORDER BY total_transaction_amount DESC;
