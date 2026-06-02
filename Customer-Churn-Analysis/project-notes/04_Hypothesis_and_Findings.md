# Business Hypotheses & Expected Findings

Before beginning dashboard development, initial business assumptions were created based on stakeholder concerns and dataset structure.

These hypotheses will later be validated using Excel and Power BI analysis.

---

## Hypothesis 1 — Contract Type Drives Churn

### Business Assumption

Customers with **Month-to-Month contracts** are more likely to churn than customers with long-term contracts.

### Business Reason

Long-term contracts increase customer stickiness and reduce switching behavior.

### Expected Outcome

Month-to-Month customers will show the highest churn rate.

---

## Hypothesis 2 — High Monthly Charges Increase Churn

### Business Assumption

Customers paying higher monthly charges are more likely to leave the company.

### Business Reason

Higher pricing may increase dissatisfaction and price sensitivity.

### Expected Outcome

Customers with high monthly charges will have above-average churn.

---

## Hypothesis 3 — Service Quality Influences Churn

### Business Assumption

Customers without Tech Support or Online Security are more likely to churn.

### Business Reason

Poor service experience may reduce customer satisfaction.

### Expected Outcome

Customers lacking support-related services will have higher churn.

---

## Hypothesis 4 — Internet Service Type Influences Churn

### Business Assumption

Fiber Optic customers may churn more frequently than DSL customers.

### Business Reason

Higher expectations, pricing, or service dissatisfaction may influence churn behavior.

### Expected Outcome

Fiber Optic customers may show a higher churn percentage.

---

## Hypothesis 5 — Customer Demographics Influence Churn

### Business Assumption

Senior citizens or customers without family dependency may churn more frequently.

### Business Reason

Customer lifestyle and affordability may impact loyalty.

### Expected Outcome

Certain demographic groups may have higher churn rates.

## Hypothesis 6: Churn Risk Is Concentrated in the First 12 Months

### Hypothesis

Customers are more likely to churn during the early stages of their subscription lifecycle, particularly within the first 12 months.

### Finding: Validated ✅

The analysis confirms that **customer churn is heavily concentrated in the first 12 months of tenure**.

Key findings:

* **0–12 Months:** Churn Rate = **47.44%**
* **13–24 Months:** Churn Rate drops to **28.71%**
* **25–48 Months:** Churn Rate further declines to **20.39%**
* **49–72 Months:** Churn Rate reaches only **9.51%**

### Business Insight

The first year of customer tenure represents the **highest churn-risk period**. After 12 months, churn declines significantly, indicating that customers become more loyal over time.

### Business Recommendation

The telecom company should prioritize:

* Strong onboarding programs
* Early customer engagement campaigns
* First-year loyalty offers
* Proactive support during the first 12 months

Reducing churn during the first year can significantly improve long-term customer retention and customer lifetime value.
## Hypothesis 7: Customers with bundled services (3+) churn less than single-service customers

**Hypothesis:**  
Customers using bundled services (3 or more add-on services) churn less than customers with fewer services.

**Validation:**  
Service Bundle Analysis showed that customers with 0–2 services had higher churn rates, while customers with 3+ services demonstrated significantly lower churn behavior.

**Key Finding:**  
Customers with bundled services are more likely to stay due to higher product dependency and switching costs.

**Status:** ✅ Confirmed

---

## Hypothesis 8: Fiber Optic customers paying high monthly charges (>$80) have the highest churn

**Hypothesis:**  
Fiber Optic customers with high monthly charges are more likely to churn.

**Validation:**  
Cross-analysis of Internet Service, Monthly Charge Group, and Churn Rate showed that high-paying Fiber Optic customers exhibited the highest churn concentration.

**Key Finding:**  
Customers paying premium charges for Fiber Optic services may have higher expectations, making them more sensitive to pricing and service dissatisfaction.

**Status:** ✅ Confirmed

## Initial Findings

### Churn Overview

* Total Customers: **7,043**
* Customers Churned: **1,869**
* Customers Retained: **5,174**
* Overall Churn Rate: **26.5%**

### Initial Business Interpretation

The company is experiencing a high churn rate, with approximately **1 in 4 customers leaving the service**, indicating a significant customer retention issue requiring immediate investigation.

### Contract Type vs Churn

| Contract Type  | Churned Customers | Total Customers | Churn Rate |
| -------------- | ----------------- | --------------- | ---------- |
| Month-to-Month | 1,655             | 3,875           | 42.7%      |
| One Year       | 166               | 1,473           | 11.3%      |
| Two Year       | 48                | 1,695           | 2.8%       |

### Key Business Finding

Customers using **Month-to-Month contracts experience extremely high churn (42.7%)**, compared to customers on longer contracts.

This suggests that **lack of long-term commitment is a major driver of customer churn**.

### Business Recommendation (Initial)

Retention Team should encourage customers to shift from **Month-to-Month plans to annual plans** through loyalty discounts, upgrade offers, or bundled services.

### Payment Method vs Churn

