# Banking Management System & Transaction Analysis using MySQL and Excel

A relational database and reporting project that demonstrates how SQL can be used to manage banking customer records, accounts, and transactions, analyze transaction activity, and present results through Microsoft Excel.

This project combines MySQL database operations with SQL-based reporting, data-quality checks, and Excel visualizations to demonstrate practical database and entry-level data analytics skills.

## Project Overview

The system organizes banking data into related tables and demonstrates how SQL features support customer and account information retrieval, transaction tracking, balance reporting, and analytical reporting.

The project was extended with customer-level transaction analysis and an Excel workbook containing summary metrics and charts to make query results easier to interpret.

## Key Features

- **Customer Management:** Store and retrieve customer information.
- **Account Management:** Maintain account details and balances.
- **Transaction Records:** Record and analyze deposit and withdrawal transactions.
- **Views:** Use a customer balance view to combine customer and account information.
- **Stored Procedures:** Retrieve account balance information using a reusable procedure.
- **Indexes:** Create an index on transaction dates.
- **Triggers:** Demonstrate automatic balance updates after transaction inserts.
- **Transaction Analysis:** Calculate transaction counts and total transaction amounts using SQL aggregate functions.
- **Customer-Level Reporting:** Combine customer, account, and transaction data to generate customer-level analytical reports.
- **Data-Quality Checks:** Check transaction records for missing values, invalid amounts, and duplicate transaction identifiers.
- **Excel Summary:** Present customer-record counts, account counts, transaction counts, total transaction amounts, and average transaction amounts.
- **Excel Dashboard:** Use column charts to visualize transaction amounts and transaction counts for selected customer records.

## Technologies Used

- **Database:** MySQL
- **SQL Environment:** MySQL Workbench
- **Reporting and Visualization:** Microsoft Excel
- **SQL Concepts:** DDL, DML, joins, subqueries, aggregate functions, views, stored procedures, indexes, and triggers
- **Data Analysis:** Data validation, grouping, summarization, and reporting

## Database Structure

| Table / Object | Purpose |
|---|---|
| `customers` | Stores customer details |
| `accounts` | Stores account information and balances |
| `branches` | Stores bank branch details |
| `transactions` | Records deposit and withdrawal transactions |
| `customer_balance_view` | Displays customer names and account balances |
| `get_balance` | Stored procedure for retrieving an account balance |
| `idx_txn_date` | Index on the transaction date |
| `update_balance_trigger` | Trigger intended to update balances after transaction inserts |

## SQL Analysis and Reporting

### 1. Transaction Summaries

Used SQL aggregate functions and grouping to summarize transaction activity, including:

- Transaction counts and total amounts by transaction type.
- Daily transaction summaries using transaction dates.
- Customer-level transaction counts and total transaction amounts.

### 2. Customer-Level Analysis

Used joins and correlated subqueries to retrieve customer records with their associated account counts, transaction counts, and total transaction amounts.

The report uses customer IDs to distinguish individual customer records, even when customer names repeat in the sample dataset.

### 3. Data-Quality Validation

Created queries to check for:

- Missing or null transaction fields.
- Invalid transaction amounts.
- Duplicate transaction identifiers.

These checks help demonstrate basic validation techniques for improving reporting reliability. The duplicate-ID check validates identifier uniqueness; identifying potential duplicate financial transactions requires additional business rules.

## Excel Reporting and Dashboard

SQL query results were exported to CSV and opened in Microsoft Excel. The reporting workbook was then saved as an Excel workbook.

The workbook includes:

- **Summary sheet:** Displays customer-record counts, account counts, transaction counts, total transaction amount, and average transaction amount.
- **Dashboard sheet:** Presents the summary and charts for transaction amounts and transaction counts.
- **Formatted reporting:** Uses table formatting, borders, number formatting, conditional formatting, and chart titles to improve readability.

**Reporting scope:** The current charts use selected customer records rather than the complete dataset. They can be expanded to cover all records or replaced with aggregated views for broader analysis.

## How to Run

1. Install MySQL Server and MySQL Workbench.
2. Connect to your MySQL server.
3. Open `banking_management.sql` or the relevant SQL script included in the repository.
4. Select the database using `USE banking;`.
5. Execute the required table creation and setup statements if the database has not already been created.
6. Run the reporting queries after the required tables and sample data are available.
7. Export the desired query results to CSV using MySQL Workbench.
8. Open the CSV file in Microsoft Excel and save it as an `.xlsx` workbook.
9. Open the Excel workbook to explore the summary and dashboard.

**Important:** Review database setup and insert statements before rerunning them against an existing database to avoid duplicate records or object-creation errors.

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

- Practiced relational database querying and data retrieval.
- Applied joins, correlated subqueries, and aggregate functions to reporting problems.
- Worked with views, stored procedures, indexes, and triggers.
- Performed basic data-quality checks on transaction records.
- Developed customer-level reports from related database tables.
- Exported SQL results and created summary metrics and charts in Excel.
- Practiced presenting analytical results in a structured reporting format.

## Future Enhancements

- Expand charts to cover the complete dataset.
- Add monthly, branch-wise, and transaction-type analysis.
- Introduce stronger transaction validation and insufficient-balance checks.
- Improve error handling and transaction safety.
- Add reconciliation checks between transaction records and account balances.
- Automate report generation and refresh workflows.

## Author

**Chandana N**

MCA Graduate | Aspiring Data Analyst

GitHub: [21chandu-21](https://github.com/21chandu-21)

---

*This project was developed for SQL practice and portfolio demonstration using sample banking data. It is not connected to a real bank and is not a production banking application.*

