# 07_Acceptance_Criteria

# User Story Acceptance Criteria (Gherkin Format)

---

## US-01 Acceptance Criteria — RFM Segmentation

**GIVEN** I am on the Customer Intelligence dashboard
**WHEN** I click on the "At-Risk" segment in the donut chart
**THEN** the customer metrics should filter to show only At-Risk customers
**AND** KPI cards should update dynamically
**AND** segment count should match Python RFM output within ±5%

---

## US-02 Acceptance Criteria — Executive KPI Monitoring

**GIVEN** I am on the Executive Overview page
**WHEN** the dashboard loads
**THEN** all KPI cards should display valid values
**AND** slicers should dynamically update KPIs
**AND** revenue values should align with SQL outputs

---

## US-03 Acceptance Criteria — SLA Monitoring

**GIVEN** I am on the Operations & SLA page
**WHEN** I view the SLA dashboard
**THEN** on-time delivery percentage should be displayed
**AND** seller tier chart should show Gold, Silver, and At-Risk tiers
**AND** SLA values must remain between 0–100%

---

## US-04 Acceptance Criteria — At-Risk Customer Detection

**GIVEN** I am on the Customer Intelligence dashboard
**WHEN** I select the At-Risk segment
**THEN** At-Risk customer metrics should display correctly
**AND** customer counts should align with segmentation outputs

---

## US-05 Acceptance Criteria — Revenue & Margin Monitoring

**GIVEN** I am on the Product Profitability dashboard
**WHEN** I view financial KPI cards
**THEN** Total Revenue, Margin %, and Avg Price should display correctly
**AND** values should align with SQL analysis

---

## US-06 Acceptance Criteria — Seller Tier Monitoring

**GIVEN** I am on the Operations dashboard
**WHEN** I view seller performance
**THEN** seller tiers should display SLA compliance percentages
**AND** Gold sellers should outperform At-Risk sellers

---

## US-07 Acceptance Criteria — Product Profitability

**GIVEN** I am on the Product Profitability page
**WHEN** I analyze category charts
**THEN** top-performing and low-performing categories should be visible
**AND** complaint rate visuals should load successfully

---

## US-08 Acceptance Criteria — Revenue Forecasting

**GIVEN** I am on the Executive Overview dashboard
**WHEN** forecast data loads
**THEN** the monthly revenue chart should show a forecast overlay
**AND** forecast values should align with Python outputs

---

## US-09 Acceptance Criteria — SLA What-If Simulation

**GIVEN** I am on the Operations & SLA page
**WHEN** I adjust the SLA Improvement % slider
**THEN** recovered revenue should update dynamically
**AND** calculations should respond instantly

---

## US-10 Acceptance Criteria — Executive Reporting

**GIVEN** I am using the dashboard
**WHEN** I navigate across pages
**THEN** all dashboards should remain responsive
**AND** stakeholders should be able to access required insights
**AND** filters should work consistently across visuals
