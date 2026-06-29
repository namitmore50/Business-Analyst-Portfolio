## Q15: Full RFM Scoring with NTILE(5) Quintile Assignment

**Business Question:**  
Which customers are the most valuable based on Recency, Frequency, and Monetary (RFM) behavior?

**Methodology:**  
Calculated customer-level Recency (days since last purchase), Frequency (completed orders), and Monetary (total revenue). Applied NTILE(5) window functions to assign quintile scores and created a combined RFM score.

**Key Findings:**  
- Highest-value customers achieved the maximum RFM score of 15.
- Top customers combined recent purchases, multiple transactions, and high spending.
- Several users generated more than $1,000 in cumulative revenue.
- Champions consistently ranked in the highest quintile across all three dimensions.
- RFM scoring provides the foundation for customer segmentation and retention strategies.

**Business Impact:**  
Enables identification of high-value customers for loyalty campaigns, VIP targeting, retention programs, and personalized marketing initiatives.
## Query 16: RFM Segment Classification

### Objective
Classify customers into actionable business segments using RFM scores.

### Key Findings
- Lost Customers: 8,989 users (32.45%)
- At Risk: 6,463 users (23.33%)
- Loyal Customers: 5,662 users (20.44%)
- Champions: 4,330 users (15.63%)
- Potential Loyalists: 2,259 users (8.15%)

### Business Insight
The customer base is heavily concentrated in Lost and At Risk segments, representing 55.78% of users. Retention and reactivation campaigns could generate substantial incremental revenue. Champions and Loyal Customers should be targeted with loyalty and VIP programs to maximize lifetime value.

## Query 17: Window Shopper vs Intent Buyer Behavioral Comparison

### Key Finding
All analyzed users were classified as Intent Buyers.

### Business Insight
The cleaned dataset contains only users who completed purchase journeys. Window Shopper behavior is not represented in the available data, preventing direct comparison between browsing-only and purchasing users.

### Recommendation
Future behavioral analysis should be performed on raw event data before funnel filtering to preserve browsing-only customer journeys.

## Query 18: Champions Segment Profile

### Key Finding
More than 71% of Champion customers were acquired through Search channels.

### Business Insight
Search consistently attracts the highest-value customers. Champion customers exhibit balanced gender representation and an average age near 41 years, indicating broad demographic appeal.

### Recommendation
Increase investment in high-performing Search campaigns and identify keywords, landing pages, and acquisition journeys associated with Champion customers.
## Query 19: At-Risk Segment Analysis

### Key Finding
6,463 customers have not purchased in over 365 days, representing ₹904,349.30 in potential recoverable revenue.

### Business Insight
The At-Risk segment contains customers who previously demonstrated purchasing behavior but have become inactive. This group represents one of the highest ROI opportunities for retention and reactivation campaigns.

### Recommendation
Launch win-back campaigns, personalized offers, email reactivation programs, and targeted discounts to recover lost customers and reduce revenue leakage.
## Query 20: Product Browsing Sequence Analysis

### Key Finding
The most common customer path is Department → Product → Cart → Purchase.

### Business Insight
Customers frequently revisit products and categories before completing purchases, indicating active comparison behavior. Cart abandonment opportunities exist because many users return to browsing instead of proceeding directly to checkout.

### Recommendation
Improve cart UX, display product recommendations inside cart, and reduce checkout friction to increase purchase completion rates.