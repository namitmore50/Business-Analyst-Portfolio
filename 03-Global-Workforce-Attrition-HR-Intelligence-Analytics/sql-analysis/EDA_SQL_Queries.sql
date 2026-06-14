-- 1. CTE — Attrition Rate by Department with Rank
WITH DeptAttrition AS (
    SELECT 
        Department,
        COUNT(*) AS TotalEmployees,
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
        ROUND(
            SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
            2
        ) AS AttritionRate
    FROM ibm_clean
    GROUP BY Department
)

SELECT *,
RANK() OVER (ORDER BY AttritionRate DESC) AS AttritionRank
FROM DeptAttrition;

--2. JOIN — Employee + Performance Data

SELECT
    i.EmployeeNumber,
    i.Department,
    i.JobRole,
    w.avg_training_score,
    w.performance_tier
FROM ibm_clean i
JOIN workforce_clean w
ON i.EmployeeNumber = w.employee_id;

--3. CASE WHEN — Salary Quartile Segmentation
SELECT
    EmployeeNumber,
    MonthlyIncome,
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Q1 Low'
        WHEN MonthlyIncome < 6000 THEN 'Q2 Mid-Low'
        WHEN MonthlyIncome < 10000 THEN 'Q3 Mid-High'
        ELSE 'Q4 High'
    END AS IncomeQuartile
FROM ibm_clean;

--. GROUP BY + HAVING — High Risk Department Filter
SELECT
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM ibm_clean
GROUP BY Department
HAVING
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) > 50;

--5. Window Function — Rolling Attrition Trend

SELECT
    Department,
    COUNT(*) AS MonthlyAttrition,
    SUM(COUNT(*)) OVER (
        ORDER BY Department
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS RollingTrend
FROM ibm_clean
WHERE Attrition = 'Yes'
GROUP BY Department;