-- Q1: Overall Churn Rate

SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM customers;

-- Q2: Churn Rate by Contract Type

SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM customers
GROUP BY Contract
ORDER BY Churn_Rate_Percent DESC;

-- Q3: Churn Rate by Internet Service

SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM customers
GROUP BY InternetService
ORDER BY Churn_Rate_Percent DESC;

-- Q4: Churn Rate by Payment Method

SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM customers
GROUP BY PaymentMethod
ORDER BY Churn_Rate_Percent DESC;

-- Q5: Churn Rate by Tenure Group

SELECT
    CASE
        WHEN tenure BETWEEN 0 AND 12 THEN '0-12 Months'
        WHEN tenure BETWEEN 13 AND 24 THEN '13-24 Months'
        WHEN tenure BETWEEN 25 AND 48 THEN '25-48 Months'
        ELSE '49-72 Months'
    END AS Tenure_Group,

    COUNT(*) AS Total_Customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent

FROM customers

GROUP BY Tenure_Group

ORDER BY Churn_Rate_Percent DESC;

-- Q6: Churn Rate by Tech Support Status

SELECT
    TechSupport,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM customers
GROUP BY TechSupport
ORDER BY Churn_Rate_Percent DESC;

-- Q7: Average Monthly Charges - Churned vs Retained

SELECT
    Churn,
    COUNT(*) AS Customer_Count,
    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges
FROM customers
GROUP BY Churn;

-- Q8: Top 20 Highest Revenue-at-Risk Customers

SELECT
    customerID,
    MonthlyCharges,
    tenure,
    Contract,
    InternetService,
    PaymentMethod
FROM customers
WHERE Churn = 'Yes'
ORDER BY MonthlyCharges DESC
LIMIT 20;

-- Q9: Churn Rate by Senior Citizen Status

SELECT
    SeniorCitizen,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent
FROM customers
GROUP BY SeniorCitizen
ORDER BY Churn_Rate_Percent DESC;

-- Q10: Multi-Factor Risk Segment Analysis

SELECT
    'Month-to-Month + Fiber Optic + No Tech Support' AS Risk_Segment,

    COUNT(*) AS Total_Customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,

    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Churn_Rate_Percent

FROM customers

WHERE Contract = 'Month-to-month'
AND InternetService = 'Fiber optic'
AND TechSupport = 'No';