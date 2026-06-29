
# 01_funnel_analysis

| Query | Business Question                                                             | Key Output                                            | Business Insight                                                                                                   |
| ----- | ----------------------------------------------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| Q01   | What is the end-to-end conversion funnel from browsing to completed purchase? | Users at each funnel stage and conversion percentages | Only 43.84% of initial visitors complete an order. Significant drop-off occurs before final purchase completion.   |
| Q02   | Do users on different device types convert differently?                       | Funnel metrics by device type                         | Desktop users account for the majority of conversions and represent the primary revenue-generating device segment. |
| Q03   | Which product categories attract the highest customer interest?               | Product views and unique users by category            | Intimates, Jeans, and Tops & Tees generate the highest customer engagement and browsing activity.                  |
| Q04   | How long does it take customers to convert after first engagement?            | Distribution of users by time-to-conversion bucket    | 73.22% of customers convert within one day, making the first 24 hours the most critical conversion window.         |
| Q05   | Which acquisition channels generate the highest-quality customers?            | Conversion rates by traffic source                    | Facebook has the highest conversion rate while Search drives the largest volume of converted customers.            |
| Q06   | How do new and returning customers differ in purchasing behavior?             | User distribution and average completed orders        | Returning customers represent only 11.94% of buyers but generate over twice as many orders per user.               |
| Q07   | What days and hours generate the highest purchase activity?                   | Completed orders, revenue, and AOV by day and hour    | Monday afternoon and Sunday daytime periods consistently produce the highest conversion activity and revenue.      |


# 02_cohort_retention

| Query # | Business Question                                                          | Key Output                                        | Business Insight                                                                                                                               |
| ------- | -------------------------------------------------------------------------- | ------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Q08     | How many users from each acquisition cohort return and purchase over time? | Cohort Month, Month Number, Retained Users        | Retention drops significantly after Month 0, indicating most customers purchase once and do not return frequently.                             |
| Q09     | Which acquisition cohorts generate the highest lifetime value?             | Revenue at 30, 60, 90, 180 and 365 days by cohort | Recent cohorts generate substantially higher LTV than earlier cohorts, indicating improved acquisition quality and monetization effectiveness. |
| Q10     | How does customer retention change across D7, D30 and D90 windows?         | D7, D30 and D90 Retention Rates by Cohort         | Retention improved dramatically during 2023–2024, suggesting stronger customer engagement and acquisition quality.                             |
| Q11     | What characteristics define the highest LTV cohort?                        | Traffic Source, Gender, Age Distribution          | The highest-value cohort (Jan 2024) was dominated by Search-acquired users with a balanced gender mix and average age around 41 years.         |
| Q12     | Which product categories generate the most loyal customers?                | Repeat Purchase Rate by Category                  | Intimates, Underwear, and Socks demonstrate the strongest repeat purchase behavior and customer loyalty.                                       |
| Q13     | At what point do customers typically churn?                                | Churn Rate by Session Count                       | Churn drops below 50% after approximately 5 sessions, making the fifth session a critical retention milestone.                                 |
| Q14     | How much revenue comes from loyal customers versus newer customers?        | Revenue Contribution by Customer Age Segment      | Customers acquired more than 6 months ago generate 88.86% of total revenue, highlighting the importance of retention and loyalty programs.     |



# 03_behavioral_segmentation


