/* =========================================================
   QUERY 08: MONTHLY COHORT RETENTION MATRIX
========================================================= */

WITH user_cohort AS (

    SELECT
        user_id,
        DATE(
            MIN(created_at),
            'start of month'
        ) AS cohort_month
    FROM orders
    WHERE status = 'Complete'
    GROUP BY user_id

),

user_activity AS (

    SELECT
        o.user_id,
        DATE(
            o.created_at,
            'start of month'
        ) AS activity_month
    FROM orders o
    WHERE o.status = 'Complete'

),

cohort_data AS (

    SELECT
        uc.cohort_month,
        ua.activity_month,

        (
            (CAST(strftime('%Y', ua.activity_month) AS INTEGER) -
             CAST(strftime('%Y', uc.cohort_month) AS INTEGER)) * 12

            +

            (CAST(strftime('%m', ua.activity_month) AS INTEGER) -
             CAST(strftime('%m', uc.cohort_month) AS INTEGER))

        ) AS month_number,

        COUNT(DISTINCT ua.user_id) AS retained_users

    FROM user_cohort uc
    JOIN user_activity ua
        ON uc.user_id = ua.user_id

    GROUP BY
        uc.cohort_month,
        ua.activity_month

)

SELECT
    cohort_month,
    month_number,
    retained_users
FROM cohort_data
ORDER BY cohort_month, month_number;
/*
==================================================
QUERY 08 RESULT SUMMARY
==================================================

Key Findings:
- Cohort sizes increased significantly from 2019 to 2024.
- Recent cohorts acquired substantially more users than earlier cohorts.
- Month 0 contains the majority of retained users across all cohorts.
- Retention drops sharply after the first month.
- Only a small number of users remain active beyond 6–12 months.

Business Insight:
The business is successfully acquiring new customers, but long-term retention is relatively low. Future growth opportunities lie in improving repeat purchase behavior through loyalty programs, personalized marketing, and customer retention initiatives.

==================================================
*/
/* ==================================================
QUERY 09: CUMULATIVE LTV BY ACQUISITION COHORT
================================================== */

WITH cohort_users AS (
    SELECT
        id AS user_id,
        DATE(created_at, 'start of month') AS cohort_month
    FROM users
),

cohort_revenue AS (
    SELECT
        cu.cohort_month,
        cu.user_id,
        o.created_at AS order_date,
        oi.sale_price
    FROM cohort_users cu
    JOIN orders o
        ON cu.user_id = o.user_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'Complete'
)

SELECT
    cohort_month,
    COUNT(DISTINCT user_id) AS users_in_cohort,

    ROUND(SUM(
        CASE
            WHEN JULIANDAY(order_date) - JULIANDAY(cohort_month) <= 30
            THEN sale_price ELSE 0
        END
    ),2) AS revenue_30_days,

    ROUND(SUM(
        CASE
            WHEN JULIANDAY(order_date) - JULIANDAY(cohort_month) <= 60
            THEN sale_price ELSE 0
        END
    ),2) AS revenue_60_days,

    ROUND(SUM(
        CASE
            WHEN JULIANDAY(order_date) - JULIANDAY(cohort_month) <= 90
            THEN sale_price ELSE 0
        END
    ),2) AS revenue_90_days,

    ROUND(SUM(
        CASE
            WHEN JULIANDAY(order_date) - JULIANDAY(cohort_month) <= 180
            THEN sale_price ELSE 0
        END
    ),2) AS revenue_180_days,

    ROUND(SUM(
        CASE
            WHEN JULIANDAY(order_date) - JULIANDAY(cohort_month) <= 365
            THEN sale_price ELSE 0
        END
    ),2) AS revenue_365_days

FROM cohort_revenue
GROUP BY cohort_month
ORDER BY cohort_month;
/*
==================================================
QUERY 09 RESULT SUMMARY
==================================================

Highest 365-Day LTV Cohorts

Jan 2024 : 91,291.53
Jan 2023 : 49,531.99
Aug 2023 : 46,739.06
Mar 2023 : 45,983.32
Dec 2023 : 44,498.88

Lowest 365-Day LTV Cohorts

Jan 2019 : 7,546.63
Mar 2019 : 7,611.41
Feb 2019 : 7,694.36

Key Findings:
- Cohort LTV increased significantly from 2019 to 2024.
- 2023 cohorts generated substantially higher revenue than earlier cohorts.
- Revenue grows consistently across 30, 60, 90, 180, and 365-day windows.
- Recent cohorts show stronger monetization performance.
- Jan 2024 cohort generated the highest observed revenue.

Business Insight:
Customer quality has improved over time. Recent acquisition cohorts are generating significantly more lifetime value than historical cohorts, suggesting improvements in marketing effectiveness, product-market fit, pricing strategy, or customer experience.

==================================================
*/
/* ==================================================
QUERY 10: D7, D30, D90 RETENTION RATES
================================================== */

WITH cohort_users AS (

    SELECT
        id AS user_id,
        DATE(created_at) AS signup_date,
        DATE(created_at, 'start of month') AS cohort_month
    FROM users

),

