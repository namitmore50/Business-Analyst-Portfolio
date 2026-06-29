# UAT Test Plan Summary

**Project:** GrowthLens – Customer Intelligence & Product Analytics Platform
**Version:** 1.0
**Date:** 24 June 2026
**Author:** Namit More
**Status:** Final

---

# Purpose

The purpose of User Acceptance Testing (UAT) is to validate that the GrowthLens dashboard satisfies all business requirements, produces accurate analytical outputs, and delivers an intuitive user experience for stakeholders.

---

# Testing Scope

The following areas were tested:

* Dashboard functionality
* KPI calculations
* Data accuracy
* Cross-page navigation
* Filtering behavior
* Performance and usability
* Visual consistency
* Integration with SQL and Python outputs

---

# Test Environment

| Component             | Environment      |
| --------------------- | ---------------- |
| Dashboard             | Power BI Desktop |
| Validation Source     | SQL Queries      |
| Analytical Validation | Python Notebooks |
| Browser               | Google Chrome    |
| Operating System      | Windows 11       |

---

# UAT Test Cases

| TC-ID  | Area       | Test Description                                    | Expected Result                      | Status |
| ------ | ---------- | --------------------------------------------------- | ------------------------------------ | ------ |
| TC-001 | Page 1     | Weekly Active Buyers matches SQL Q32 within 1%      | WAB value matches SQL output         | Pass   |
| TC-002 | Page 1     | All 5 KPI cards display correctly                   | Cards visible without blanks         | Pass   |
| TC-003 | Page 1     | Traffic light colors reflect RAG status correctly   | Red when below target                | Pass   |
| TC-004 | Page 2     | Funnel shows five stages                            | Five stages visible                  | Pass   |
| TC-005 | Page 2     | Stage conversion percentages mathematically correct | Each stage ≤ prior stage             | Pass   |
| TC-006 | Page 2     | Revenue at Risk calculation                         | ±5% tolerance                        | Pass   |
| TC-007 | Page 2     | Device filter updates all visuals                   | All visuals refresh                  | Pass   |
| TC-008 | Page 2     | Cart abandonment sorted descending                  | Highest rate displayed first         | Pass   |
| TC-009 | Page 3     | Month-0 retention equals 100%                       | All cohorts show 100%                | Pass   |
| TC-010 | Page 3     | D30 benchmark line visible                          | Horizontal line at 28%               | Pass   |
| TC-011 | Page 3     | LTV curves increase monotonically                   | No negative dips                     | Pass   |
| TC-012 | Page 4     | SRM status matches notebook result                  | Matches NB04                         | Pass   |
| TC-013 | Page 4     | P-value formatting                                  | Three decimal places                 | Pass   |
| TC-014 | Page 4     | Revenue impact formula visible                      | Tooltip or annotation present        | Pass   |
| TC-015 | Page 4     | Experiment pipeline table loads                     | Five or more rows displayed          | Pass   |
| TC-016 | Page 5     | Segment distribution totals 100%                    | Donut chart equals 100%              | Pass   |
| TC-017 | Page 5     | Segment colors consistent                           | Scatter and legend match             | Pass   |
| TC-018 | Page 6     | LTV:CAC benchmark line visible                      | Benchmark at 3x                      | Pass   |
| TC-019 | Page 6     | What-If parameter works                             | Revenue updates dynamically          | Pass   |
| TC-020 | Page 6     | Forecast shows three scenarios                      | Three distinct bands visible         | Pass   |
| TC-021 | Page 7     | Gantt chart displays correctly                      | Five initiatives across twelve weeks | Pass   |
| TC-022 | Page 7     | Priority matrix quadrants visible                   | Four labels displayed                | Pass   |
| TC-023 | Cross-page | Navigation buttons work                             | All seven pages accessible           | Pass   |
| TC-024 | Cross-page | Theme consistency                                   | Executive Blue theme across pages    | Pass   |
| TC-025 | Data       | Revenue matches SQL Q35                             | ±1% tolerance                        | Pass   |
| TC-026 | Data       | Cohort matrix matches NB03                          | ±2% tolerance                        | Pass   |
| TC-027 | Data       | A/B test conversion matches NB04                    | Exact match                          | Pass   |
| TC-028 | Data       | Segment counts match SQL Q16                        | ±5% tolerance                        | Pass   |
| TC-029 | UX         | Dashboard load performance                          | Loads within 10 seconds              | Pass   |
| TC-030 | UX         | Text readability                                    | No overlap or truncation             | Pass   |

---

# Test Execution Summary

| Metric           | Value |
| ---------------- | ----- |
| Total Test Cases | 30    |
| Passed           | 30    |
| Failed           | 0     |
| Pass Rate        | 100%  |
| Critical Defects | 0     |
| High Defects     | 0     |
| Medium Defects   | 1     |
| Low Defects      | 2     |

---

# Validation Sources

| Area               | Validation Method    |
| ------------------ | -------------------- |
| Revenue            | SQL Query Validation |
| Customer Segments  | SQL Validation       |
| Cohort Analysis    | Python Notebook NB03 |
| Experiment Results | Python Notebook NB04 |
| Forecasting        | Python Notebook NB05 |
| KPI Calculations   | DAX Cross-Validation |

---

# Business Acceptance Criteria

The dashboard is considered accepted when:

* All test cases pass.
* No critical defects remain.
* Data accuracy exceeds 95%.
* Dashboard performance meets SLA.
* Stakeholders approve the solution.

---

# Final UAT Status

```text
PASSED – APPROVED FOR FINAL DELIVERY
```

---

# Conclusion

The GrowthLens platform successfully passed User Acceptance Testing with a **100% pass rate**, demonstrating accurate analytics, consistent KPI calculations, strong usability, and readiness for executive presentation and portfolio publication.
