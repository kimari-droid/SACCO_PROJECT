INSERT INTO Members (first_name, last_name, date_of_birth, phone_number, email, address) VALUES
('Joseph', 'Duma', '1985-04-12', '0723967839', 'joseph.duma@gmail.com', '123 Port Street'),
('Japheth', 'Sugoi', '1990-06-23', '0724567892', 'japeth.sugoi@gmail.com', '456 Oak Avenue'),
('Alicia', 'Brown', '1982-11-30', '0786753412', 'alicia.brown@gmail.com', '789 Pantha Road'),
('Bob', 'Jalango', '1979-08-15', '0765109283', 'bob.jalango@gmail.com', '101 Mutuma Lane'),
('Charlie', 'Wilson', '1992-03-07', '0756421784', 'charlie.wilson@gmail.com', '202 Briana Blvd'),
('Eva', 'Garcia', '1988-12-22', '0750753910', 'eva.garcia@gmail.com', '303 Cench Way'),
('Daudi', 'Macharia', '1975-10-19', '0747653894', 'daudi.macharia@gmail.com', '404 Redtaper St'),
('Sophia', 'Luchusia', '1991-02-18', '0702003299', 'sophia.luchusia@gmail.com', '505 Spruce Ave'),
('Liam', 'Taylor', '1987-09-09', '0725338805', 'liam.taylor@gmail.com', '606 Pikko Court'),
('Olivia', 'Ambani', '1993-07-25', '0797101507', 'olivia.ambani@gmail.com', '707 Wahala Terrace');

INSERT INTO Accounts (member_id, account_type, balance) VALUES
(1, 'Savings', 1986.50),
(2, 'Current', 345.75),
(3, 'Savings', 5673.00),
(4, 'Savings', 7820.00),
(5, 'Current', 765.25),
(6, 'Savings', 7215.00),
(7, 'Savings', 1900.00),
(8, 'Current', 900.00),
(9, 'Savings', 728.00),
(10, 'Current', 1890.00),
(1, 'Current', 854.00),
(2, 'Savings', 2567.00),
(3, 'Current', 1976.00);

INSERT INTO Contributions (member_id, amount, date, payment_method) VALUES
(1, 189.00, '2024-01-10', 'Cash'),
(2, 160.00, '2024-01-12', 'Bank Transfer'),
(3, 276.00, '2024-01-15', 'Mobile Payment'),
(4, 290.00, '2024-01-20', 'Cash'),
(5, 375.00, '2024-01-25', 'Bank Transfer'),
(6, 343.00, '2024-02-01', 'Mobile Payment'),
(7, 485.00, '2024-02-05', 'Cash'),
(8, 650.00, '2024-02-10', 'Bank Transfer'),
(9, 550.00, '2024-02-15', 'Mobile Payment'),
(10, 568.00, '2024-02-20', 'Cash'),
(1, 209.00, '2024-02-25', 'Bank Transfer'),
(2, 383.00, '2024-03-01', 'Mobile Payment');

INSERT INTO Loans (member_id, amount, interest_rate, loan_start_date, loan_end_date, status) VALUES
(1, 5456.00, 5.5, '2024-01-01', '2025-01-01', 'Active'),
(2, 3987.00, 6.0, '2024-02-01', '2025-02-01', 'Active'),
(3, 4765.00, 5.0, '2024-03-01', '2025-03-01', 'Active'),
(4, 3554.00, 4.5, '2024-04-01', '2025-04-01', 'Repaid'),
(5, 4532.00, 5.5, '2024-05-01', '2025-05-01', 'Active'),
(6, 2512.00, 6.0, '2024-06-01', '2025-06-01', 'Active'),
(7, 1583.00, 4.5, '2024-07-01', '2025-07-01', 'Defaulted'),
(8, 2430.00, 5.0, '2024-08-01', '2025-08-01', 'Active'),
(9, 3000.00, 5.5, '2024-09-01', '2025-09-01', 'Repaid'),
(10, 3500.00, 6.0, '2024-10-01', '2025-10-01', 'Active');

INSERT INTO Loan_Repayments (loan_id, amount, date, payment_method) VALUES
(1, 500.00, '2024-02-01', 'Cash'),
(2, 300.00, '2024-03-01', 'Bank Transfer'),
(3, 400.00, '2024-04-01', 'Mobile Payment'),
(4, 350.00, '2024-05-01', 'Cash'),
(5, 450.00, '2024-06-01', 'Bank Transfer'),
(6, 250.00, '2024-07-01', 'Mobile Payment'),
(7, 150.00, '2024-08-01', 'Cash'),
(8, 200.00, '2024-09-01', 'Bank Transfer'),
(9, 300.00, '2024-10-01', 'Mobile Payment'),
(10, 350.00, '2024-11-01', 'Cash');

INSERT INTO Transactions (account_id, type, amount, date) VALUES
(1, 'Deposit', 200.00, '2024-01-05'),
(2, 'Withdrawal', 100.00, '2024-01-15'),
(3, 'Deposit', 150.00, '2024-01-25'),
(4, 'Withdrawal', 200.00, '2024-02-05'),
(5, 'Deposit', 300.00, '2024-02-15'),
(6, 'Withdrawal', 150.00, '2024-02-25'),
(7, 'Deposit', 400.00, '2024-03-05'),
(8, 'Withdrawal', 250.00, '2024-03-15'),
(9, 'Deposit', 500.00, '2024-03-25'),
(10, 'Withdrawal', 200.00, '2024-04-05'),
(1, 'Deposit', 100.00, '2024-04-15'),
(2, 'Withdrawal', 150.00, '2024-04-25');