user_orders AS (

    SELECT
        user_id,
        DATE(created_at) AS order_date
    FROM orders
    WHERE status = 'Complete'

)

SELECT

    cohort_month,

    COUNT(DISTINCT cu.user_id) AS cohort_size,

    ROUND(
        100.0 *
        COUNT(DISTINCT CASE
            WHEN JULIANDAY(uo.order_date) - JULIANDAY(cu.signup_date) <= 7
            THEN cu.user_id
        END)
        / COUNT(DISTINCT cu.user_id),
        2
    ) AS d7_retention_pct,

    ROUND(
        100.0 *
        COUNT(DISTINCT CASE
            WHEN JULIANDAY(uo.order_date) - JULIANDAY(cu.signup_date) <= 30
            THEN cu.user_id
        END)
        / COUNT(DISTINCT cu.user_id),
        2
    ) AS d30_retention_pct,

    ROUND(
        100.0 *
        COUNT(DISTINCT CASE
            WHEN JULIANDAY(uo.order_date) - JULIANDAY(cu.signup_date) <= 90
            THEN cu.user_id
        END)
        / COUNT(DISTINCT cu.user_id),
        2
    ) AS d90_retention_pct

FROM cohort_users cu

LEFT JOIN user_orders uo
    ON cu.user_id = uo.user_id

GROUP BY cohort_month

ORDER BY cohort_month;
/*
==================================================
QUERY 10 RESULT SUMMARY
==================================================

Highest D90 Retention Cohorts

Nov 2023 : 27.73%
Dec 2023 : 27.34%
Jan 2024 : 27.41%
Oct 2023 : 25.30%
Sep 2023 : 20.37%

Highest D30 Retention Cohorts

Jan 2024 : 27.41%
Dec 2023 : 25.08%
Nov 2023 : 13.39%
Oct 2023 : 9.61%
Aug 2023 : 7.73%

Highest D7 Retention Cohorts

Jan 2024 : 26.47%
Dec 2023 : 7.58%
Nov 2023 : 3.55%
Sep 2023 : 1.79%
Oct 2023 : 1.70%

Key Findings:
- Retention improved significantly during 2023–2024.
- Recent cohorts outperform historical cohorts across all retention windows.
- D90 retention increased from ~1–3% in early years to over 25% in recent cohorts.
- Customer quality and engagement improved substantially over time.
- Jan 2024 cohort achieved the strongest retention performance.

Business Insight:
Customer retention has improved dramatically in recent acquisition cohorts. This suggests improvements in product experience, customer targeting, onboarding effectiveness, or marketing quality.

==================================================
*/
/* ==================================================
QUERY 11: HIGHEST LTV COHORT ANALYSIS
================================================== */

WITH cohort_users AS (

    SELECT
        id AS user_id,
        traffic_source,
        gender,
        age,
        DATE(created_at,'start of month') AS cohort_month
    FROM users

),

cohort_revenue AS (

    SELECT
        cu.cohort_month,
        SUM(oi.sale_price) AS total_revenue
    FROM cohort_users cu
    JOIN orders o
        ON cu.user_id = o.user_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status='Complete'
    GROUP BY cu.cohort_month

),

highest_ltv_cohort AS (

    SELECT cohort_month
    FROM cohort_revenue
    ORDER BY total_revenue DESC
    LIMIT 1

)

SELECT
    cu.cohort_month,
    cu.traffic_source,
    cu.gender,
    ROUND(AVG(cu.age),1) AS avg_age,
    COUNT(*) AS users

FROM cohort_users cu

JOIN highest_ltv_cohort h
ON cu.cohort_month = h.cohort_month

GROUP BY
    cu.cohort_month,
    cu.traffic_source,
    cu.gender

ORDER BY users DESC;
/*
==================================================
QUERY 11 RESULT SUMMARY
==================================================

Highest LTV Cohort:
Jan 2024

Top Acquisition Sources

Search (Female) : 1,220 Users
Search (Male)   : 1,123 Users
Organic (Male)  :   248 Users
Organic (Female):   205 Users

Demographic Profile

Average Age Range:
39–43 Years

Gender Distribution:
Female : 1,640 Users
Male   : 1,636 Users

Key Findings:
- Search was the dominant acquisition channel.
- Search contributed more than 70% of users in the highest LTV cohort.
- Gender distribution was nearly balanced.
- Average customer age was approximately 41 years.
- Organic traffic was the second-largest contributor.

Business Insight:
The highest-value cohort was primarily acquired through Search and consisted of middle-aged customers with a balanced gender mix. Search appears to attract the most valuable long-term customers.

==================================================
*/
/* ==================================================
QUERY 12: REPEAT PURCHASE RATE BY PRODUCT CATEGORY
================================================== */

WITH user_category_orders AS (

    SELECT
        oi.user_id,
        p.category,
        COUNT(DISTINCT oi.order_id) AS orders_per_user

    FROM order_items oi

    JOIN products p
        ON oi.product_id = p.id

    GROUP BY
        oi.user_id,
        p.category

)

