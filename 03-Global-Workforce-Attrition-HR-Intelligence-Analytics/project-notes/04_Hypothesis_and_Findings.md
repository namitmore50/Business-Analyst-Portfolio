# Hypothesis & Findings

## Overview

This document validates key workforce assumptions through exploratory analysis, SQL insights, and statistical testing. The purpose is to identify major workforce attrition drivers and generate evidence-based HR recommendations.

The hypotheses were evaluated using:

- Workforce analytics
- SQL analysis
- Statistical testing (Pearson Correlation & Chi-Square)
- Department-level workforce segmentation

---

# Hypothesis 1

## Statement

Employees working overtime are more likely to leave the organization.

### Business Reasoning

High workloads often increase burnout, stress, poor work-life balance, and dissatisfaction, increasing employee attrition risk.

### Expected Validation

Employees working overtime should demonstrate significantly higher attrition compared to employees not working overtime.

### Statistical Validation

**Chi-Square Test (OverTime vs Attrition)**

- **Chi-Square Statistic:** 87.5643
- **P-value:** 0.0000
- **Result:** Statistically Significant

### Findings

| Employee Group | Attrition Rate |
|----------------|----------------|
| OverTime = Yes | 30.5% |
| OverTime = No | 10.4% |

Key Observation:
- Employees working overtime are approximately **3× more likely to leave** the organization.

### Business Insight

Excessive overtime is one of the strongest workforce attrition drivers. HR should monitor overtime-heavy teams, improve workload balancing, and implement employee wellness initiatives.

### Status

✅ **Validated**

---

# Hypothesis 2

## Statement

Employees with lower job satisfaction demonstrate higher attrition.

### Business Reasoning

Lower workplace satisfaction reduces employee engagement, motivation, and organizational loyalty.

### Expected Validation

Lower job satisfaction should correlate with higher attrition.

### Statistical Validation

**Pearson Correlation (Job Satisfaction vs Attrition)**

- **Correlation (r): -0.1035**
- **P-value:** 0.0001
- **Relationship:** Weak Negative Correlation

### Findings

- Employees with **Job Satisfaction Level 1** show the highest attrition rate (**22.8%**)
- Employees with **Job Satisfaction Level 4** show the lowest attrition (**11.3%**)

Key Observation:
- Attrition decreases as job satisfaction improves.

### Business Insight

Improving employee engagement, manager support, feedback systems, and recognition programs can help reduce workforce exits.

### Status

✅ **Validated**

---

# Hypothesis 3

## Statement

Employees with shorter tenure are more likely to leave.

### Business Reasoning

Early-stage employees are more vulnerable to resignation due to onboarding issues, poor fit, lower organizational attachment, and unclear career growth.

### Expected Validation

Employees with lower tenure should demonstrate higher attrition risk.

### Statistical Validation

**Pearson Correlation (Years at Company vs Attrition)**

- **Correlation (r): -0.1344**
- **P-value:** 0.0000
- **Relationship:** Weak Negative Correlation

### Findings

| Tenure Band | Attrition Trend |
|--------------|----------------|
| <1 Year | Highest Risk |
| 1–3 Years | High Risk |
| 3–6 Years | Moderate Risk |
| 6–10 Years | Lower Risk |
| 10+ Years | Lowest Risk |

Key Observation:
- Early-stage employees demonstrate significantly higher workforce instability.

### Business Insight

The first two years represent the highest attrition-risk period. HR should strengthen onboarding, mentoring, career planning, and employee engagement during early tenure.

### Status

✅ **Validated**

---

# Hypothesis 4

## Statement

Compensation competitiveness impacts employee retention.

### Business Reasoning

Employees compensated below market standards are more likely to pursue external opportunities.

### Expected Validation

Lower-paid employee segments should experience higher attrition.

### Statistical Validation

**Pearson Correlation (Monthly Income vs Attrition)**

- **Correlation (r): -0.1598**
- **P-value:** 0.0000
- **Relationship:** Weak Negative Correlation

### Findings

| Salary Segment | Attrition Trend |
|----------------|----------------|
| Low Salary | Highest Attrition |
| Medium Salary | Moderate Attrition |
| High Salary | Lowest Attrition |

Key Observation:
- Lower-income employees show greater attrition tendency.

### Business Insight

Compensation competitiveness influences retention. HR should benchmark salary structures against market standards and strengthen career growth opportunities.

### Status

✅ **Validated**

---

# Hypothesis 5

## Statement

Departments with weaker workforce performance indicators show higher attrition.

### Business Reasoning

Low training effectiveness, lower KPI achievement, and weaker workforce engagement can reduce employee retention.

### Expected Validation

Departments with weaker workforce performance should show greater instability.

### Findings

- Workforce performance varies significantly across departments.
- Training effectiveness and KPI achievement show measurable department differences.
- Higher workforce instability is associated with weaker performance segments.

### Business Insight

Improving employee training, performance coaching, and KPI enablement may improve workforce retention outcomes.

### Status

⚠️ **Partially Validated**

---

# Final Project Findings

The analysis identified several workforce factors influencing employee attrition.

## Major Attrition Drivers

### 1. Overtime Workload
- Strongest workforce attrition signal
- Employees working overtime are significantly more likely to leave

### 2. Low Job Satisfaction
- Lower satisfaction increases attrition tendency

### 3. Early Employee Tenure
- Employees in their first years are at highest risk

### 4. Compensation Competitiveness
- Lower salary segments experience higher attrition

### 5. Workforce Performance Differences
- Department-level performance variation impacts retention

---

# Overall Conclusion

Employee attrition is influenced by multiple workforce dimensions including workload, satisfaction, tenure, compensation, and performance.

The findings suggest that organizations should prioritize:

1. **Reducing overtime burden**
2. **Improving employee satisfaction**
3. **Strengthening onboarding and early retention**
4. **Enhancing compensation competitiveness**
5. **Improving workforce development programs**

A proactive workforce intelligence strategy can significantly improve employee retention, workforce stability, and long-term organizational performance.
## Key Takeaways

- Overtime is the strongest attrition signal
- Early tenure employees are highest risk
- Employee satisfaction impacts retention
- Compensation competitiveness matters
- Attrition has major financial cost