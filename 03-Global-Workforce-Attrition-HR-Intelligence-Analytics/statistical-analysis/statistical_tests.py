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