-- =====================================================================
-- Telco Customer Churn — SQL Validation & Business Analysis
-- =====================================================================
-- Data loaded via MySQL Workbench's Table Data Import Wizard:
--   Schemas -> telco_project -> Tables -> right-click telco_churn
--   -> Table Data Import Wizard -> select telco_churn_cleaned.csv
--   -> import into this existing table.
--
-- Tenure Group boundaries match the Tableau dashboard's calculated field
-- exactly (tenure <= 12 / <= 24 / <= 48 / else), so both artifacts agree
-- on every number.
-- =====================================================================

CREATE DATABASE IF NOT EXISTS telco_project;
USE telco_project;

DROP TABLE IF EXISTS telco_churn;

CREATE TABLE telco_churn (
    customerID        VARCHAR(20) PRIMARY KEY,
    gender             VARCHAR(10),
    SeniorCitizen      INT,
    Partner            VARCHAR(10),
    Dependents         VARCHAR(10),
    tenure             INT,
    PhoneService       VARCHAR(20),
    MultipleLines      VARCHAR(30),
    InternetService    VARCHAR(30),
    OnlineSecurity     VARCHAR(30),
    OnlineBackup       VARCHAR(30),
    DeviceProtection   VARCHAR(30),
    TechSupport        VARCHAR(30),
    StreamingTV        VARCHAR(30),
    StreamingMovies    VARCHAR(30),
    Contract           VARCHAR(30),
    PaperlessBilling   VARCHAR(10),
    PaymentMethod      VARCHAR(50),
    MonthlyCharges     DECIMAL(10,2),
    TotalCharges       DECIMAL(10,2),
    Churn              VARCHAR(10)
);

-- After this: use the Table Data Import Wizard (see header note above) to
-- load telco_churn_cleaned.csv into this table before running anything below.

-- =====================================================================
-- 0. Data validation — run this first, every time, after reloading
-- =====================================================================

-- Expect 7043
SELECT COUNT(*) AS Row_Count FROM telco_churn;

-- Expect 0 duplicate customerIDs (PRIMARY KEY should already enforce this on load)
SELECT customerID, COUNT(*) AS cnt
FROM telco_churn
GROUP BY customerID
HAVING COUNT(*) > 1;

-- Expect 0 — TotalCharges was cleaned/filled in Python, should have no blanks or negatives
SELECT COUNT(*) AS Invalid_TotalCharges
FROM telco_churn
WHERE TotalCharges < 0;

SELECT * FROM telco_churn LIMIT 5;

-- =====================================================================
-- 1. Total customers and overall churn rate
-- =====================================================================

SELECT
    Churn,
    COUNT(*) AS Total_Customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM telco_churn), 2) AS Percentage
FROM telco_churn
GROUP BY Churn;

-- =====================================================================
-- 2. Churn rate by contract type
-- =====================================================================

SELECT
    Contract,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percentage
FROM telco_churn
GROUP BY Contract
ORDER BY Churn_Rate_Percentage DESC;

-- =====================================================================
-- 3. Churn rate by payment method
-- =====================================================================

SELECT
    PaymentMethod,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM telco_churn
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;

-- =====================================================================
-- 4. Churn rate by internet service type
-- =====================================================================

SELECT
    InternetService,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM telco_churn
GROUP BY InternetService
ORDER BY Churn_Rate DESC;

-- =====================================================================
-- 5. Average monthly charges by churn
-- =====================================================================

SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS Avg_Monthly_Charges
FROM telco_churn
GROUP BY Churn;

-- =====================================================================
-- 6. Average tenure by churn
-- =====================================================================

SELECT
    Churn,
    ROUND(AVG(tenure), 2) AS Avg_Tenure
FROM telco_churn
GROUP BY Churn;

-- =====================================================================
-- 7. Tenure group vs churn (bucketed breakdown backing the dashboard chart)
-- =====================================================================
-- Boundaries are inclusive on the upper edge (tenure <= 12, etc.), matching
-- the Tableau calculated field exactly — a tenure=0 customer correctly
-- lands in "0-12 Months" here, same as in the dashboard.

SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '12-24 Months'
        WHEN tenure <= 48 THEN '24-48 Months'
        ELSE '48+ Months'
    END AS Tenure_Group,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM telco_churn
GROUP BY Tenure_Group
ORDER BY MIN(tenure);

-- =====================================================================
-- 8. Tech support vs churn
-- =====================================================================

SELECT
    TechSupport,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM telco_churn
GROUP BY TechSupport
ORDER BY Churn_Rate DESC;