SELECT

    category,

    COUNT(DISTINCT user_id) AS buyers,

    COUNT(DISTINCT CASE
        WHEN orders_per_user > 1
        THEN user_id
    END) AS repeat_buyers,

    ROUND(
        100.0 *
        COUNT(DISTINCT CASE
            WHEN orders_per_user > 1
            THEN user_id
        END)
        /
        COUNT(DISTINCT user_id),
        2
    ) AS repeat_purchase_rate_pct

FROM user_category_orders

GROUP BY category

HAVING buyers >= 50

ORDER BY repeat_purchase_rate_pct DESC;
/*
==================================================
QUERY 12 RESULT SUMMARY
==================================================

Top Categories by Repeat Purchase Rate

Intimates                 : 10.02%
Underwear                 : 6.36%
Pants                     : 5.33%
Socks                     : 5.19%
Jeans                     : 5.04%

Lowest Categories

Clothing Sets             : 0.47%
Jumpsuits & Rompers       : 0.54%
Suits                     : 0.59%
Skirts                    : 1.01%

Key Findings:
- Intimates has the highest repeat purchase rate at 10.02%.
- Underwear and Socks also show strong repeat buying behavior.
- Functional and frequently replaced products drive customer loyalty.
- Fashion-oriented categories show lower repeat purchase rates.
- Clothing Sets and Jumpsuits have the weakest repeat purchasing behavior.

Business Insight:
Categories associated with recurring customer needs generate significantly stronger loyalty and repeat purchases than occasional fashion purchases.

==================================================
*/
/* ==================================================
QUERY 13: CHURN INFLECTION POINT
================================================== */

WITH user_sessions AS (

    SELECT
        user_id,
        COUNT(DISTINCT session_id) AS session_count

    FROM events

    WHERE user_id IS NOT NULL

    GROUP BY user_id

),

user_orders AS (

    SELECT
        user_id,
        COUNT(DISTINCT order_id) AS order_count

    FROM orders

    WHERE status = 'Complete'

    GROUP BY user_id

)

SELECT

    us.session_count,

    COUNT(*) AS users,

    COUNT(CASE
        WHEN COALESCE(uo.order_count,0)=0
        THEN 1
    END) AS churned_users,

    ROUND(
        100.0 *
        COUNT(CASE
            WHEN COALESCE(uo.order_count,0)=0
            THEN 1
        END)
        /
        COUNT(*),
        2
    ) AS churn_rate_pct

FROM user_sessions us

LEFT JOIN user_orders uo
    ON us.user_id = uo.user_id

GROUP BY us.session_count

ORDER BY us.session_count;
/*
==================================================
QUERY 13 RESULT SUMMARY
==================================================

Highest Churn Levels

1 Session  : 74.67%
2 Sessions : 65.56%
3 Sessions : 59.17%
4 Sessions : 55.57%

Lowest Churn Levels

11 Sessions : 21.21%
13 Sessions : 0.00%
14 Sessions : 0.00%

Key Findings:
- Churn decreases consistently as session count increases.
- Users with only 1 session have a churn rate of 74.67%.
- Churn falls below 50% after 5 sessions.
- Users with 6+ sessions are significantly more likely to convert.
- The strongest churn inflection point occurs between 4 and 5 sessions.

Business Insight:
Customer engagement is the strongest predictor of retention. Users who reach at least 5 sessions are substantially more likely to remain active and convert than users with fewer sessions.

==================================================
*/
/* ==================================================
QUERY 14: LOYALTY REVENUE CONTRIBUTION
================================================== */

WITH customer_age AS (

    SELECT
        id AS user_id,

        CASE
            WHEN JULIANDAY('2024-01-31') - JULIANDAY(created_at) >= 180
            THEN 'Acquired 6+ Months Ago'
            ELSE 'Acquired <6 Months Ago'
        END AS customer_segment

    FROM users

),

revenue_by_segment AS (

    SELECT
        ca.customer_segment,
        SUM(oi.sale_price) AS revenue

    FROM customer_age ca

    JOIN orders o
        ON ca.user_id = o.user_id

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.status = 'Complete'

    GROUP BY ca.customer_segment

)

SELECT

    customer_segment,

    ROUND(revenue,2) AS revenue,

    ROUND(
        100.0 * revenue /
        SUM(revenue) OVER (),
        2
    ) AS revenue_contribution_pct

FROM revenue_by_segment

ORDER BY revenue DESC;
/*
==================================================
QUERY 14 RESULT SUMMARY
==================================================

Revenue Contribution

Acquired 6+ Months Ago : ₹2,413,166.86 (88.86%)
Acquired <6 Months Ago : ₹302,616.88 (11.14%)

Key Findings:
- Customers acquired more than 6 months ago generate the vast majority of revenue.
- Long-term customers contribute nearly 89% of total revenue.
- Recently acquired customers contribute only 11% of revenue.
- Revenue concentration is heavily dependent on established customers.
- Customer retention has a significant impact on business performance.

Business Insight:
Long-term customers are the primary revenue drivers of the business. Retention strategies are likely to generate higher ROI than acquisition-only strategies because existing customers contribute the majority of revenue.

==================================================
*/