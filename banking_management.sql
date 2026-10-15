USE banking;

INSERT INTO customers (name,email,phone,city) VALUES
('Cust1','c1@gmail.com','9000000001','Bangalore'),
('Cust2','c2@gmail.com','9000000002','Mysore'),
('Cust3','c3@gmail.com','9000000003','Delhi'),
('Cust4','c4@gmail.com','9000000004','Chennai'),
('Cust5','c5@gmail.com','9000000005','Mumbai'),
('Cust6','c6@gmail.com','9000000006','Bangalore'),
('Cust7','c7@gmail.com','9000000007','Mysore'),
('Cust8','c8@gmail.com','9000000008','Delhi'),
('Cust9','c9@gmail.com','9000000009','Chennai'),
('Cust10','c10@gmail.com','9000000010','Mumbai'),
('Cust11','c11@gmail.com','9000000011','Bangalore'),
('Cust12','c12@gmail.com','9000000012','Mysore'),
('Cust13','c13@gmail.com','9000000013','Delhi'),
('Cust14','c14@gmail.com','9000000014','Chennai'),
('Cust15','c15@gmail.com','9000000015','Mumbai'),
('Cust16','c16@gmail.com','9000000016','Bangalore'),
('Cust17','c17@gmail.com','9000000017','Mysore'),
('Cust18','c18@gmail.com','9000000018','Delhi'),
('Cust19','c19@gmail.com','9000000019','Chennai'),
('Cust20','c20@gmail.com','9000000020','Mumbai'),
('Cust21','c21@gmail.com','9000000021','Bangalore'),
('Cust22','c22@gmail.com','9000000022','Mysore'),
('Cust23','c23@gmail.com','9000000023','Delhi'),
('Cust24','c24@gmail.com','9000000024','Chennai'),
('Cust25','c25@gmail.com','9000000025','Mumbai'),
('Cust26','c26@gmail.com','9000000026','Bangalore'),
('Cust27','c27@gmail.com','9000000027','Mysore'),
('Cust28','c28@gmail.com','9000000028','Delhi'),
('Cust29','c29@gmail.com','9000000029','Chennai'),
('Cust30','c30@gmail.com','9000000030','Mumbai'),
('Cust31','c31@gmail.com','9000000031','Bangalore'),
('Cust32','c32@gmail.com','9000000032','Mysore'),
('Cust33','c33@gmail.com','9000000033','Delhi'),
('Cust34','c34@gmail.com','9000000034','Chennai'),
('Cust35','c35@gmail.com','9000000035','Mumbai'),
('Cust36','c36@gmail.com','9000000036','Bangalore'),
('Cust37','c37@gmail.com','9000000037','Mysore'),
('Cust38','c38@gmail.com','9000000038','Delhi'),
('Cust39','c39@gmail.com','9000000039','Chennai'),
('Cust40','c40@gmail.com','9000000040','Mumbai'),
('Cust41','c41@gmail.com','9000000041','Bangalore'),
('Cust42','c42@gmail.com','9000000042','Mysore'),
('Cust43','c43@gmail.com','9000000043','Delhi'),
('Cust44','c44@gmail.com','9000040044','Chennai'),
('Cust45','c45@gmail.com','9000050045','Mumbai'),
('Cust46','c46@gmail.com','9000800046','Bangalore'),
('Cust47','c47@gmail.com','9000500047','Mysore'),
('Cust48','c48@gmail.com','9000050048','Delhi'),
('Cust49','c49@gmail.com','9000000049','Chennai'),
('Cust50','c50@gmail.com','9000000050','Mumbai');

INSERT INTO accounts (customer_id, branch_id, account_type, balance)
SELECT customer_id, (customer_id % 5)+1,
IF(customer_id % 2=0,'Savings','Current'),
1000 + (customer_id*100)
FROM customers;

INSERT INTO transactions (account_id, transaction_type, amount)
SELECT account_id,
IF(account_id % 2=0,'Deposit','Withdraw'),
500 + (account_id*50)
FROM accounts;

CREATE VIEW customer_balance_view AS
SELECT c.name, a.balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id;

CREATE INDEX idx_txn_date ON transactions(transaction_date);

DELIMITER //

CREATE PROCEDURE get_balance(IN acc_id INT)
BEGIN
    SELECT balance FROM accounts WHERE account_id = acc_id;
END //

DELIMITER ;


INSERT INTO transactions (account_id, transaction_type, amount)
VALUES (1,'Deposit',1000);

SELECT * FROM accounts WHERE account_id = 1;

SELECT * FROM customers;
SELECT * FROM accounts;
SELECT * FROM transactions;
SELECT * FROM customer_balance_view;