| Query # | Business Question | Key Output | Business Insight |
|----------|------------------|------------|------------------|
| Q15 | How can customers be ranked using Recency, Frequency, and Monetary value? | RFM scores and total customer score | RFM scoring identifies the most valuable customers and provides the foundation for customer segmentation. |
| Q16 | How are customers distributed across RFM segments? | Champions: 4,330, Loyal: 5,662, At Risk: 6,463, Lost: 8,989 | Lost Customers represent the largest segment, indicating significant retention opportunities. |
| Q17 | How do Window Shoppers differ from Intent Buyers? | Intent Buyers: 80,044 users, 100% conversion | The cleaned dataset primarily contains buyers, making behavioral comparison with Window Shoppers limited. |
| Q18 | What are the demographic and acquisition characteristics of Champion customers? | 71.52% of Champions acquired via Search | Search is the strongest acquisition channel for high-value customers and should receive continued investment. |
| Q19 | Which customers are at risk of churn and how much revenue is at stake? | 6,463 At-Risk Customers, ₹904,349 Revenue At Risk | A large inactive customer segment represents significant recoverable revenue through reactivation campaigns. |
| Q20 | What browsing paths do users follow before purchase? | Department → Product → Cart → Purchase is the dominant path | Customers frequently compare products before purchasing; cart optimization can improve conversions. |


# A/B Testing (Queries 21–26)

| Query # | Business Question | Key Output | Business Insight |
|----------|------------------|------------|------------------|
| Q21 | Was traffic split correctly between Control and Treatment groups? | Treatment 50.02%, Control 49.98% | No Sample Ratio Mismatch detected; experiment randomization is valid. |
| Q22 | Which experiment group achieved the higher conversion rate? | Control 12.11%, Treatment 11.96% | Treatment produced a negative conversion lift and underperformed Control. |
| Q23 | Did conversion performance change over time during the experiment? | Daily conversion trend by group | No novelty effect detected; Control consistently performed better throughout the experiment. |
| Q24 | How does experiment performance vary across customer segments? | New vs Returning User conversion analysis | Treatment underperformed for most New Users but showed isolated gains among Returning Users. |
| Q25 | What is the overall experiment lift? | Absolute Lift -0.15%, Relative Lift -1.24% | Treatment reduced conversion performance and should not be deployed. |
| Q26 | What is the projected revenue impact of deploying Treatment? | Annual Revenue Impact = -₹1,285,883 | A small conversion decline would result in more than ₹1.28 million annual revenue loss. |

# Unit Economics (Queries 27–31)

| Query # | Business Question | Key Output | Business Insight |
|----------|------------------|------------|------------------|
| Q27 | Which acquisition channels generate the highest customer lifetime value? | Facebook LTV365 = 16.09 (highest) | Facebook acquires the most valuable customers, while Search generates the largest total revenue. |
| Q28 | Which channels have the highest customer acquisition cost? | Facebook CAC = 8.60, Organic CAC = 0.66 | Organic and Email are the most acquisition-efficient channels. |
| Q29 | Which channels produce the best LTV:CAC ratios? | Organic = 20.85, Email = 4.50 | Organic and Email generate the strongest acquisition economics and profitability. |
| Q30 | Is customer acquisition efficiency improving over time? | CAC declined across all channels | Marketing efficiency improved substantially between Aug 2023 and Jan 2024. |
| Q31 | How much revenue is at risk from dormant customers? | ₹1.75M revenue at risk from 180+ day inactive users | Customer reactivation campaigns represent a significant revenue recovery opportunity. |

# Executive KPIs (Queries 32–35)

| Query # | Business Question | Key Output | Business Insight |
|----------|------------------|------------|------------------|
| Q32 | How has the Weekly Active Buyer (North Star Metric) evolved over time? | Weekly Active Buyers grew from 1 (2019) to a peak of 891 (Jan 2024) | Strong long-term growth indicates successful scaling of customer acquisition, engagement, and retention efforts. |
| Q33 | What drives monthly user growth? | Jan 2024: 1,891 New Users, 57 Retained Users, 146 Resurrected Users | Growth is primarily acquisition-driven, with reactivation contributing an increasing share of overall growth. |
| Q34 | Which products generate the highest revenue and how are they growing YoY? | Top product revenue: $2,709 (The North Face Apex Bionic Jacket) | Premium outerwear, suits, and performance apparel are the strongest product growth drivers. |
| Q35 | What are the company's headline executive KPIs? | Revenue = $2.72M, Conversion Rate = 27.7%, LTV:CAC = 2.97 | Business performance is strong, but improving retention and repeat purchases presents the biggest profitability opportunity. |