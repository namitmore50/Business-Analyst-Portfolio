# Functional Requirements Document (FRD)

**Project:** GrowthLens – Customer Intelligence & Product Analytics Platform
**Version:** 1.0
**Date:** 24 June 2026
**Author:** Namit More
**Status:** Final

---

# Table of Contents

1. System Overview
2. Functional Requirements
3. Non-Functional Requirements
4. Data Requirements
5. Integration Requirements
6. Report and Export Requirements
7. Revision History

---

# Revision History

| Version | Date        | Author     | Description                   |
| ------- | ----------- | ---------- | ----------------------------- |
| 0.1     | 20-Jun-2026 | Namit More | Initial Draft                 |
| 0.5     | 22-Jun-2026 | Namit More | Functional Requirements Added |
| 1.0     | 24-Jun-2026 | Namit More | Final Version                 |

---

# 1. System Overview

GrowthLens is an end-to-end Customer Intelligence and Product Analytics Platform developed to provide business stakeholders with actionable insights into customer acquisition, retention, segmentation, experimentation, and revenue performance.

The platform consists of:

* SQLite analytical database
* SQL transformation layer
* Python analytical notebooks
* Power BI dashboards
* Business documentation and executive recommendations

The system enables stakeholders to monitor business performance and identify growth opportunities through interactive dashboards and analytics.

---

# 2. Functional Requirements

| ID    | Functional Requirement                                                 |
| ----- | ---------------------------------------------------------------------- |
| FR001 | Dashboard must load within 5 seconds on Power BI Service.              |
| FR002 | Cohort matrix must accept user-selectable date ranges.                 |
| FR003 | What-If parameters must refresh affected visuals within 2 seconds.     |
| FR004 | Monetary values must be displayed in INR format (₹X,XX,XXX).           |
| FR005 | Navigation buttons must highlight the current page.                    |
| FR006 | Dashboard must support filtering by date range.                        |
| FR007 | Dashboard must support filtering by traffic source.                    |
| FR008 | Dashboard must support filtering by customer segment.                  |
| FR009 | Dashboard must support filtering by acquisition channel.               |
| FR010 | Dashboard must support filtering by device type.                       |
| FR011 | Funnel page must display conversion rates by stage.                    |
| FR012 | Funnel page must display revenue loss at each stage.                   |
| FR013 | Retention page must display cohort retention matrix.                   |
| FR014 | Retention page must identify high-risk customers.                      |
| FR015 | Segmentation page must display RFM segment distribution.               |
| FR016 | Segmentation page must display segment recommendations.                |
| FR017 | Experimentation page must display statistical significance indicators. |
| FR018 | Experimentation page must display confidence intervals.                |
| FR019 | Experimentation page must display projected revenue impact.            |
| FR020 | Unit Economics page must display LTV:CAC ratios.                       |
| FR021 | Unit Economics page must display payback period analysis.              |
| FR022 | Unit Economics page must display revenue forecasts.                    |
| FR023 | Unit Economics page must support What-If simulations.                  |
| FR024 | Growth Action Plan page must display initiative prioritization matrix. |
| FR025 | Growth Action Plan page must display Gantt timeline.                   |
| FR026 | System must display executive KPI cards.                               |
| FR027 | System must allow drill-down and cross-filtering between visuals.      |
| FR028 | System must provide tooltips for key metrics.                          |
| FR029 | System must support exporting dashboard data.                          |
| FR030 | System must support PDF and PowerPoint report exports.                 |

---

# 3. Non-Functional Requirements

## Performance Requirements

| ID     | Requirement                                        |
| ------ | -------------------------------------------------- |
| NFR001 | Dashboard pages must load within 5 seconds.        |
| NFR002 | Visual interactions must refresh within 2 seconds. |
| NFR003 | Slicers must respond within 2 seconds.             |

---

## Usability Requirements

| ID     | Requirement                                               |
| ------ | --------------------------------------------------------- |
| NFR004 | Dashboard must be intuitive for business users.           |
| NFR005 | Navigation between pages must require no training.        |
| NFR006 | Visuals must use consistent formatting and color schemes. |

---

## Security Requirements

| ID     | Requirement                                              |
| ------ | -------------------------------------------------------- |
| NFR007 | Access must be restricted to authorized users.           |
| NFR008 | No personally identifiable information shall be exposed. |
| NFR009 | Sensitive business metrics must be read-only.            |

---

## Scalability Requirements

| ID     | Requirement                                                                    |
| ------ | ------------------------------------------------------------------------------ |
| NFR010 | Solution should support data growth up to 10 million records.                  |
| NFR011 | Additional dashboards should be added without redesign.                        |
| NFR012 | System should support future migration to enterprise data warehouse platforms. |

---

# 4. Data Requirements

## Data Sources

| Source        | Description                 |
| ------------- | --------------------------- |
| users         | Customer master data        |
| orders        | Customer orders             |
| order_items   | Order line items            |
| products      | Product catalog             |
| events        | Customer activity events    |
| channel_costs | Marketing spend information |
| ab_test       | Experimentation dataset     |

---

## Refresh Frequency

| Dataset              | Refresh Frequency |
| -------------------- | ----------------- |
| Transactional Tables | Daily             |
| Marketing Costs      | Weekly            |
| Forecast Tables      | Monthly           |
| Dashboard Refresh    | Daily             |

---

## Data Quality Thresholds

| Metric            | Threshold |
| ----------------- | --------- |
| Data Completeness | ≥ 95%     |
| Duplicate Records | ≤ 1%      |
| Missing Values    | ≤ 5%      |
| Date Validity     | 100%      |

---

# 5. Integration Requirements

## Manual Integration Process

The `channel_costs` dataset is manually updated by the marketing team.

Process:

1. Marketing team updates monthly spend values.
2. CSV file is uploaded to the project repository.
3. SQL scripts refresh analytical tables.
4. Power BI dataset refreshes.
5. Updated metrics become available in dashboards.

---

# 6. Report and Export Requirements

| Requirement           | Description |
| --------------------- | ----------- |
| Export to PDF         | Supported   |
| Export to PowerPoint  | Supported   |
| Export Summary Tables | Supported   |
| Dashboard Screenshots | Supported   |
| CSV Export            | Supported   |
| Executive Reports     | Supported   |

---

# Conclusion

The Functional Requirements Document translates business requirements into implementable system capabilities and provides a blueprint for the design, development, and validation of the GrowthLens analytics platform.