| Payment Method   | Churned Customers | Total Customers | Churn Rate |
|----------------  |-------------------|-----------------|------------|
| Bank Transfer    | 258               | 1544            | 16.7%      |
| Credit Card      | 232               | 1522            | 15.2%      |
| Electronic Check | 1071              | 2365            | 45.3%      |
| Mailed Check     | 308               | 1612            | 19.1%      |

### Key Business Finding

Customers using **Electronic Check show the highest churn rate (45.3%)**, significantly higher than all other payment methods.

This indicates a potential issue related to **payment experience, billing friction, or customer convenience**.

### Business Recommendation (Initial)

Customer Retention Team should encourage customers to switch from **Electronic Check to AutoPay methods (Credit Card / Bank Transfer)** through incentives or discounts.

### Internet Service vs Churn

| Internet Service | Churned Customers | Total Customers | Churn Rate |
|------------------|-------------------|-----------------|------------|
| DSL              | 459               | 2421            | 19.0%      |
| Fiber Optic      | 1297              | 3096            | 41.9%      |
| No Internet      | 113               | 1526            | 7.4%       |

### Key Business Finding

Customers using **Fiber Optic internet experience extremely high churn (41.9%)**, which is more than double the churn rate of DSL users.

This suggests potential issues related to **pricing, customer expectations, service quality, or support experience**.

### Business Recommendation (Initial)

Customer Success Team should investigate **Fiber Optic customer complaints, pricing dissatisfaction, and service quality**, and consider retention offers for high-risk customers.

## Customer Tenure vs Churn

### Business Question
Does customer churn happen early in the customer lifecycle or after long-term service usage?

### Analysis Performed
Customer tenure was grouped into four business-friendly categories:

- 0–12 Months  
- 13–24 Months  
- 25–48 Months  
- 49–72 Months  

Churn distribution was analyzed across these tenure groups.

### Key Findings

| Tenure Group | Churned Customers | Total Customers | Observation |
|--------------|------------------|----------------- |-------------|
| 0–12 Months  | 1037             | 2186             | Highest churn risk |
| 13–24 Months | 294              | 1024             | Moderate churn |
| 25–48 Months | 325              | 1594             | Lower churn |
| 49–72 Months | 213              | 2239             | Lowest churn |

### Executive Insight

Customers are **most likely to churn within their first 12 months**, indicating a major issue in **early customer retention, onboarding experience, pricing satisfaction, or service expectations**.

Long-term customers (49–72 months) demonstrate **high loyalty and significantly lower churn behavior**.

### Business Recommendation

The telecom company should focus on:

- Improving onboarding experience for new customers  
- Offering first-year retention incentives  
- Providing proactive support during early subscription months  
- Introducing loyalty offers before customers reach churn risk stage

##  Monthly Charges vs Churn

### Business Question
Are customers with higher monthly charges more likely to churn?

### Analysis Performed
Monthly charges were grouped into business-friendly categories:

- 0–30  
- 31–60  
- 61–90  
- 91+  

Customer churn distribution was analyzed across these pricing groups.

### Key Findings

| Monthly Charge Group | Churned Customers | Total Customers | Observation |
|----------------------|------------------ |-----------------|-------------|
| 0–30                 | 162               | 1653            | Lowest churn |
| 31–60                | 328               | 1265            | Moderate churn |
| 61–90                | 809               | 2386            | Highest churn |
| 91+                  | 570               | 1739            | High churn |

### Executive Insight

Customers paying **higher monthly charges (61+) exhibit significantly higher churn behavior**, suggesting potential dissatisfaction with pricing, service value, or bundled offerings.

Lower-priced plans demonstrate substantially lower churn rates.

### Business Recommendation

The telecom company should:

- Improve perceived value for premium plans  
- Offer loyalty discounts for high-paying customers  
- Introduce premium customer retention programs  
- Review pricing-to-service satisfaction alignment
## Senior Citizen vs Churn

### Business Question

Do senior citizens churn more than non-senior customers?

### Analysis Performed

Customer churn behavior was analyzed based on senior citizen status.

Where:

* 0 = Non-Senior Customer
* 1 = Senior Citizen

### Key Findings

| Customer Segment   | Churned Customers | Total Customers | Approx. Churn Rate |
| ------------------ | ----------------- | --------------- | ------------------ |
| Non-Senior (0)     | 1393              | 5901            | ~24%               |
| Senior Citizen (1) | 476               | 1142            | ~42%               |

### Executive Insight

Senior citizens demonstrate a **significantly higher churn rate** compared to non-senior customers, making them a **high-risk customer segment**.

This may indicate challenges related to pricing, support accessibility, digital usability, or service satisfaction among older customers.

### Business Recommendation

The telecom company should:

* Introduce senior-friendly service plans
* Improve customer support accessibility
* Simplify onboarding and service management
* Launch targeted retention programs for senior customers

## Tech Support vs Churn

### Business Question

Does availability of tech support influence customer churn behavior?

### Analysis Performed

