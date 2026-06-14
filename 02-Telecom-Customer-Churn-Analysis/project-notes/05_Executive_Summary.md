# Executive Summary — IBM Telecom Customer Churn Analysis

## Core Business Problem

The telecom company is experiencing **high customer churn (26.54%)**, resulting in revenue leakage, reduced customer lifetime value (CLV), increased acquisition costs, and weaker long-term profitability.

Out of **7,043 total customers**, approximately **1,869 customers churned**, representing a significant business risk and an estimated **$139.13K revenue-at-risk exposure**.

The objective of this analysis was to identify:

* Why customers are leaving
* Which customer segments are most at risk
* What operational and behavioral factors drive churn
* Which business interventions can improve customer retention and revenue stability

---

## Key Root Causes of Customer Churn

Based on SQL analysis, Power BI dashboards, and customer segmentation, churn is primarily driven by the following business factors:

### 1. Short-Term Contracts (Primary Churn Driver)

Customers using **Month-to-Month contracts exhibit significantly higher churn behavior** than one-year and two-year contract subscribers.

**Findings:**

* Month-to-Month churners: **1,655**
* One-Year churners: **166**
* Two-Year churners: **48**

**Business implication:**

Customers on short-term contracts demonstrate lower commitment and can easily switch providers, making contract duration one of the strongest predictors of churn.

---

### 2. Fiber Optic + Month-to-Month Customers (Highest Risk Segment)

The **highest-risk customer segment** consists of:

> Month-to-Month + Fiber Optic + No Tech Support customers

Fiber Optic users demonstrate the highest churn behavior despite being premium subscribers.

**Findings:**

* Fiber Optic churners: **1,297**
* DSL churners: **469**
* No internet service churners: **113**

**Business implication:**

Premium customers may be dissatisfied with:

* Pricing
* Service quality
* Customer support experience
* Perceived value received

This segment presents one of the highest revenue recovery opportunities.

---

### 3. Lack of Tech Support

Customers **without Tech Support churn significantly more** than supported customers.

**Findings:**

* No Tech Support churners: **1,446**
* Tech Support users churned: **310**

**Business implication:**

Poor issue resolution and lack of proactive customer assistance increase dissatisfaction and switching behavior.

---

### 4. High Monthly Charges

Customers paying **higher monthly charges demonstrate substantially higher churn behavior**, suggesting increased price sensitivity.

**Business implication:**

Customers may perceive service costs as unjustified relative to the experience and value received.

Pricing transparency and premium service quality improvements may reduce churn risk.

---

### 5. Weak Early Customer Retention

Customers within the **first 0–12 months tenure period** demonstrate the highest churn risk.

**Findings:**

* 0–12 months churners: **1,037**
* 13–24 months churners: **294**
* 25–48 months churners: **325**
* 49–72 months churners: **213**

**Business implication:**

Weak onboarding, poor early engagement, or unmet customer expectations may result in early customer drop-off before long-term retention develops.

---

### 6. High-Risk Customer Segments

The following customer groups exhibit elevated churn risk:

* Senior citizens
* Customers without partners
* Customers without dependents
* Month-to-Month subscribers
* Customers without Tech Support
* High monthly charge customers
* Fiber Optic subscribers

---

## Factors With Minimal Business Impact

### Gender

Customer churn remains **nearly identical across male and female customers**.

**Business implication:**

Retention strategies should focus on **behavioral, pricing, service quality, and support factors rather than demographic assumptions**.

---

## Business Recommendations (Quantified Impact)

### 1. Promote Long-Term Contracts

Convert Month-to-Month customers to annual contract plans.

Targeting just **15% of the 1,655 Month-to-Month churners** could retain approximately **248 customers**, resulting in an estimated **$192.7K annual revenue recovery**.

**Recommended actions:**

* Contract upgrade discounts
* Annual subscription incentives
* Bundled pricing benefits

---

### 2. Improve Fiber Optic Customer Experience

Fiber Optic customers represent the highest churn category.

Retaining **15% of the 1,297 churned Fiber Optic users** could preserve approximately **195 customers**, recovering nearly **$151.5K annually**.

**Recommended actions:**

* Improve premium service reliability
* Strengthen support responsiveness
* Investigate pricing dissatisfaction

---

### 3. Expand Tech Support Adoption

Customers without Tech Support exhibit elevated churn risk.

Retaining **15% of the 1,446 churned unsupported customers** may preserve **217 customers**, generating approximately **$168.6K annual revenue recovery**.

**Recommended actions:**

* Free Tech Support trial period
* Discounted support bundles
* Faster issue resolution systems

---

### 4. Strengthen Early Customer Retention

Customers within **0–12 months tenure** represent the most vulnerable group.

Retaining **15% of the 1,037 churned early-tenure customers** could preserve **156 customers**, recovering approximately **$121.2K annually**.

**Recommended actions:**

* New customer onboarding campaigns
* First-year loyalty programs
* Early engagement touchpoints

---

### 5. Encourage Automatic Payment Methods

Electronic Check users demonstrate the highest payment-related churn behavior.

Retaining **15% of the 1,071 churned Electronic Check users** could retain approximately **161 customers**, preserving nearly **$125.1K annual revenue**.

**Recommended actions:**

* Auto-payment incentives
* Cashback offers
* Discounted recurring billing plans

---

## Expected Business Impact

If these recommendations are implemented, the telecom company may achieve:

* Reduced customer churn
* Increased customer retention
* Higher customer lifetime value (CLV)
* Improved customer satisfaction
* Reduced acquisition costs
* Improved revenue stability
* Estimated multi-hundred-thousand-dollar annual revenue recovery opportunity

---

## Final Conclusion

Customer churn is primarily driven by **behavioral and service-related factors rather than demographic characteristics**.

The strongest churn drivers include:

* Month-to-Month contracts
* Fiber Optic dissatisfaction
* Lack of Tech Support
* High monthly charges
* Weak early-stage retention

The analysis identifies a clear opportunity for **targeted retention strategies focused on high-risk customer segments**.

By implementing proactive retention programs, pricing improvements, better support services, and contract incentives, the telecom company can significantly improve customer retention, reduce churn, and recover substantial recurring revenue.

Additionally, the company should promote value-added bundled services such as **Tech Support, Online Security, Online Backup, and Device Protection** to further improve customer stickiness and long-term loyalty.

## Business Case: Contract Migration Campaign

A targeted contract migration campaign focused on high-risk **Month-to-Month customers** presents a strong financial opportunity for churn reduction.

**Key business case findings:**

* Total high-risk Month-to-Month churners identified: **1,655**
* Estimated customer conversion at **10% adoption**: **166 customers retained**
* Average monthly revenue per churn-prone customer: **$74.50**
* Estimated **monthly revenue recovery: ~$12.4K**
* Estimated campaign cost (at **$20 incentive per customer**): **~$3.3K**
* Estimated **net monthly gain: ~$9.0K**
* Expected payback period: **less than 1 month (0.37 months)**

This demonstrates that a relatively low-cost retention incentive program could generate meaningful recurring revenue recovery while reducing customer churn among the highest-risk segment.
