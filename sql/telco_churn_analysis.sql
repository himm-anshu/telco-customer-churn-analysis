CREATE DATABASE telco_project;
USE telco_project;
CREATE TABLE telco_churn (
    customerID VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(20),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(10)
);
SHOW TABLES;
SELECT Count(*) FROM telco_churn;
SELECT 
    Churn,
    COUNT(*) AS Total_Customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM telco_churn), 2) AS Percentage
FROM telco_churn
GROUP BY Churn;
SELECT 
    Contract,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percentage
FROM telco_churn
GROUP BY Contract
ORDER BY Churn_Rate_Percentage DESC;
SELECT 
    PaymentMethod,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM telco_churn
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;
SELECT 
    ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charges,
    Churn
FROM telco_churn
GROUP BY Churn;
SELECT 
    Churn,
    ROUND(AVG(tenure),2) AS Avg_Tenure
FROM telco_churn
GROUP BY Churn;