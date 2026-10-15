# Banking Management System using MySQL

A relational database project that demonstrates how SQL can be used to manage banking customers, accounts, and financial transactions. This project showcases database design, data manipulation, reporting queries, and database objects using MySQL.

## Project Overview

The system organizes banking data into related tables and demonstrates how SQL features can support account information retrieval, transaction tracking, and customer balance reporting.

## Key Features

- **Customer Management:** Store and retrieve customer information.
- **Account Management:** Maintain account details and balances.
- **Transaction Records:** Record deposits and withdrawals.
- **Views:** Use a customer balance view to combine customer and account information.
- **Stored Procedures:** Retrieve account balance information using a reusable procedure.
- **Indexes:** Create an index on transaction dates to support query performance.
- **Triggers:** Demonstrate automatic balance updates for individual transactions.

## Technologies Used

- MySQL
- MySQL Workbench
- SQL (DDL, DML, joins, aggregate functions, views, stored procedures, indexes, and triggers)

## Database Structure

| Table / Object | Purpose |
|---|---|
| `customers` | Stores customer details |
| `accounts` | Stores account information and balances |
| `branches` | Stores bank branch details |
| `transactions` | Records deposits and withdrawals |
| `customer_balance_view` | Displays customer names and account balances |
| `get_balance` | Stored procedure for retrieving an account balance |
| `idx_txn_date` | Index on the transaction date |
| `update_balance_trigger` | Trigger intended to update balances after individual transaction inserts |

## How to Run

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench and connect to your MySQL server.
3. Open `banking_management.sql`.
4. Select the `banking` database using `USE banking;`.
5. Execute the required table creation and setup statements.
6. Run the verification queries below to inspect the database objects and results.

**Note:** The script contains database setup and sample-data statements. If objects or records already exist, review the script before rerunning setup or insert statements to avoid duplicate data.

## Sample Verification Queries

```sql
USE banking;

-- View customer records
SELECT * FROM customers LIMIT 10;

-- View account balances
SELECT account_id, customer_id, account_type, balance
FROM accounts
LIMIT 10;

-- View recent transactions
SELECT *
FROM transactions
ORDER BY transaction_date DESC
LIMIT 10;

-- View customer balances
SELECT * FROM customer_balance_view LIMIT 10;

-- Retrieve an account balance
CALL get_balance(1);

-- Verify transaction indexes
SHOW INDEX FROM transactions;

-- Verify triggers
SHOW TRIGGERS FROM banking;
```

## Learning Outcomes

- Practiced relational database design and SQL querying.
- Worked with views, stored procedures, indexes, and triggers.
- Explored joins and aggregate functions for reporting.
- Tested database objects and verified query results in MySQL Workbench.

## Future Enhancements

- Add transaction validation and insufficient-balance checks.
- Improve error handling and transaction safety.
- Add reporting queries for branch-wise and transaction-type analysis.
- Build a dashboard to visualize customer accounts and transaction trends.

## Author

**Chandana N**

GitHub: [21chandu-21](https://github.com/21chandu-21)

---

*This project was developed for SQL practice and portfolio demonstration using sample banking data. It is not a production banking application.*
