# ==========================================
# Workforce Attrition Statistical Analysis
# ==========================================

import pandas as pd
from scipy.stats import pearsonr, chi2_contingency

# Load dataset
df = pd.read_csv("../cleaned-data/ibm_clean.csv")

# Convert Attrition to numeric
df["Attrition_Numeric"] = df["Attrition"].map({
    "Yes": 1,
    "No": 0
})

print("Dataset Loaded Successfully")
print(df.head())

# ==========================================
# S1: Job Satisfaction vs Attrition
# ==========================================

corr, p_value = pearsonr(
    df["JobSatisfaction"],
    df["Attrition_Numeric"]
)

print("\n===================================")
print("S1: Job Satisfaction vs Attrition")
print("===================================")
print("Pearson Correlation (r):", round(corr, 4))
print("P-value:", round(p_value, 4))

# ==========================================
# S2: Monthly Income vs Attrition
# ==========================================

corr, p_value = pearsonr(
    df["MonthlyIncome"],
    df["Attrition_Numeric"]
)

print("\n===================================")
print("S2: Monthly Income vs Attrition")
print("===================================")
print("Pearson Correlation (r):", round(corr, 4))
print("P-value:", round(p_value, 4))

# ==========================================
# S3: Years at Company vs Attrition
# ==========================================

corr, p_value = pearsonr(
    df["YearsAtCompany"],
    df["Attrition_Numeric"]
)

print("\n===================================")
print("S3: Years at Company vs Attrition")
print("===================================")
print("Pearson Correlation (r):", round(corr, 4))
print("P-value:", round(p_value, 4))

# ==========================================
# S4: OverTime vs Attrition (Chi-Square)
# ==========================================

contingency_table = pd.crosstab(
    df["OverTime"],
    df["Attrition"]
)

chi2, p_value, dof, expected = chi2_contingency(
    contingency_table
)

print("\n===================================")
print("S4: OverTime vs Attrition")
print("===================================")
print("Chi-Square Statistic:", round(chi2, 4))
print("P-value:", round(p_value, 4))
print("Degrees of Freedom:", dof)

print("\nContingency Table:")
print(contingency_table)

# ==========================================
# S6: Cost Formula Validation
# ==========================================

avg_salary = df["MonthlyIncome"].mean() * 12

estimated_cost = (
    (avg_salary * 0.5)
    + 4200
    + (avg_salary / 4)
)

print("\n===================================")
print("S6: Cost Formula Validation")
print("===================================")
print("Average Annual Salary:",
      round(avg_salary, 2))

print("Estimated Attrition Cost per Employee:",
      round(estimated_cost, 2))