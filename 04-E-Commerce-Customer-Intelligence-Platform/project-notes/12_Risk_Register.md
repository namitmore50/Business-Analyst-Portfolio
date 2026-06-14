# 12_Risk_Register

# Project Risk Register

The following risks were identified during the RetailIQ E-Commerce Customer Intelligence Platform implementation.

| Risk ID | Risk Description                                            | Likelihood | Impact | Risk Score | Mitigation Strategy                                       | Owner              | Status    |
| ------- | ----------------------------------------------------------- | ---------- | ------ | ---------- | --------------------------------------------------------- | ------------------ | --------- |
| R-01    | Data quality issues due to missing Olist geolocation values | Medium     | High   | High       | Apply null handling and imputation during preprocessing   | Data Analyst       | Mitigated |
| R-02    | Revenue forecast model may produce inaccurate predictions   | Medium     | Medium | Medium     | Validate model using historical trends and MAPE           | Data Analyst       | Monitored |
| R-03    | Power BI data model cardinality relationship errors         | Medium     | High   | High       | Validate relationships and star schema before deployment  | BI Developer       | Mitigated |
| R-04    | RFM segmentation boundaries may be subjective               | Medium     | Medium | Medium     | Validate segment thresholds using business logic          | CRM Manager        | Monitored |
| R-05    | Currency interpretation confusion (BRL vs USD)              | Low        | Medium | Low        | Clearly label all financial values as Brazilian Real (R$) | Finance Team       | Mitigated |
| R-06    | Dashboard performance degradation with 100K+ rows           | Medium     | High   | High       | Optimize DAX calculations and relationships               | Power BI Developer | Monitored |
| R-07    | Stakeholder resistance to dashboard adoption                | Medium     | Medium | Medium     | Conduct stakeholder walkthrough sessions                  | Project Owner      | Open      |
| R-08    | Data freshness and refresh delays                           | Medium     | High   | High       | Define monthly refresh cadence and ownership              | Data Analyst       | Monitored |

---

## Risk Prioritization Matrix

### High Priority Risks

Require active monitoring and mitigation:

* R-01 → Data quality issues
* R-03 → Power BI relationship failures
* R-06 → Dashboard performance
* R-08 → Data freshness

---

### Medium Priority Risks

Require periodic review:

* R-02 → Forecast accuracy
* R-04 → RFM segmentation assumptions
* R-07 → Stakeholder adoption

---

### Low Priority Risks

Minimal business impact but monitored:

* R-05 → Currency confusion

---

## Risk Monitoring Approach

The project follows a proactive risk monitoring strategy:

1. Risks reviewed at sprint completion.

2. High-priority risks monitored weekly.

3. Mitigation strategies updated during sprint retrospectives.

4. New risks documented if discovered during testing or deployment.

---

## Risk Ownership Principle

Each risk has a clearly assigned owner responsible for:

* Monitoring
* Escalation
* Mitigation execution
* Status updates
