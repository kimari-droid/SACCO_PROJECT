CREATE TABLE Members (
    member_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    phone_number VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    address TEXT
);

CREATE TABLE Accounts (
    account_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES Members(member_id),
    account_type VARCHAR(20) CHECK (account_type IN ('Savings', 'Current')),
    balance DECIMAL(15, 2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Contributions (
    contribution_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES Members(member_id),
    amount DECIMAL(15, 2) NOT NULL,
    date DATE DEFAULT CURRENT_DATE,
    payment_method VARCHAR(20) CHECK (payment_method IN ('Cash', 'Bank Transfer', 'Mobile Payment'))
);

CREATE TABLE Loans (
    loan_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES Members(member_id),
    amount DECIMAL(15, 2) NOT NULL,
    interest_rate DECIMAL(5, 2),
    loan_start_date DATE NOT NULL,
    loan_end_date DATE,
    status VARCHAR(20) CHECK (status IN ('Active', 'Repaid', 'Defaulted'))
);

CREATE TABLE Loan_Repayments (
    repayment_id SERIAL PRIMARY KEY,
    loan_id INT REFERENCES Loans(loan_id),
    amount DECIMAL(15, 2) NOT NULL,
    date DATE DEFAULT CURRENT_DATE,
    payment_method VARCHAR(20) CHECK (payment_method IN ('Cash', 'Bank Transfer', 'Mobile Payment'))
);

CREATE TABLE Transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_id INT REFERENCES Accounts(account_id),
    type VARCHAR(20) CHECK (type IN ('Deposit', 'Withdrawal')),
    amount DECIMAL(15, 2) NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
