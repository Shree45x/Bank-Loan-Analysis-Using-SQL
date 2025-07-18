--BANK LOAN ANALYSIS USING SQL

SELECT*FROM bank_loan_data;
--Calculating Total Loan Applications
SELECT COUNT(id)as Total_loan_Application from bank_loan_data

--Calculating Month to Date Total Loan Applications 
SELECT COUNT(id)as MTD_Total_loan_Application from bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021

--Calculating Previous Month to date total Loan Applications
SELECT COUNT(id)as PMTM_Total_loan_Application from bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021

--Calculating Total Funded Amount
SELECT SUM(loan_amount) as Total_Funded_amount from bank_loan_data

--Calculating Month to Date Total Funded Amount
SELECT SUM(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021

--Calculating Previous Month to Date Total Funded Amount
SELECT SUM(loan_amount) as PMTD_Total_Funded_Amount from bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021

--Calculating Total Amount Received
SELECT SUM(total_payment) as Total_amount_Received from bank_loan_data

--Calculating Month to Date Total Amount Received
SELECT SUM(total_payment) as MTD_Total_Amount_Received from bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021

--Calculating previous Month to Date Total Amount Received
SELECT SUM(total_payment) as PMTD_Total_Amount_Received from bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021


--Calculating Average Interest Rate
SELECT AVG(int_rate)*100 as Avg_Interest_Rate from bank_loan_data

--Calculating Month to Date Average Interest Rate 
SELECT AVG(int_rate)*100 as MTD_Avg_Interest_Rate from bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021

--Calculating Previous Month to Date Average Interest Rate
SELECT AVG(int_rate)*100 as PMTD_Avg_Interest_Rate from bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021

--Calculating Month to Date Avg DTI
SELECT ROUND(AVG(dti),4)*100 as MTD_Avg_DTI from bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021

--Calculating PMonth to Date Avg DTI
SELECT ROUND(AVG(dti),4)*100 as PMTD_Avg_DTI from bank_loan_data
WHERE MONTH(issue_date)=10 AND YEAR(issue_date)=2021


--Good LOAN Vs Bad LOAN

SELECT Loan_status from bank_loan_data

--Good Loan
--Total Good loan Applications Percentage 
SELECT
      (COUNT(case when loan_status = 'Fully Paid' OR loan_status='current' then id end)*100)
      /
      COUNT(id) as Good_loan_Percentage from bank_loan_data

--Calculating Total Good Applications 
SELECT COUNT(id) as Total_Good_Applications from bank_loan_data
WHERE loan_status='FULLY PAID' OR loan_status='current'

--Calculating Total Good loan Funded Amount
SELECT SUM(LOAN_AMOUNT) as Total_Goodloan_Funded_Amount from bank_loan_data
WHERE loan_status='FULLY PAID' OR loan_status='current'

--Calculating Total Good loan Received Amount
SELECT SUM(total_payment) as Total_Goodloan_Received_Amount from bank_loan_data
WHERE loan_status='FULLY PAID' OR loan_status='current'

--For Bad Loan
--Total Bad loan Applications Percentage 
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data

--Calculating Total Bad Applications 
SELECT COUNT(id) AS Bad_Loan_Applications From bank_loan_data
WHERE loan_status = 'Charged Off'

--Calculating Total Bad loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount From bank_loan_data
WHERE loan_status = 'Charged Off'

--Calculating Total Bad loan Received Amount
SELECT SUM(total_payment) AS Bad_Loan_amount_received from bank_loan_data
WHERE loan_status = 'Charged Off'


--Loan_Status Report

 SELECT
        loan_status, 
        COUNT(id) as Total_Loan_Applications,
        SUM(loan_amount) as Total_Funded_Amount,
        SUM(total_payment) as Total_Received_Amount,
        AVG(int_rate*100) as Avg_Int_rate,
        AVG(dti*100) as Avg_DTI from bank_loan_data
 GROUP BY loan_status

--Loan Report basis on Month to Date
 SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

--Overview
--Bank Loan Report on Month basis
SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received,
    ROUND(AVG(int_rate),4)*100 as Avg_Int_rate,
    ROUND (AVG(dti),2)*100 as Avg_DTI 
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

--Bank Loan Report on State basis
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state

--Bank Loan Report on term basis
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term


--Bank Loan Report on Employee Lenght basis
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length


--Bank Loan Report based on purpose
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose

--Bank Loan Report based on Home_OwnerShip
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership





        
  