Customer churn was analyzed based on Tech Support subscription status.

Customer categories:

* Yes → Customer has tech support
* No → Customer does not have tech support
* No internet service → Internet service unavailable

### Key Findings

| Tech Support Status | Churned Customers | Total Customers | Observation        |
| ------------------- | ----------------- | --------------- | ------------------ |
| No                  | 1446              | 3473            | Highest churn risk |
| Yes                 | 310               | 2044            | Much lower churn   |
| No Internet Service | 113               | 1526            | Low churn          |

### Executive Insight

Customers **without tech support exhibit significantly higher churn behavior**, indicating that service assistance and issue resolution strongly influence customer retention.

Customers receiving tech support demonstrate substantially lower churn levels.

### Business Recommendation

The telecom company should:

* Promote tech support subscriptions for at-risk customers
* Improve customer issue resolution speed
* Introduce proactive customer assistance programs
* Bundle support services into retention plans

## Partner vs Churn

### Business Question

Does having a partner influence customer churn behavior?

### Analysis Performed

Customer churn behavior was analyzed based on partner status.

Customer categories:

* Yes → Customer has a partner
* No → Customer does not have a partner

### Key Findings

| Partner Status | Churned Customers | Total Customers | Approx. Churn Rate |
| -------------- | ----------------- | --------------- | ------------------ |
| No             | 1200              | 3641            | ~33%               |
| Yes            | 669               | 3402            | ~20%               |

### Executive Insight

Customers **without partners exhibit significantly higher churn behavior**, while customers with partners demonstrate greater retention and loyalty.

This suggests that individual customers may be more price-sensitive or less committed to long-term telecom plans.

### Business Recommendation

The telecom company should:

* Create retention offers for individual customers
* Introduce bundled/family plans
* Improve loyalty programs for single-user subscriptions
* Offer targeted discounts for high-risk customer segments

## Dependents vs Churn

### Business Question

Does having dependents influence customer churn behavior?

### Analysis Performed

Customer churn behavior was analyzed based on dependent status.

Customer categories:

* Yes → Customer has dependents
* No → Customer does not have dependents

### Key Findings

| Dependents Status | Churned Customers | Total Customers | Approx. Churn Rate |
| ----------------- | ----------------- | --------------- | ------------------ |
| No                | 1543              | 4933            | ~31%               |
| Yes               | 326               | 2110            | ~15%               |

### Executive Insight

Customers **without dependents exhibit significantly higher churn behavior**, while customers with dependents demonstrate greater retention and loyalty.

This suggests that customers with family responsibilities are more stable and less likely to switch telecom providers.

### Business Recommendation

The telecom company should:

* Create retention strategies for individual customers
* Introduce family/bundled plans
* Provide loyalty incentives for high-risk customer segments
* Offer customized plans for customers without dependents

## Gender vs Churn

### Business Question
Does gender influence customer churn behavior?

### Analysis Performed
Customer churn behavior was analyzed across gender categories.

Customer categories:

- Male  
- Female

### Key Findings

| Gender | Churned Customers | Total Customers | Approx. Churn Rate |
|------- |------------------ |-----------------|--------------------|
| Female | 939               | 3488            | ~27%               |
| Male   | 930               | 3555            | ~26%               |

### Executive Insight

Customer churn behavior remains **nearly identical across gender groups**, indicating that gender is **not a major churn driver**.

This suggests churn is more strongly influenced by service-related and behavioral factors such as contracts, pricing, internet service quality, tenure, and tech support.

### Business Recommendation

The telecom company should:

- Focus retention strategies on behavioral risk factors  
- Prioritize service quality, pricing, and customer support improvements  
- Avoid over-segmenting retention efforts based solely on gender

## Contract + Internet Service vs Churn

### Business Question
Which customer segment exhibits the highest churn risk when combining contract type and internet service?

### Analysis Performed
Customer churn behavior was analyzed by combining:

- Contract Type
- Internet Service Type

This helped identify the most vulnerable customer segment.

### Key Findings

| Contract Type  | Internet Service | Churned Customers | Total Customers | Observation        |
|----------------|------------------|------------------ |-----------------|-------------       |
| Month-to-Month | Fiber optic      | 1162              | 2128            | Highest churn risk |
| Month-to-Month | DSL              | 394               | 1223            | Moderate churn     |
| One Year       | Fiber optic      | 104               | 539             | Lower churn        |
| Two Year       | DSL              | 12                | 628             | Very low churn     |

### Executive Insight

The **highest-risk customer segment consists of Month-to-Month customers using Fiber Optic internet services**.

This indicates that premium internet users on short-term contracts may experience dissatisfaction related to pricing, service quality, or perceived value.

Long-term contracts significantly reduce churn risk across all internet service categories.

### Business Recommendation

The telecom company should:

- Target Month-to-Month Fiber Optic customers with retention campaigns  
- Improve premium internet service quality  
- Offer discounted upgrades to long-term contracts  
- Create loyalty incentives for high-value customers