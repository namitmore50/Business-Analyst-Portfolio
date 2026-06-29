# North Star Metric & KPI Tree

**Project:** GrowthLens – Customer Intelligence & Product Analytics Platform
**Version:** 1.0
**Date:** 24 June 2026
**Author:** Namit More
**Status:** Final

---

# Table of Contents

1. North Star Metric Selection Rationale
2. KPI Tree
3. KPI Ownership Matrix
4. Target-Setting Methodology
5. Leading vs Lagging Indicators
6. Review Cadence
7. Metric Definition Rules
8. Revision History

---

# Revision History

| Version | Date        | Author     | Description   |
| ------- | ----------- | ---------- | ------------- |
| 0.1     | 23-Jun-2026 | Namit More | Initial Draft |
| 1.0     | 24-Jun-2026 | Namit More | Final Version |

---

# 1. North Star Metric Selection Rationale

## Selected North Star Metric (NSM)

# Weekly Active Buyers (WAB)

### Definition

Weekly Active Buyers (WAB) represents the number of distinct users who complete at least one purchase during a rolling seven-day period.

---

## Formula

```text
WAB = Count of Distinct Purchasing Users in Last 7 Days
```

---

## Why WAB?

### Why not Daily Active Users (DAU)?

DAU measures engagement and traffic but does not necessarily represent business value. A user visiting the platform without making a purchase contributes little to revenue generation.

WAB directly captures the value exchange between customers and the business.

---

### Why not Monthly Active Users (MAU)?

Monthly metrics react slowly to business changes and delay decision-making.

Weekly measurements:

* Identify trends earlier.
* Detect problems faster.
* Enable quicker intervention.

---

## Test of a Good North Star Metric

Question:

> If WAB increases, does the business become healthier?

Answer:

✅ Yes.

Higher WAB generally results in:

* Increased revenue
* Improved customer retention
* Better marketing efficiency
* Higher customer lifetime value

---

# 2. KPI Tree

# Level 1

```text
Weekly Active Buyers
=
Monthly Active Users
× Conversion Rate
× Frequency Factor
```

---

# Level 2 Drivers

## MAU Drivers

```text
MAU
=
New Users
+
Retained Users
+
Resurrected Users
```

---

## Conversion Rate Drivers

```text
Conversion Rate
=
Product Discovery Rate
×
Cart Add Rate
×
Cart-to-Purchase Rate
```

---

## Frequency Drivers

```text
Frequency Factor
=
Category Affinity Score
×
Re-engagement Rate
×
Loyalty Program Penetration
```

---

# Level 3 Drivers

## MAU Sub-Drivers

* Channel Quality Score
* Organic Discovery Rate
* Referral Viral Coefficient

---

## Conversion Sub-Drivers

* Page Load Speed
* Search UX Score
* Price Competitiveness Index
* Review Trust Score

---

## Frequency Sub-Drivers

* Category Breadth
* Re-order Rate
* Wishlist Utilization

---

# Complete KPI Tree

```text
Weekly Active Buyers
│
├── Monthly Active Users
│   ├── New Users
│   ├── Retained Users
│   └── Resurrected Users
│
├── Conversion Rate
│   ├── Product Discovery Rate
│   ├── Cart Add Rate
│   └── Cart-to-Purchase Rate
│
└── Frequency Factor
    ├── Category Affinity Score
    ├── Re-engagement Rate
    └── Loyalty Program Penetration
```

---

# 3. KPI Ownership Matrix

| Metric               | Team Owner       | Reporting Frequency | Target   |
| -------------------- | ---------------- | ------------------- | -------- |
| Weekly Active Buyers | Product          | Daily               | +15% YoY |
| MAU                  | Growth           | Weekly              | +20% YoY |
| Conversion Rate      | Product          | Weekly              | 15%      |
| Retention Rate       | Customer Success | Monthly             | 40%      |
| Cart Abandonment     | Product          | Weekly              | <25%     |
| LTV:CAC Ratio        | Finance          | Monthly             | 3.0x     |
| Revenue              | Executive Team   | Daily               | +25% YoY |

---

# 4. Target-Setting Methodology

Targets are established using:

1. Historical performance trends.
2. Industry benchmarks.
3. Competitive analysis.
4. Revenue objectives.
5. Executive growth goals.

---

## Methodology

```text
Historical Baseline
+
Benchmark Improvement
+
Strategic Growth Objective
=
Target Metric
```

---

# Example

| Metric           | Current | Target |
| ---------------- | ------- | ------ |
| Conversion Rate  | 12%     | 15%    |
| Retention        | 30%     | 40%    |
| Cart Abandonment | 34%     | 25%    |
| LTV:CAC          | 0.66x   | 3.00x  |

---

# 5. Leading vs Lagging Indicators

## Leading Indicators

Metrics that predict future WAB performance.

* Product Discovery Rate
* Cart Add Rate
* Search UX Score
* Re-engagement Rate
* New User Acquisition
* Page Load Speed

These indicators typically predict WAB performance two to four weeks in advance.

---

## Lagging Indicators

* Revenue
* Customer Lifetime Value
* Gross Profit
* Monthly Active Users
* Annual Revenue Growth

---

# 6. Review Cadence

| Metric               | Review Frequency |
| -------------------- | ---------------- |
| Weekly Active Buyers | Daily            |
| MAU                  | Weekly           |
| Conversion Rate      | Weekly           |
| Cart Abandonment     | Weekly           |
| Retention            | Monthly          |
| Revenue              | Monthly          |
| LTV:CAC              | Monthly          |

---

# Governance Meetings

| Meeting            | Frequency |
| ------------------ | --------- |
| Growth Review      | Weekly    |
| Executive Review   | Monthly   |
| Strategic Planning | Quarterly |

---

# 7. Metric Definition Rules

## Anti-Gaming Rules

1. A user is counted only once within a rolling seven-day period.
2. Test users are excluded.
3. Cancelled orders are excluded.
4. Fraudulent transactions are excluded.
5. Internal employee purchases are excluded.

---

## Tie-Breaker Rules

1. Revenue takes precedence over traffic.
2. Conversion takes precedence over impressions.
3. Customer retention takes precedence over new acquisition.
4. Sustainable growth takes precedence over short-term spikes.

---

# Conclusion

Weekly Active Buyers (WAB) has been selected as the North Star Metric because it directly measures customer value creation and business health. The KPI Tree provides a structured framework linking operational metrics to strategic outcomes and enables stakeholders to prioritize initiatives that drive sustainable growth.
