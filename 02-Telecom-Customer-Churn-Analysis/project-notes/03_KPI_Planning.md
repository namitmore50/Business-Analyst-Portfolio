# KPI Planning

## Executive KPIs

### 1. Total Customers

**Purpose:**
Measure the total customer base.

**Formula:**
COUNT(CustomerID)

**Business Value:**
Helps management understand company scale, customer reach, and market presence.

---

### 2. Churned Customers

**Purpose:**
Measure the total number of customers who left the company.

**Formula:**
COUNT(CustomerID where Churn = "Yes")

**Business Value:**
Measures customer loss and overall churn impact.

---

### 3. Churn Rate %

**Purpose:**
Measure the percentage of customers lost.

**Formula:**
(Churned Customers / Total Customers) × 100

**Business Value:**
Primary KPI for evaluating customer retention performance and overall business health.

---

### 4. Retention Rate %

**Purpose:**
Measure the percentage of customers retained.

**Formula:**
(Retained Customers / Total Customers) × 100

**Business Value:**
Tracks customer loyalty and long-term customer stability.

---

### 5. Revenue at Risk

**Purpose:**
Measure revenue associated with churned customers.

**Formula:**
SUM(MonthlyCharges where Churn = "Yes")

**Business Value:**
Shows the financial impact of customer churn and estimates monthly revenue leakage.

**Current Finding:**
Revenue at Risk = **$139.13K**

---

### 6. Revenue at Risk by Segment

**Purpose:**
Measure estimated revenue loss across different customer segments.

**Formula:**
SUM(MonthlyCharges where Churn = "Yes")

Segmented by:

* Contract Type
* Internet Service Type

**Business Value:**
Helps identify **which customer segments contribute the highest financial risk**, enabling targeted retention strategies.

**Key Finding:**
**Month-to-Month + Fiber Optic customers represent the highest revenue-at-risk segment.**

---

### 7. Average Monthly Charges

**Purpose:**
Measure average monthly customer spend.

**Formula:**
AVERAGE(MonthlyCharges)

**Business Value:**
Helps analyze pricing sensitivity and pricing impact on churn behavior.

---

### 8. Average Customer Tenure

**Purpose:**
Measure average customer lifetime.

**Formula:**
AVERAGE(Tenure)

**Business Value:**
Measures customer loyalty duration and retention strength.

---

## Risk Analysis KPIs

### 9. Highest Churn Contract Type

**Goal:**
Identify the contract type with the highest churn risk.

**Expected Insight:**
**Month-to-Month contracts demonstrate the highest churn behavior.**

**Business Value:**
Helps design contract upgrade and retention campaigns.

---

### 10. Highest Churn Internet Service

**Goal:**
Identify internet service categories associated with higher churn.

**Expected Insight:**
**Fiber Optic customers exhibit the highest churn rate.**

**Business Value:**
Helps prioritize service improvements and customer satisfaction efforts.

---

### 11. Highest Risk Customer Segment

**Goal:**
Identify the most vulnerable customer segment.

**Expected Insight:**
**Month-to-Month + Fiber Optic + No Tech Support customers represent the highest-risk customer segment.**

**Business Value:**
Helps management target retention strategies toward the most vulnerable and high-value customer groups.

---

### 12. Customer Risk Tier Distribution

**Goal:**
Categorize customers into churn-risk groups.

**Formula:**

Risk Score Model:

* Month-to-Month Contract = +2 points
* Fiber Optic Internet = +2 points
* Electronic Check Payment = +1 point
* 0–12 Months Tenure = +1 point

Risk Tier Logic:

* 4–6 Points → High Risk
* 2–3 Points → Medium Risk
* 0–1 Points → Low Risk

**Business Value:**
Allows proactive churn prevention by identifying likely churners before they leave.

**Key Finding:**
High-risk customers show a churn rate of **53.60%**, compared to only **3.49% for low-risk customers**.

---

### 13. Early Tenure Churn KPI

**Goal:**
Measure churn concentration during the early customer lifecycle.

**Expected Insight:**
Customers within the **first 12 months** exhibit the highest churn risk.

**Key Finding:**

* 0–12 Months → **47.44% churn rate**
* 13–24 Months → **28.71% churn rate**
* 25–48 Months → **20.39% churn rate**
* 49–72 Months → **9.51% churn rate**

**Business Value:**
Supports onboarding strategies, first-year engagement campaigns, and early customer retention programs.
