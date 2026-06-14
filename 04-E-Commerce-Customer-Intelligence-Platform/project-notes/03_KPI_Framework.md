# 03_KPI_Framework

## KPI Governance Framework

---

## Financial KPIs

| KPI Name                  | Definition                      | Formula                       | Owner | Cadence | Target          | Data Source   |
| ------------------------- | ------------------------------- | ----------------------------- | ----- | ------- | --------------- | ------------- |
| Total Revenue             | Total revenue generated         | SUM(payment_value)            | CFO   | Monthly | R$15M+          | master_orders |
| Average Order Value (AOV) | Revenue per order               | Revenue / Orders              | CFO   | Monthly | R$150+          | master_orders |
| Gross Margin %            | Revenue retained after freight  | (Revenue − Freight) / Revenue | CFO   | Monthly | 85%+            | master_orders |
| Net Revenue               | Revenue after freight deduction | Revenue − Freight             | CFO   | Monthly | Positive Growth | master_orders |

### Financial KPI Thresholds

| KPI            | Green    | Amber   | Red      |
| -------------- | -------- | ------- | -------- |
| Total Revenue  | ≥15M     | 13–15M  | <13M     |
| AOV            | ≥150     | 120–149 | <120     |
| Gross Margin % | ≥85%     | 75–84%  | <75%     |
| Net Revenue    | Positive | Stable  | Negative |

---

## Operations KPIs

| KPI Name              | Definition                 | Formula                               | Owner              | Cadence | Target   | Data Source   |
| --------------------- | -------------------------- | ------------------------------------- | ------------------ | ------- | -------- | ------------- |
| Total Orders          | Total completed orders     | DISTINCTCOUNT(order_id)               | COO                | Weekly  | 100K+    | master_orders |
| On-Time Delivery %    | % delivered on time        | On-Time Orders / Total Orders         | COO                | Weekly  | 95%+     | master_orders |
| Late Delivery Rate    | % of delayed deliveries    | Late Orders / Total Orders            | Operations Manager | Weekly  | <5%      | master_orders |
| Avg Delivery Days     | Average delivery duration  | AVG(delivery_days)                    | COO                | Weekly  | ≤10 Days | master_orders |
| Seller SLA Compliance | Seller on-time performance | On-Time Deliveries / Total Deliveries | COO                | Weekly  | 95%+     | master_orders |

### Operations KPI Thresholds

| KPI                   | Green | Amber   | Red  |
| --------------------- | ----- | ------- | ---- |
| Total Orders          | ≥100K | 90–100K | <90K |
| On-Time Delivery %    | ≥95%  | 90–94%  | <90% |
| Late Delivery Rate    | <5%   | 5–10%   | >10% |
| Avg Delivery Days     | ≤10   | 10–14   | >14  |
| Seller SLA Compliance | ≥95%  | 90–94%  | <90% |

---

## Customer KPIs

| KPI Name             | Definition                   | Formula                            | Owner              | Cadence | Target | Data Source   |
| -------------------- | ---------------------------- | ---------------------------------- | ------------------ | ------- | ------ | ------------- |
| Avg Review Score     | Customer satisfaction score  | AVG(review_score)                  | CRM Manager        | Monthly | 4.0+   | master_orders |
| Complaint Rate %     | Low review rate (≤2)         | Low Reviews / Total Orders         | Operations Manager | Weekly  | <15%   | master_orders |
| Repeat Purchase Rate | Repeat customer %            | Repeat Customers / Total Customers | CRM Manager        | Monthly | 30%+   | rfm_segments  |
| Champions %          | Share of Champions customers | Champions / Customers              | CMO                | Monthly | 20%+   | rfm_segments  |
| At-Risk Customers    | Customers likely to churn    | RFM Segmentation                   | CRM Manager        | Monthly | <20K   | rfm_segments  |

### Customer KPI Thresholds

| KPI                  | Green | Amber   | Red  |
| -------------------- | ----- | ------- | ---- |
| Avg Review Score     | ≥4.0  | 3.5–3.9 | <3.5 |
| Complaint Rate %     | <15%  | 15–20%  | >20% |
| Repeat Purchase Rate | ≥30%  | 20–29%  | <20% |
| Champions %          | ≥20%  | 10–19%  | <10% |
| At-Risk Customers    | <20K  | 20K–25K | >25K |

---

## Forecasting KPI

| KPI Name                 | Definition                | Formula          | Owner        | Cadence | Target | Data Source     |
| ------------------------ | ------------------------- | ---------------- | ------------ | ------- | ------ | --------------- |
| Forecast Accuracy (MAPE) | Revenue forecast accuracy | Forecast Error % | Data Analyst | Monthly | <20%   | forecast_output |

### Forecast KPI Threshold

| KPI                      | Green | Amber  | Red  |
| ------------------------ | ----- | ------ | ---- |
| Forecast Accuracy (MAPE) | <20%  | 20–40% | >40% |

---

## KPI Governance Principles

### 1. Business Alignment

KPIs are aligned with executive decision-making.

### 2. Ownership

Every KPI has a defined business owner.

### 3. Reporting Cadence

KPIs are tracked weekly or monthly depending on impact.

### 4. RAG Monitoring

Green, Amber, and Red thresholds help quickly identify risks.

### 5. Data Reliability

KPIs are validated through SQL, Python, and Power BI outputs.
