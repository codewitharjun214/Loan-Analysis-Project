CREATE DATABASE loan_project;
USE loan_project;

-- Lets Start Checking the Dataset 

SELECT * FROM cleaned_loan_data LIMIT 5;

-- Dataset is loaded successfully now lets perform some questions on data.

-- 1. Loan Approval Count

SELECT Loan_Status, COUNT(*) AS total
FROM cleaned_loan_data
GROUP BY Loan_Status;

-- 2. Approval Rate (%)

SELECT 
  (SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS approval_rate
FROM cleaned_loan_data;

-- 3. Gender-wise Approval

SELECT Gender, Loan_Status, COUNT(*) AS total
FROM cleaned_loan_data
GROUP BY Gender, Loan_Status;

-- 4. Income vs Loan Approval

SELECT 
  CASE 
    WHEN ApplicantIncome < 3000 THEN 'Low'
    WHEN ApplicantIncome BETWEEN 3000 AND 6000 THEN 'Medium'
    ELSE 'High'
  END AS income_group,
  Loan_Status,
  COUNT(*) AS total
FROM cleaned_loan_data
GROUP BY income_group, Loan_Status;

-- 5. Credit History Impact

SELECT Credit_History, Loan_Status, COUNT(*) AS total
FROM cleaned_loan_data
GROUP BY Credit_History, Loan_Status;

-- 6. Property Area Analysis

SELECT Property_Area, Loan_Status, COUNT(*) AS total
FROM cleaned_loan_data
GROUP BY Property_Area, Loan_Status;

-- 7. Average Loan Amount by Education

SELECT Education, AVG(LoanAmount) AS avg_loan
FROM cleaned_loan_data
GROUP BY Education;

-- 8. Top 5 High Income Applicants

SELECT Loan_ID, ApplicantIncome
FROM cleaned_loan_data
ORDER BY ApplicantIncome DESC
LIMIT 5;

-- 9. Married vs Unmarried Approval

SELECT Married, Loan_Status, COUNT(*) AS total
FROM cleaned_loan_data
GROUP BY Married, Loan_Status;

-- 10. High Risk Applicants

SELECT *
FROM cleaned_loan_data
WHERE Loan_Status = 'N' AND Credit_History = 0;