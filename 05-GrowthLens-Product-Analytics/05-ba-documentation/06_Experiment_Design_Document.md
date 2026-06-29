# Experiment Design Document

**Project:** GrowthLens – Customer Intelligence & Product Analytics Platform
**Version:** 1.0
**Date:** 24 June 2026
**Author:** Namit More
**Status:** Final

---

# Table of Contents

1. Experiment Background & Context
2. Hypothesis Statement
3. Primary Metric
4. Guardrail Metrics
5. Sample Size Calculation
6. Experiment Design
7. Sample Ratio Mismatch (SRM) Protocol
8. Analysis Plan
9. Decision Framework
10. Actual Results
11. Decision and Business Impact Estimate
12. Revision History

---

# Revision History

| Version | Date        | Author     | Description   |
| ------- | ----------- | ---------- | ------------- |
| 0.1     | 23-Jun-2026 | Namit More | Initial Draft |
| 1.0     | 24-Jun-2026 | Namit More | Final Version |

---

# 1. Experiment Background & Context

The Product Team proposed a redesigned landing page intended to improve customer conversion rates by simplifying navigation and reducing friction during product discovery.

The objective of this experiment is to determine whether the new experience results in a statistically significant improvement in purchase conversion without negatively impacting other critical business metrics.

---

# Business Problem

Current conversion performance is below industry benchmarks and limits revenue growth.

The organization requires a data-driven framework to validate product changes before full-scale deployment.

---

# Experiment Objective

Determine whether the redesigned experience increases customer conversion rates by at least 20% relative to the existing experience.

---

# 2. Hypothesis Statement

## Null Hypothesis (H₀)

```text id="hn4m6g"
The conversion rate of the treatment group is equal to the conversion rate of the control group.
```

Mathematically:

```text id="d6dwwx"
H₀: p_treatment = p_control
```

---

## Alternative Hypothesis (H₁)

```text id="krn3gm"
The conversion rate of the treatment group is higher than the conversion rate of the control group.
```

Mathematically:

```text id="lj1mfy"
H₁: p_treatment > p_control
```

---

# 3. Primary Metric

## Conversion Rate (CVR)

### Definition

```text id="khjlwm"
Conversion Rate = Purchases / Unique Visitors
```

### Success Metric

A successful experiment requires:

* Positive lift
* Statistical significance
* No guardrail metric deterioration

---

# 4. Guardrail Metrics

The following metrics must not deteriorate during the experiment.

| Metric                    | Purpose                         |
| ------------------------- | ------------------------------- |
| Average Order Value (AOV) | Prevent low-quality conversions |
| Bounce Rate               | Detect engagement deterioration |
| Error Rate                | Detect technical issues         |
| Time on Page              | Measure user experience impact  |

---

# Success Condition

All guardrail metrics must remain within acceptable thresholds.

---

# 5. Sample Size Calculation

## Assumptions

| Parameter                 | Value |
| ------------------------- | ----- |
| Baseline Conversion Rate  | 1.8%  |
| Minimum Detectable Effect | 0.36% |
| Relative Lift             | 20%   |
| Alpha                     | 0.05  |
| Statistical Power         | 0.80  |

---

## Required Sample Size

```text id="92g7ek"
Required Sample Size Per Group:
[Insert value from NB04]
```

---

## Estimated Duration

```text id="93ojp7"
Experiment Duration Required:
[Insert number of days from NB04]
```

---

# 6. Experiment Design

| Parameter       | Design                       |
| --------------- | ---------------------------- |
| Split           | 50 / 50                      |
| Randomization   | User-level random assignment |
| Stratification  | Not required                 |
| Experiment Unit | Unique Visitor               |
| Experiment Type | Controlled Online Experiment |

---

## Allocation

```text id="0l4n8m"
50% → Control Group
50% → Treatment Group
```

---

# Experiment Exposure Rules

1. Users remain in their assigned group.
2. Internal users are excluded.
3. Bots and test traffic are excluded.
4. Duplicate sessions are ignored.

---

# 7. Sample Ratio Mismatch (SRM) Protocol

## Checks

1. Compare traffic allocation between groups.
2. Verify assignment mechanism.
3. Investigate tracking failures.

---

## Escalation Conditions

Escalate if:

```text id="38v4ta"
Observed allocation differs significantly from 50/50.
```

or

```text id="58o4qg"
SRM p-value < 0.05
```

---

# Actions

1. Pause experiment.
2. Investigate assignment pipeline.
3. Re-run experiment if necessary.

---

# 8. Analysis Plan

## Analysis Timing

Analysis will occur only after:

* Required sample size is achieved.
* Minimum experiment duration is completed.

---

## Statistical Test

```text id="c2pxp4"
Two-Proportion Z-Test
```

---

## Confidence Level

```text id="by5wxu"
95%
```

---

## Multiple Testing Correction

If multiple experiments run simultaneously:

```text id="btkoh0"
Bonferroni Correction
```

will be applied.

---

# 9. Decision Framework

## Roll Out

Conditions:

* p-value < 0.05
* No SRM detected
* No guardrail violations
* Lift exceeds MDE

---

## Do Not Roll Out

Conditions:

* p-value > 0.10
* Guardrail metrics deteriorate

---

## Run Longer

Conditions:

* 0.05 ≤ p-value ≤ 0.10
* Required sample size not achieved

---

# Decision Matrix

| Result                    | Action          |
| ------------------------- | --------------- |
| Significant Positive Lift | Roll Out        |
| Inconclusive              | Run Longer      |
| Negative or Harmful       | Do Not Roll Out |

---

# 10. Actual Results

**(Populate after NB04 analysis.)**

| Metric                    | Value         |
| ------------------------- | ------------- |
| Control Conversion Rate   | [NB04 Result] |
| Treatment Conversion Rate | [NB04 Result] |
| Absolute Lift             | [NB04 Result] |
| Relative Lift             | [NB04 Result] |
| p-value                   | [NB04 Result] |
| Confidence Interval       | [NB04 Result] |
| SRM Status                | [NB04 Result] |
| Decision                  | [NB04 Result] |

---

# 11. Decision and Business Impact Estimate

Based on the experiment results:

```text id="8y0bpn"
[Insert final recommendation from NB04]
```

---

## Estimated Business Impact

| Metric                     | Estimate      |
| -------------------------- | ------------- |
| Additional Monthly Revenue | [NB04 Result] |
| Annual Revenue Opportunity | [NB04 Result] |
| Estimated ROI              | [NB04 Result] |

---

# Recommendation

```text id="t9ln4h"
[ROLL OUT / DO NOT ROLL OUT / RUN LONGER]
```

---

# Conclusion

This experiment establishes a rigorous and statistically sound framework for evaluating product changes. The findings enable stakeholders to make evidence-based decisions and quantify the expected business impact prior to full deployment.
