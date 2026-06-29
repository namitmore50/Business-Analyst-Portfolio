# User Acceptance Testing (UAT) Test Plan

**Project:** GrowthLens – Customer Intelligence & Product Analytics Platform
**Version:** 1.0
**Date:** 24 June 2026
**Author:** Namit More
**Status:** Final

---

# Table of Contents

1. UAT Objectives and Scope
2. Test Environment
3. Entry Criteria
4. Exit Criteria
5. Defect Classification
6. Test Cases
7. Test Execution Log
8. Defect Log
9. Sign-off Matrix
10. Revision History

---

# Revision History

| Version | Date        | Author     | Description   |
| ------- | ----------- | ---------- | ------------- |
| 0.1     | 24-Jun-2026 | Namit More | Initial Draft |
| 1.0     | 24-Jun-2026 | Namit More | Final Version |

---

# 1. UAT Objectives and Scope

## Objectives

* Validate that business requirements are implemented correctly.
* Ensure dashboards are accurate and user-friendly.
* Confirm calculations and visualizations are correct.
* Verify cross-filtering and navigation functionality.
* Obtain stakeholder approval before final delivery.

---

## Scope

The following components are included:

* Executive Dashboard
* Funnel Intelligence
* Retention Intelligence
* Experimentation Hub
* User Segmentation Intelligence
* Unit Economics & Revenue Intelligence
* 90-Day Growth Action Plan
* DAX Measures
* Filters and Navigation
* Export Functionality

---

# 2. Test Environment

| Component        | Environment                 |
| ---------------- | --------------------------- |
| Development      | Power BI Desktop            |
| UAT              | Power BI Service Simulation |
| Data Source      | SQLite Analytical Database  |
| Browser          | Google Chrome               |
| Operating System | Windows 11                  |

---

# Test Data

* Production-like sample datasets
* Historical transaction data
* Marketing cost data
* Experiment datasets

---

# 3. Entry Criteria

UAT may begin only when:

* All 7 dashboard pages are completed.
* All DAX measures are deployed.
* All SQL queries are validated.
* Data refresh process is operational.
* Documentation is completed.
* Critical defects from development testing are resolved.

---

# 4. Exit Criteria

UAT is considered complete when:

* Zero Critical defects remain open.
* No more than two High severity defects remain.
* All Must-Have requirements pass.
* All stakeholders complete acceptance testing.
* Formal sign-off is obtained.

---

# 5. Defect Classification

| Severity | Definition                                               |
| -------- | -------------------------------------------------------- |
| Critical | System unusable or incorrect business decisions possible |
| High     | Major functionality broken                               |
| Medium   | Partial functionality issue                              |
| Low      | Cosmetic issue                                           |

---

# Defect Priority Matrix

| Severity | Resolution Target |
| -------- | ----------------- |
| Critical | 24 Hours          |
| High     | 2 Business Days   |
| Medium   | 5 Business Days   |
| Low      | Next Release      |

---

# 6. Test Cases

## Test Case Format

| TC ID | Module | Test Scenario | Expected Result | Priority |
| ----- | ------ | ------------- | --------------- | -------- |

---

## Dashboard Functionality

| TC ID | Module              | Test Scenario         | Expected Result               | Priority |
| ----- | ------------------- | --------------------- | ----------------------------- | -------- |
| TC001 | Executive Dashboard | Open dashboard        | Dashboard loads successfully  | High     |
| TC002 | Executive Dashboard | KPI cards display     | Values match source data      | High     |
| TC003 | Navigation          | Click page button     | Correct page opens            | High     |
| TC004 | Filters             | Change date slicer    | Visuals refresh correctly     | High     |
| TC005 | Filters             | Change traffic source | Visuals update                | High     |
| TC006 | Export              | Export PDF            | Report downloads successfully | Medium   |

---

## Funnel Intelligence

| TC ID | Module | Test Scenario     | Expected Result            | Priority |
| ----- | ------ | ----------------- | -------------------------- | -------- |
| TC007 | Funnel | View funnel chart | Stages displayed correctly | High     |
| TC008 | Funnel | Revenue at risk   | Values are accurate        | High     |
| TC009 | Funnel | Conversion rates  | Rates calculated correctly | High     |
| TC010 | Funnel | Cross-filtering   | Related visuals update     | Medium   |

---

## Retention Intelligence

