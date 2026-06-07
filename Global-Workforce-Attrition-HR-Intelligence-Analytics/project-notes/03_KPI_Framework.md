# KPI Framework

## KPI Governance Overview

This framework defines the key workforce performance indicators used to monitor employee retention, workforce stability, recruitment efficiency, employee satisfaction, and attrition-related financial impact.

The KPIs are designed to support executive decision-making, workforce planning, and proactive employee retention strategies.

---

# Executive Workforce KPIs

| KPI | Purpose | Formula | Owner | Frequency | Threshold |
|------|----------|----------|--------|------------|------------|
| Total Employees | Monitor workforce size | COUNT(EmployeeID) | HR Team | Monthly | Green > 1400 |
| Attrition Rate % | Measure employee exits | (Employees Left ÷ Total Employees) × 100 | CHRO | Monthly | Red > 20% |
| Retention Rate % | Measure employee retention | (Employees Retained ÷ Total Employees) × 100 | HR Team | Monthly | Green > 80% |
| Department Attrition Rate | Detect high-risk departments | Attrition % by Department | HR Managers | Monthly | Red > Company Avg |
| Average Employee Tenure | Measure workforce stability | AVG(YearsAtCompany) | Workforce Planning | Quarterly | Green > 5 Years |

---

# Workforce Planning KPIs

| KPI | Purpose | Formula | Owner | Frequency | Threshold |
|------|----------|----------|--------|------------|------------|
| Hiring Conversion Rate | Measure hiring funnel effectiveness | (Hired ÷ Applicants) × 100 | Recruitment Team | Monthly | Green > 20% |
| Training Effectiveness Score | Evaluate employee development | AVG(Training Score) | L&D Team | Quarterly | Green > 75 |
| KPI Achievement Rate | Measure workforce productivity | (KPI Met ÷ Total Employees) × 100 | HR Operations | Monthly | Green > 70% |
| High-Risk Employee % | Identify attrition-prone employees | High-Risk Employees ÷ Total Employees | HR Managers | Monthly | Red > 25% |
| Bench Strength Score | Assess workforce depth | Available successors ÷ Critical Roles | Workforce Planning | Quarterly | Green > 1.5 |

---

# Financial KPIs

| KPI | Purpose | Formula | Owner | Frequency | Threshold |
|------|----------|----------|--------|------------|------------|
| Cost of Attrition | Measure turnover financial impact | Recruitment + Training + Productivity Loss | Finance | Monthly | Red > Budget |
| Revenue/Productivity at Risk | Estimate operational disruption | Attrition Cost Exposure | Operations | Quarterly | Monitor Trend |
| Salary Competitiveness Index | Compare internal pay vs market | Internal Salary ÷ Market Median | Compensation Team | Quarterly | Green > P50 |
| Cost Savings Potential | Estimate savings from retention improvement | Attrition Cost × Improvement % | Finance | Quarterly | Positive Trend |

---

# Employee Experience KPIs

| KPI | Purpose | Formula | Owner | Frequency | Threshold |
|------|----------|----------|--------|------------|------------|
| Job Satisfaction Score | Measure employee engagement | AVG(JobSatisfaction) | HR Team | Monthly | Green > 3 |
| Work-Life Balance Score | Monitor employee wellbeing | AVG(WorkLifeBalance) | HR Team | Monthly | Green > 3 |
| Overtime Risk % | Measure burnout risk | (Employees Working Overtime ÷ Total Employees) × 100 | HR Managers | Monthly | Red > 30% |
| Promotion Gap Risk | Identify stagnation risk | Years Since Promotion > 3 | HR Team | Quarterly | Red > 25% |
| Employee Engagement Index | Monitor workforce morale | Satisfaction Composite Score | CHRO | Quarterly | Green > 75 |

---

# KPI Classification (RAG Framework)

### Green (Healthy)
- KPI within acceptable threshold
- No immediate action required

### Amber (Warning)
- KPI nearing risk threshold
- Monitor and investigate

### Red (Critical)
- KPI exceeds acceptable risk level
- Immediate intervention required

---

# KPI Usage in Dashboard

### Page 1 — Executive Overview
- Total Employees
- Attrition Rate
- Retention Rate
- Department Attrition

### Page 2 — Attrition Deep Dive
- High-Risk Employee %
- Overtime Risk %
- Job Satisfaction
- Work-Life Balance

### Page 3 — Workforce Planning
- Hiring Conversion Rate
- KPI Achievement Rate
- Training Effectiveness
- Bench Strength

### Page 4 — Cost of Attrition
- Cost of Attrition
- Salary Competitiveness
- Cost Savings Potential

### Page 5 — BA Documentation
- KPI Governance Matrix
- KPI Ownership
- KPI Monitoring Cadence