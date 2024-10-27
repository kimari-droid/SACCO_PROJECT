-- DISPLAYING RECORS SHOWING TOTAL CONTRIBUTION PER MEMBER

SELECT 
    m.member_id,
    m.first_name,
    m.last_name,
    COALESCE(SUM(c.amount), 0) AS total_contributions
FROM 
    Members m
LEFT JOIN Contributions c ON m.member_id = c.member_id
GROUP BY 
    m.member_id, m.first_name, m.last_name
ORDER BY 
    total_contributions DESC;

-- DISPLAYING RECORDS OF TOTAL AND OUTSTANDING LOANS BY MEMBERS

SELECT 
    m.member_id,
    m.first_name,
    m.last_name,
    COALESCE(SUM(l.amount), 0) AS total_loan_disbursed,
    COALESCE(SUM(l.amount) - SUM(lr.amount), SUM(l.amount)) AS outstanding_loan_balance
FROM 
    Members m
LEFT JOIN Loans l ON m.member_id = l.member_id
LEFT JOIN Loan_Repayments lr ON l.loan_id = lr.loan_id
GROUP BY 
    m.member_id, m.first_name, m.last_name
ORDER BY 
    outstanding_loan_balance DESC;

-- DISPLAYING RECORDS OF AVERAGE LOAN REPAYMENT AMOUNTS

SELECT 
    l.loan_id,
    m.member_id,
    m.first_name,
    m.last_name,
    AVG(lr.amount) AS average_repayment_amount
FROM 
    Loans l
JOIN Members m ON l.member_id = m.member_id
JOIN Loan_Repayments lr ON l.loan_id = lr.loan_id
GROUP BY 
    l.loan_id, m.member_id, m.first_name, m.last_name
ORDER BY 
    average_repayment_amount DESC;

-- DISPLAYING RECORDS OFTRANSACTION SUMMARIES

SELECT 
    m.member_id,
    m.first_name,
    m.last_name,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(CASE WHEN t.type = 'Deposit' THEN t.amount ELSE 0 END) AS total_deposits,
    SUM(CASE WHEN t.type = 'Withdrawal' THEN t.amount ELSE 0 END) AS total_withdrawals,
    (SUM(CASE WHEN t.type = 'Deposit' THEN t.amount ELSE 0 END) -
     SUM(CASE WHEN t.type = 'Withdrawal' THEN t.amount ELSE 0 END)) AS net_balance_change
FROM 
    Members m
LEFT JOIN Accounts a ON m.member_id = a.member_id
LEFT JOIN Transactions t ON a.account_id = t.account_id
GROUP BY 
    m.member_id, m.first_name, m.last_name
ORDER BY 
    net_balance_change DESC;


