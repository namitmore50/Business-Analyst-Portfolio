# KPI Definitions Guide

**Project:** GrowthLens – Customer Intelligence & Product Analytics Platform
**Version:** 1.0
**Date:** 24 June 2026
**Author:** Namit More
**Status:** Final

---

# Purpose

This document provides standardized definitions, calculation methodologies, ownership, and reporting frequencies for all key business metrics used within the GrowthLens platform.

The objective is to ensure all stakeholders interpret business performance using a single source of truth.

---

# KPI Governance Principles

* Every KPI must have a clear business definition.
* Every KPI must have an assigned owner.
* Every KPI must have a reporting frequency.
* Calculation logic cannot be modified without approval from the Business Analyst and Product Leadership.

---

# Executive KPIs

---

# 1. Total Revenue

## Definition

Total monetary value generated from completed customer orders.

## Formula

```text
SUM(Sale Price)
```

## Owner

CFO

## Reporting Frequency

Daily

## Business Purpose

Measures overall business performance and growth.

---

# 2. Gross Profit

## Definition

Revenue remaining after deducting product costs.

## Formula

```text
Revenue − Cost of Goods Sold
```

## Owner

CFO

## Reporting Frequency

Daily

---

# 3. Profit Margin %

## Formula

```text
(Gross Profit ÷ Revenue) × 100
```

## Owner

CFO

## Reporting Frequency

Weekly

---

# 4. Average Order Value (AOV)

## Definition

Average amount spent per completed order.

## Formula

```text
Revenue ÷ Total Orders
```

## Owner

CPO

## Reporting Frequency

Daily

---

# 5. Total Customers

## Definition

Distinct customers who completed at least one purchase.

## Formula

```text
DISTINCTCOUNT(User ID)
```

## Owner

CPO

## Reporting Frequency

Daily

---

# Customer Acquisition KPIs

---

# 6. Customer Acquisition Cost (CAC)

## Formula

```text
Marketing Spend ÷ New Customers
```

## Owner

CMO

## Reporting Frequency

Monthly

---

# 7. Customer Lifetime Value (LTV)

## Formula

```text
Average Order Value × Purchase Frequency × Customer Lifespan
```

## Owner

CFO

## Reporting Frequency

Monthly

---

# 8. LTV:CAC Ratio

## Formula

```text
Customer Lifetime Value ÷ Customer Acquisition Cost
```

## Owner

CMO

## Target

```text
≥ 3.0x
```

## Reporting Frequency

Monthly

---

# 9. Payback Period

## Formula

```text
CAC ÷ Monthly Customer Contribution
```

## Owner

CFO

## Target

```text
< 12 Months
```

---

# Funnel KPIs

---

# 10. Product Discovery Rate

## Formula

```text
Product Views ÷ Sessions
```

## Owner

Product Team

## Reporting Frequency

Daily

---

# 11. Add-to-Cart Rate

## Formula

```text
Add to Cart Events ÷ Product Views
```

## Owner

Product Team

## Reporting Frequency

Daily

---

# 12. Cart-to-Purchase Rate

## Formula

```text
Purchases ÷ Add to Cart Events
```

## Owner

Product Team

## Reporting Frequency

Daily

---

# 13. Funnel Conversion Rate

## Formula

```text
Purchases ÷ Total Visitors
```

## Owner

CPO

## Reporting Frequency

Daily

---

# 14. Cart Abandonment Rate

## Formula

```text
1 − Cart-to-Purchase Rate
```

## Owner

Product Team

## Reporting Frequency

Daily

---

# Retention KPIs

---

# 15. Retention Rate

## Formula

```text
Returning Customers ÷ Existing Customers
```

## Owner

CRM Team

## Reporting Frequency

Weekly

---

# 16. Churn Rate

## Formula

```text
Lost Customers ÷ Existing Customers
```

## Owner

CRM Team

## Reporting Frequency

Weekly

---

# 17. Repeat Purchase Rate

## Formula

```text
Repeat Customers ÷ Total Customers
```

## Owner

CRM Team

## Reporting Frequency

Weekly

---

# Segmentation KPIs

---

# 18. Champion Customers

## Definition

High Recency, High Frequency, High Monetary customers.

## Owner

CRM Team

---

# 19. Loyal Customers

## Definition

Customers with high purchase frequency and strong lifetime value.

## Owner

CRM Team

---

# 20. At-Risk Customers

## Definition

Previously valuable customers who have not purchased recently.

## Owner

CRM Team

---

# Experimentation KPIs

---

# 21. Conversion Lift

## Formula

```text
(Test Conversion − Control Conversion)
÷ Control Conversion
```

## Owner

Data Science Team

---

# 22. Statistical Significance

## Definition

Probability that observed lift is not caused by random chance.

## Threshold

```text
p-value < 0.05
```

---

# North Star Metric

# Weekly Active Buyers (WAB)

## Definition

Distinct customers who complete at least one purchase in a rolling seven-day period.

## Formula

```text
DISTINCTCOUNT(Customers)
```

for last 7 days.

## Owner

Chief Product Officer

## Reporting Frequency

Daily

---

# KPI Ownership Matrix

| KPI Category    | Owner        |
| --------------- | ------------ |
| Revenue         | CFO          |
| Profitability   | CFO          |
| Customer Growth | CPO          |
| Acquisition     | CMO          |
| Retention       | CRM Team     |
| Experimentation | Data Science |
| Product Funnel  | Product Team |

---

# KPI Review Cadence

| Frequency | Metrics                     |
| --------- | --------------------------- |
| Daily     | Revenue, Funnel, WAB        |
| Weekly    | Retention, Repeat Purchases |
| Monthly   | LTV, CAC, Payback           |
| Quarterly | Strategic Growth Metrics    |

---

# KPI Governance Rules

1. Metrics cannot be manually edited.
2. Calculation logic requires stakeholder approval.
3. Historical values cannot be overwritten.
4. KPI definitions must remain consistent across reports.
5. Dashboard acts as the single source of truth.

---

# Conclusion

The KPI framework established by GrowthLens ensures that every business decision is driven by consistent, transparent, and governed metrics.
