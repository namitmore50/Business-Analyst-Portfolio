-- ==================================================
-- Query 1: Attrition Rate by Department with Ranking
-- Objective:
-- Identify departments with highest attrition risk
-- ==================================================

WITH DeptAttrition AS (
    SELECT 
        Department,
        COUNT(*) AS TotalEmployees,
        SUM(
            CASE 
                WHEN Attrition = 'Yes' 
                THEN 1 
                ELSE 0 
            END
        ) AS Exits,
        ROUND(
            SUM(
                CASE 
                    WHEN Attrition = 'Yes' 
                    THEN 1 
                    ELSE 0 
                END
            ) * 100.0 / COUNT(*),
            2
        ) AS AttritionRate
    FROM IBM_Attrition
    GROUP BY Department
)

SELECT 
    Department,
    TotalEmployees,
    Exits,
    AttritionRate,
    RANK() OVER (
        ORDER BY AttritionRate DESC
    ) AS DeptRank
FROM DeptAttrition;

-- ==================================================
-- Query 2: Average Salary of Leavers vs Stayers
-- Objective:
-- Compare salary patterns by employee retention
-- ==================================================

WITH SalaryComparison AS (
    SELECT
        JobRole,
        
        ROUND(
            AVG(
                CASE
                    WHEN Attrition = 'Yes'
                    THEN MonthlyIncome
                END
            ), 2
        ) AS AvgSalary_Leavers,

        ROUND(
            AVG(
                CASE
                    WHEN Attrition = 'No'
                    THEN MonthlyIncome
                END
            ), 2
        ) AS AvgSalary_Stayers

    FROM IBM_Attrition
    GROUP BY JobRole
)

SELECT
    JobRole,
    AvgSalary_Leavers,
    AvgSalary_Stayers,
    ROUND(
        AvgSalary_Stayers - AvgSalary_Leavers,
        2
    ) AS SalaryGap
FROM SalaryComparison
ORDER BY SalaryGap DESC;

-- ==================================================
-- Query 3: Workforce Performance by Department
-- Objective:
-- Analyze workforce performance indicators
-- ==================================================

SELECT
    department AS Department,

    ROUND(
        AVG(avg_training_score),
        2
    ) AS Avg_Training_Score,

    ROUND(
        AVG(KPIs_met_more_than_80) * 100,
        2
    ) AS KPI_Achievement_Rate

FROM Workforce_Operations

GROUP BY department

ORDER BY KPI_Achievement_Rate DESC;

-- ==================================================
-- Query 4: Cumulative Attrition by Department
-- Objective:
-- Track cumulative exits over employee tenure
-- ==================================================

WITH ExitTrend AS (
    SELECT
        Department,
        YearsAtCompany,

        SUM(
            CASE
                WHEN Attrition = 'Yes'
                THEN 1
                ELSE 0
            END
        ) AS Exits

    FROM IBM_Attrition

    GROUP BY
        Department,
        YearsAtCompany
)

SELECT
    Department,
    YearsAtCompany,
    Exits,

    SUM(Exits) OVER (
        PARTITION BY Department
        ORDER BY YearsAtCompany
    ) AS CumulativeExits

FROM ExitTrend

ORDER BY
    Department,
    YearsAtCompany;

    -- ==================================================
-- Query 5: Employee Risk Classification
-- Objective:
-- Classify employees by attrition risk
-- ==================================================

SELECT
    EmployeeNumber,
    Department,
    JobSatisfaction,
    OverTime,
    YearsAtCompany,

    CASE
        WHEN OverTime = 'Yes'
             AND JobSatisfaction <= 2
             AND YearsAtCompany < 3
        THEN 'High Risk'

        WHEN JobSatisfaction <= 2
             OR OverTime = 'Yes'
        THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS RiskLevel

FROM IBM_Attrition

ORDER BY
    RiskLevel DESC,
    YearsAtCompany ASC;

-- ==================================================
-- Query 6: High Attrition Departments
-- Objective:
-- Find departments where attrition exceeds
-- company average
-- ==================================================

SELECT
    Department,
    COUNT(*) AS TotalEmployees,

    SUM(
        CASE
            WHEN Attrition = 'Yes'
            THEN 1
            ELSE 0
        END
    ) AS Exits,

    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate

FROM IBM_Attrition

GROUP BY Department

HAVING AttritionRate > (
    SELECT ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    )
    FROM IBM_Attrition
)

ORDER BY AttritionRate DESC;
