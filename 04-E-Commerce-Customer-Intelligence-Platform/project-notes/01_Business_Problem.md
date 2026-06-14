# 01_Business_Problem

## Background Context

The Brazilian e-commerce market generates high transaction volumes across multiple customer segments, sellers, and product categories. However, business stakeholders often face challenges in consolidating operational, financial, customer, and delivery data into a single decision-making platform.

The Olist e-commerce dataset contains customer, order, payment, product, seller, review, and logistics information, providing an opportunity to build an end-to-end Business Intelligence solution for revenue analysis, customer intelligence, operational performance, and strategic planning.

This project was initiated to design an analytics platform that transforms raw transactional data into actionable business insights for executive stakeholders.

---

## Problem Statement

The organization lacks a centralized analytics framework to monitor revenue performance, customer behavior, seller efficiency, delivery SLA compliance, and product profitability, resulting in slower business decision-making.

---

## Business Objectives

1. Build a centralized Business Intelligence platform for executive decision-making.

2. Monitor revenue growth, profitability, and operational KPIs.

3. Identify high-value and at-risk customer segments using RFM segmentation.

4. Improve customer retention through targeted business recommendations.

5. Analyze seller performance and SLA compliance.

6. Evaluate product profitability and complaint trends.

7. Forecast short-term revenue performance for strategic planning.

8. Enable stakeholder-specific reporting through interactive dashboards.

---

## Scope

### In Scope

* Data cleaning and feature engineering
* SQL business analysis
* Customer segmentation (RFM)
* Revenue forecasting
* KPI tracking and governance
* Power BI executive dashboard
* Delivery SLA analysis
* Product profitability analysis
* Stakeholder reporting
* Business process modeling (BPMN)
* Star schema data architecture

### Out of Scope

* Real-time streaming analytics
* Production deployment
* Automated cloud refresh pipelines
* Predictive machine learning personalization
* Multi-country currency conversion
* Live CRM integration

---

## Success Criteria

The project will be considered successful if:

1. Executive stakeholders can monitor critical KPIs through Power BI dashboards.

2. Customer segmentation accurately identifies high-value and at-risk customers.

3. Revenue, delivery, and customer metrics align with SQL and Python outputs.

4. Business recommendations produce measurable improvement opportunities.

5. Stakeholders can make faster data-driven decisions using a centralized platform.

6. Dashboard performance remains responsive for datasets exceeding 100K rows.

---

## Assumptions and Constraints

### Assumptions

* Dataset quality is sufficient for business analytics.
* Historical order data represents realistic business behavior.
* Customer review scores are reliable indicators of satisfaction.
* Low review scores may indicate return or complaint likelihood.

### Constraints

* Dataset contains minor null values.
* Customer IDs represent unique purchase behavior limitations.
* Forecasting model accuracy is limited by seasonality constraints.
* Project timeline limited delivery to a 21-day sprint schedule.
