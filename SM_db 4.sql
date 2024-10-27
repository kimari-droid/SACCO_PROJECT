-- DISPLAYING QUERY TO SHOW RETRIVAL OF MEMBER INFORMATION, CONTRIBUTION AND LOAN

SELECT 
    m.member_id,
    m.first_name,
    m.last_name,
    c.total_contributions,
    l.total_loans,
    l.loan_count
FROM 
    Members m
LEFT JOIN (
    SELECT 
        member_id,
        SUM(amount) AS total_contributions
    FROM Contributions
    GROUP BY member_id
) c ON m.member_id = c.member_id
LEFT JOIN (
    SELECT 
        member_id,
        COUNT(loan_id) AS loan_count,
        SUM(amount) AS total_loans
    FROM Loans
    GROUP BY member_id
) l ON m.member_id = l.member_id
ORDER BY m.member_id;

-- DISPLAYING  USE JOINs TO SHOW RELATIONSHIPS BETWEEN MEMBERS, CONTRIBUTIONS, and LOANS

SELECT 
    m.member_id,
    m.first_name,
    m.last_name,
    c.contributions,
    l.loans
FROM 
    Members m
LEFT JOIN LATERAL (
    SELECT 
        JSON_AGG(JSON_BUILD_OBJECT('amount', c.amount, 'date', c.date)) AS contributions
    FROM Contributions c
    WHERE c.member_id = m.member_id
) c ON true
LEFT JOIN LATERAL (
    SELECT 
        JSON_AGG(JSON_BUILD_OBJECT('loan_id', l.loan_id, 'amount', l.amount, 'loan_start_date', l.loan_start_date, 'status', l.status)) AS loans
    FROM Loans l
    WHERE l.member_id = m.member_id
) l ON true
ORDER BY 
    m.member_id;

-- DISPLAYING TOTAL CONTRIBUTION BY EACH MEMBER

SELECT 
    m.member_id,
    m.first_name,
    m.last_name,
    SUM(c.amount) AS total_contributions
FROM 
    Members m
JOIN Contributions c ON m.member_id = c.member_id
GROUP BY 
    m.member_id, m.first_name, m.last_name
ORDER BY 
    total_contributions DESC;

-- DISPLAYING AVERAGE LOAN REPAYMENT AMOUNT
SELECT 
    l.loan_id,
    AVG(lr.amount) AS average_repayment_amount
FROM 
    Loans l
JOIN Loan_Repayments lr ON l.loan_id = lr.loan_id
GROUP BY 
    l.loan_id
ORDER BY 
    average_repayment_amount DESC;

-- DISPLAYING TOTAL LOANS DISBURSED AND OUTSTANDING BY MEMBERS

SELECT 
    m.member_id,
    m.first_name,
    m.last_name,
    SUM(l.amount) AS total_loan_disbursed,
    SUM(l.amount) - COALESCE(SUM(lr.amount), 0) AS outstanding_balance
FROM 
    Members m
LEFT JOIN Loans l ON m.member_id = l.member_id
LEFT JOIN Loan_Repayments lr ON l.loan_id = lr.loan_id
GROUP BY 
    m.member_id, m.first_name, m.last_name;

-- DISPALYING MEMBERS INFORMATION AND TOTAL CONTRIBUTION

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

-- DISPLAYING RECORDS OF MEMBERS WITH NUMBER OF LOANS TAKEN

SELECT 
    m.member_id,
    m.first_name,
    m.last_name,
    COUNT(l.loan_id) AS loan_count
FROM 
    Members m
LEFT JOIN Loans l ON m.member_id = l.member_id
GROUP BY 
    m.member_id, m.first_name, m.last_name
ORDER BY 
    loan_count DESC;