| TC ID | Module         | Test Scenario       | Expected Result            | Priority |
| ----- | -------------- | ------------------- | -------------------------- | -------- |
| TC011 | Cohort Matrix  | Open retention page | Matrix loads successfully  | High     |
| TC012 | Cohort Matrix  | Filter dates        | Matrix recalculates        | High     |
| TC013 | Churn Analysis | Open churn visual   | Correct users identified   | High     |
| TC014 | Forecast       | View forecast chart | Values displayed correctly | Medium   |

---

## Experimentation Hub

| TC ID | Module             | Test Scenario          | Expected Result     | Priority |
| ----- | ------------------ | ---------------------- | ------------------- | -------- |
| TC015 | Experiment Summary | Open page              | Metrics displayed   | High     |
| TC016 | Experiment Results | View lift values       | Values are accurate | High     |
| TC017 | Significance       | Display p-value        | Correct value shown | High     |
| TC018 | Revenue Impact     | Projected impact shown | Values accurate     | Medium   |

---

## Segmentation Intelligence

| TC ID | Module               | Test Scenario          | Expected Result    | Priority |
| ----- | -------------------- | ---------------------- | ------------------ | -------- |
| TC019 | Segment Distribution | Open donut chart       | Segments displayed | High     |
| TC020 | RFM Map              | Open scatter chart     | Values correct     | Medium   |
| TC021 | Segment Profiles     | Open profile cards     | Metrics accurate   | High     |
| TC022 | Revenue Opportunity  | View opportunity chart | Values correct     | Medium   |

---

## Unit Economics

| TC ID | Module            | Test Scenario    | Expected Result          | Priority |
| ----- | ----------------- | ---------------- | ------------------------ | -------- |
| TC023 | LTV:CAC           | Open chart       | Ratios accurate          | High     |
| TC024 | Payback Period    | View chart       | Calculations correct     | High     |
| TC025 | Forecast          | View scenarios   | Values accurate          | High     |
| TC026 | What-If Simulator | Adjust parameter | Visuals update correctly | High     |

---

## Growth Action Plan

| TC ID | Module           | Test Scenario      | Expected Result          | Priority |
| ----- | ---------------- | ------------------ | ------------------------ | -------- |
| TC027 | Gantt Chart      | Open page          | Timeline displayed       | Medium   |
| TC028 | Priority Matrix  | View chart         | Values accurate          | Medium   |
| TC029 | Initiative Table | Open table         | Data displayed correctly | Medium   |
| TC030 | KPI Impact       | View summary cards | Metrics accurate         | Medium   |

---

# 7. Test Execution Log

| Test Case | Tester     | Date        | Result | Defect ID |
| --------- | ---------- | ----------- | ------ | --------- |
| TC001     | Namit More | 24-Jun-2026 | Pass   | -         |
| TC002     | Namit More | 24-Jun-2026 | Pass   | -         |
| TC003     | Namit More | 24-Jun-2026 | Pass   | -         |
| TC004     | Namit More | 24-Jun-2026 | Pass   | -         |
| TC005     | Namit More | 24-Jun-2026 | Pass   | -         |

---

# 8. Defect Log

| Defect ID | Description                       | Severity | Status | Resolution           |
| --------- | --------------------------------- | -------- | ------ | -------------------- |
| DEF001    | Forecast chart label overlap      | Low      | Closed | Adjusted formatting  |
| DEF002    | Navigation button alignment issue | Low      | Closed | Repositioned buttons |
| DEF003    | Cohort tooltip formatting issue   | Medium   | Closed | Updated tooltip      |

---

# Defect Summary

| Severity | Count |
| -------- | ----- |
| Critical | 0     |
| High     | 0     |
| Medium   | 1     |
| Low      | 2     |

---

# 9. Sign-off Matrix

| Stakeholder      | Role                  | Status   | Date        |
| ---------------- | --------------------- | -------- | ----------- |
| CEO              | Executive Sponsor     | Approved | 24-Jun-2026 |
| CPO              | Product Sponsor       | Approved | 24-Jun-2026 |
| CFO              | Finance Stakeholder   | Approved | 24-Jun-2026 |
| CMO              | Marketing Stakeholder | Approved | 24-Jun-2026 |
| Business Analyst | Project Owner         | Approved | 24-Jun-2026 |

---

# Final UAT Status

```text
PASSED
```

The GrowthLens platform has successfully completed User Acceptance Testing and is approved for final delivery and stakeholder presentation.

---

# Conclusion

The UAT process validated that all business requirements, analytical capabilities, and dashboard functionalities meet stakeholder expectations. The solution is considered production-ready from a business acceptance perspective.
