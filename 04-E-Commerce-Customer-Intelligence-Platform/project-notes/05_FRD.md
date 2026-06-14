# 05_FRD

# Functional Requirements Document (FRD)

---

## FR-01 — Executive KPI Monitoring

### System Behaviour

The system shall display executive KPI cards for revenue, orders, customer satisfaction, SLA, profitability, and customer intelligence.

### Input Required

* master_orders dataset
* rfm_segments dataset

### Expected Output

* KPI cards updated dynamically based on filters and slicers

### Validation Rules

* KPI values must match SQL outputs
* RAG thresholds must apply correctly

### Error Handling

If KPI data is unavailable:

* Display "No Data Available"
* Prevent dashboard crash

---

## FR-02 — RFM Customer Segmentation

### System Behaviour

The system shall segment customers into:

* Champions
* Loyal
* Potential Loyalist
* At-Risk
* Lost
* Needs Attention

### Input Required

* Recency
* Frequency
* Monetary values

### Expected Output

* Donut chart
* Segment summary
* Customer counts

### Validation Rules

* Segment count must align with Python output
* Monthly refresh supported

### Error Handling

If segmentation file is missing:

* Display segmentation unavailable message

---

## FR-03 — Customer Intelligence Dashboard

### System Behaviour

The system shall provide customer-level insights including retention and acquisition analysis.

### Input Required

* customer_id
* order history
* RFM outputs

### Expected Output

* Acquisition trends
* CLV indicators
* Repeat purchase metrics

### Validation Rules

* Charts update dynamically with slicers

### Error Handling

Missing customer data should not break visuals.

---

## FR-04 — Seller SLA Compliance Monitoring

### System Behaviour

The system shall monitor delivery performance and seller SLA compliance.

### Input Required

* delivery_days
* is_late

### Expected Output

* SLA KPI
* Seller tier analysis
* Delivery performance visuals

### Validation Rules

* SLA compliance must remain between 0–100%

### Error Handling

Invalid delivery dates should be excluded.

---

## FR-05 — Product Profitability Analysis

### System Behaviour

The system shall display category-level profitability and complaint trends.

### Input Required

* price
* freight_value
* review_score

### Expected Output

* Margin analysis
* Complaint rate
* Category profitability visuals

### Validation Rules

* Net revenue calculation must exclude freight

### Error Handling

Missing category names should display as:
"Unknown"

---

## FR-06 — Revenue Forecasting

### System Behaviour

The system shall display projected revenue trends.

### Input Required

* forecast_output.csv

### Expected Output

* 3-month revenue forecast overlay

### Validation Rules

* Forecast values should align with Python model output

### Error Handling

If forecast file unavailable:

* Disable forecast visual gracefully

---

## FR-07 — What-If Simulation

### System Behaviour

The system shall allow users to simulate SLA improvement impact.

### Input Required

* SLA Improvement % parameter
* Late order revenue

### Expected Output

* Dynamic recovered revenue card

### Validation Rules

* Value updates immediately with slicer movement

### Error Handling

Invalid parameter values should revert to default.

---

## FR-08 — Stakeholder Reporting

### System Behaviour

The system shall provide stakeholder-ready dashboards.

### Input Required

* Business KPIs
* Operational KPIs
* Customer metrics

### Expected Output

* Executive-ready reporting pages

### Validation Rules

* Reports remain readable and interactive

### Error Handling

Missing visual data should show blank-safe visuals.
