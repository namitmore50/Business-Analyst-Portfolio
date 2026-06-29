# Risk Register

**Project:** GrowthLens – Customer Intelligence & Product Analytics Platform
**Version:** 1.0
**Date:** 24 June 2026
**Author:** Namit More
**Status:** Final

---

# Table of Contents

1. Risk Assessment Methodology
2. Risk Scoring Matrix
3. Risk Register
4. Risk Monitoring Process
5. Revision History

---

# Revision History

| Version | Date        | Author     | Description   |
| ------- | ----------- | ---------- | ------------- |
| 0.1     | 24-Jun-2026 | Namit More | Initial Draft |
| 1.0     | 24-Jun-2026 | Namit More | Final Version |

---

# 1. Risk Assessment Methodology

## Probability Scale

| Rating | Description |
| ------ | ----------- |
| 1      | Low         |
| 2      | Medium      |
| 3      | High        |

---

## Impact Scale

| Rating | Description |
| ------ | ----------- |
| 1      | Low         |
| 2      | Medium      |
| 3      | High        |

---

## Risk Score Formula

```text id="ofvt8h"
Risk Score = Probability × Impact
```

---

# Risk Classification

| Score | Classification |
| ----- | -------------- |
| 1-2   | Low            |
| 3-4   | Medium         |
| 6     | High           |
| 9     | Critical       |

---

# 2. Risk Register

| Risk ID | Risk Description                                                | Category      | Probability | Impact | Score | Mitigation Strategy                       | Contingency                             | Owner           | Status |
| ------- | --------------------------------------------------------------- | ------------- | ----------- | ------ | ----- | ----------------------------------------- | --------------------------------------- | --------------- | ------ |
| R001    | Data quality issues in events table compromise funnel accuracy  | Data          | High        | High   | 9     | Profile and clean all null values         | Use orders table as backup source       | BA              | Open   |
| R002    | Sample Ratio Mismatch invalidates experiment results            | Analytics     | Medium      | High   | 6     | Monitor allocation continuously           | Re-run experiment                       | Product Analyst | Open   |
| R003    | Dashboard performance degrades with large datasets              | Technical     | Medium      | Medium | 4     | Aggregate calculations and optimize model | Reduce granularity                      | BI Developer    | Open   |
| R004    | Stakeholders misinterpret cohort analysis                       | Communication | High        | Medium | 6     | Add explanations and tooltips             | Conduct walkthrough session             | BA              | Open   |
| R005    | Incorrect KPI definitions create inconsistent reporting         | Governance    | Medium      | High   | 6     | Create metric definitions document        | Freeze KPI definitions                  | BA              | Open   |
| R006    | Marketing cost data is not updated on time                      | Data          | Medium      | Medium | 4     | Define update schedule                    | Use previous month's values temporarily | Marketing       | Open   |
| R007    | Forecast assumptions become invalid                             | Analytics     | Medium      | Medium | 4     | Review assumptions monthly                | Rebuild forecasting model               | Data Science    | Open   |
| R008    | Experiment duration insufficient to reach sample size           | Analytics     | Medium      | High   | 6     | Monitor sample accumulation daily         | Extend experiment duration              | Product Team    | Open   |
| R009    | Incorrect business decisions due to dashboard misinterpretation | Business      | Medium      | High   | 6     | Provide documentation and training        | Executive review sessions               | BA              | Open   |
| R010    | Source datasets contain duplicate records                       | Data          | Medium      | Medium | 4     | Implement validation checks               | Remove duplicates during ETL            | Data Analyst    | Open   |
| R011    | Customer segmentation becomes outdated                          | Analytics     | Medium      | Medium | 4     | Refresh segmentation monthly              | Recalculate RFM scores                  | Data Science    | Open   |
| R012    | Revenue calculations differ from finance reports                | Finance       | Medium      | High   | 6     | Reconcile calculations with Finance       | Use Finance-approved definitions        | CFO             | Open   |
| R013    | Scope expansion delays project delivery                         | Project       | High        | Medium | 6     | Freeze requirements after sign-off        | Defer enhancements to Phase 2           | BA              | Open   |
| R014    | Key stakeholder availability is limited                         | Project       | Medium      | Medium | 4     | Schedule meetings in advance              | Use asynchronous approvals              | Project Sponsor | Open   |
| R015    | Manual data refresh process introduces human errors             | Operational   | Medium      | Medium | 4     | Create refresh checklist                  | Rollback and reload data                | Data Analyst    | Open   |

---

# 3. Top Risks

## Critical Risks

### R001 – Data Quality Issues

Risk Score: 9

Impact:

* Incorrect funnel metrics
* Incorrect retention analysis
* Poor decision-making

Mitigation:

* Data profiling
* Validation checks
* Backup datasets

---

### R002 – Sample Ratio Mismatch

Risk Score: 6

Impact:

* Invalid experiment conclusions
* Incorrect rollout decisions

Mitigation:

* Daily SRM checks
* Assignment validation
* Experiment restart procedure

---

### R004 – Stakeholder Misinterpretation

Risk Score: 6

Impact:

* Incorrect business actions
* Reduced confidence in analytics

Mitigation:

* Documentation
* Training sessions
* Dashboard annotations

---

# 4. Risk Monitoring Process

## Review Frequency

| Risk Category   | Frequency |
| --------------- | --------- |
| Data Risks      | Weekly    |
| Analytics Risks | Weekly    |
| Business Risks  | Bi-Weekly |
| Project Risks   | Weekly    |

---

## Escalation Rules

Escalate when:

* Risk score becomes 6 or above.
* Mitigation activities fail.
* Project timeline is affected.
* Executive decisions are impacted.

---

## Risk Status Definitions

| Status    | Meaning                             |
| --------- | ----------------------------------- |
| Open      | Risk exists and requires monitoring |
| Mitigated | Actions implemented successfully    |
| Closed    | Risk no longer exists               |
| Escalated | Requires executive intervention     |

---

# Conclusion

Proactive identification and management of project risks significantly improves the likelihood of successful delivery. This register establishes a structured framework for monitoring risks and defining mitigation and contingency plans throughout the GrowthLens project lifecycle.
