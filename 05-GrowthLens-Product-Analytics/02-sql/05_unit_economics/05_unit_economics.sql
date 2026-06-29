/* ==================================================
   QUERY 27: LTV CALCULATION BY ACQUISITION CHANNEL
================================================== */

WITH user_revenue AS (

    SELECT

        u.id AS user_id,
        u.traffic_source,

        SUM(
            CASE
                WHEN JULIANDAY(o.created_at) -
                     JULIANDAY(u.created_at) <= 90
                THEN oi.sale_price
                ELSE 0
            END
        ) AS revenue_90_days,

        SUM(
            CASE
                WHEN JULIANDAY(o.created_at) -
                     JULIANDAY(u.created_at) <= 180
                THEN oi.sale_price
                ELSE 0
            END
        ) AS revenue_180_days,

        SUM(
            CASE
                WHEN JULIANDAY(o.created_at) -
                     JULIANDAY(u.created_at) <= 365
                THEN oi.sale_price
                ELSE 0
            END
        ) AS revenue_365_days

    FROM users u

    LEFT JOIN orders o
        ON u.id = o.user_id
       AND o.status = 'Complete'

    LEFT JOIN order_items oi
        ON o.order_id = oi.order_id

    GROUP BY u.id, u.traffic_source

)

SELECT

    traffic_source,

    COUNT(*) AS users,

    ROUND(SUM(revenue_90_days),2) AS revenue_90_days,
    ROUND(SUM(revenue_180_days),2) AS revenue_180_days,
    ROUND(SUM(revenue_365_days),2) AS revenue_365_days,

    ROUND(AVG(revenue_90_days),2) AS ltv_90,
    ROUND(AVG(revenue_180_days),2) AS ltv_180,
    ROUND(AVG(revenue_365_days),2) AS ltv_365

FROM user_revenue

GROUP BY traffic_source

ORDER BY ltv_365 DESC;
/*
==================================================
QUERY 27 RESULT SUMMARY
==================================================

Top Performing Channel (LTV 365)

Facebook : 16.09
Display  : 15.45
Search   : 14.50
Organic  : 13.76
Email    : 13.62

Revenue Generated (365 Days)

Search   : 1,015,847.11
Organic  :   207,948.55
Facebook :    93,580.00
Email    :    67,385.39
Display  :    62,595.18

Key Findings:
- Facebook delivers the highest customer lifetime value.
- Display users generate the second-highest LTV.
- Search contributes the largest total revenue due to scale.
- Organic and Email channels generate lower customer value.
- Channel quality differs significantly despite similar acquisition volumes.

Business Insight:
Search is the largest acquisition channel and revenue driver, but Facebook users generate the highest value per customer. Scaling high-LTV channels may improve long-term profitability.

==================================================
*/
/* ==================================================
   QUERY 28: CAC BY CHANNEL
================================================== */

WITH channel_costs AS (

    SELECT 'Search'   AS traffic_source, 350000 AS marketing_spend
    UNION ALL
    SELECT 'Facebook', 50000
    UNION ALL
    SELECT 'Organic', 10000
    UNION ALL
    SELECT 'Email', 15000
    UNION ALL
    SELECT 'Display', 30000

),

channel_users AS (

    SELECT

        traffic_source,

        COUNT(*) AS new_users

    FROM users

    GROUP BY traffic_source

)

SELECT

    c.traffic_source,

    c.marketing_spend,

    u.new_users,

    ROUND(
        1.0 * c.marketing_spend /
        u.new_users,
        2
    ) AS cac

FROM channel_costs c

JOIN channel_users u
    ON c.traffic_source = u.traffic_source

ORDER BY cac DESC;
/*
==================================================
QUERY 28 RESULT SUMMARY
==================================================

Customer Acquisition Cost (CAC)

Facebook : 8.60
Display  : 7.40
Search   : 4.99
Email    : 3.03
Organic  : 0.66

Marketing Spend

Search   : 350,000
Facebook : 50,000
Display  : 30,000
Email    : 15,000
Organic  : 10,000

Key Findings:
- Facebook has the highest acquisition cost.
- Display is the second most expensive channel.
- Organic has the lowest acquisition cost.
- Search balances scale and moderate CAC.
- Email remains a low-cost acquisition channel.

Business Insight:
Organic and Email channels acquire users at the lowest cost, while Facebook requires significantly higher investment per customer acquired. CAC should be evaluated together with LTV to determine profitability.

==================================================
*/
/* ==================================================
   QUERY 29: LTV:CAC RATIO BY CHANNEL
================================================== */

WITH ltv AS (

    SELECT
        'Facebook' AS traffic_source, 16.09 AS ltv_365
    UNION ALL
    SELECT 'Display', 15.45
    UNION ALL
    SELECT 'Search', 14.50
    UNION ALL
    SELECT 'Organic', 13.76
    UNION ALL
    SELECT 'Email', 13.62

),

cac AS (

    SELECT
        'Facebook' AS traffic_source, 8.60 AS cac
    UNION ALL
    SELECT 'Display', 7.40
    UNION ALL
    SELECT 'Search', 4.99
    UNION ALL
    SELECT 'Email', 3.03
    UNION ALL
    SELECT 'Organic', 0.66

)

SELECT

    l.traffic_source,

    l.ltv_365,

    c.cac,

    ROUND(
        l.ltv_365 / c.cac,
        2
    ) AS ltv_cac_ratio,

    CASE
        WHEN l.ltv_365 / c.cac >= 3
            THEN 'Healthy'
        WHEN l.ltv_365 / c.cac >= 1
            THEN 'Needs Optimization'
        ELSE 'Unprofitable'
    END AS health_status

FROM ltv l

JOIN cac c
    ON l.traffic_source = c.traffic_source

ORDER BY ltv_cac_ratio DESC;
/*
==================================================
QUERY 29 RESULT SUMMARY
==================================================

LTV:CAC Ratio Ranking

Organic  : 20.85 (Healthy)
Email    : 4.50  (Healthy)
Search   : 2.91  (Needs Optimization)
Display  : 2.09  (Needs Optimization)
Facebook : 1.87  (Needs Optimization)

Key Findings:
- Organic delivers exceptional acquisition efficiency.
- Email exceeds the recommended 3:1 benchmark.
- Search is close to the healthy threshold.
- Facebook generates high LTV but acquisition costs reduce profitability.
- No channel is currently unprofitable.

Business Insight:
Organic and Email channels generate the strongest economic returns. Facebook and Display acquire valuable users but require cost optimization to improve profitability.

Recommended Benchmark:
LTV:CAC > 3.0 = Healthy
LTV:CAC 1–3 = Needs Optimization
LTV:CAC < 1 = Unprofitable

==================================================
*/
/* ==================================================
   QUERY 30: CAC TREND OVER 6 MONTHS
================================================== */

WITH monthly_users AS (

    SELECT

        strftime('%Y-%m', created_at) AS month,

        traffic_source,

        COUNT(*) AS new_users

    FROM users

    WHERE created_at >= '2023-08-01'

    GROUP BY
        strftime('%Y-%m', created_at),
        traffic_source

),

monthly_spend AS (

    SELECT month,
           traffic_source,
           marketing_spend
    FROM (

        SELECT '2023-08' AS month,'Search' AS traffic_source,58000 AS marketing_spend
        UNION ALL SELECT '2023-09','Search',59000
        UNION ALL SELECT '2023-10','Search',60000
        UNION ALL SELECT '2023-11','Search',61000
        UNION ALL SELECT '2023-12','Search',62000
        UNION ALL SELECT '2024-01','Search',65000

        UNION ALL SELECT '2023-08','Facebook',8000
        UNION ALL SELECT '2023-09','Facebook',8200
        UNION ALL SELECT '2023-10','Facebook',8500
        UNION ALL SELECT '2023-11','Facebook',8700
        UNION ALL SELECT '2023-12','Facebook',9000
        UNION ALL SELECT '2024-01','Facebook',9500

        UNION ALL SELECT '2023-08','Display',4500
        UNION ALL SELECT '2023-09','Display',4700
        UNION ALL SELECT '2023-10','Display',5000
        UNION ALL SELECT '2023-11','Display',5200
        UNION ALL SELECT '2023-12','Display',5400
        UNION ALL SELECT '2024-01','Display',5700

        UNION ALL SELECT '2023-08','Email',2200
        UNION ALL SELECT '2023-09','Email',2400
        UNION ALL SELECT '2023-10','Email',2500
        UNION ALL SELECT '2023-11','Email',2600
        UNION ALL SELECT '2023-12','Email',2700
        UNION ALL SELECT '2024-01','Email',2800

        UNION ALL SELECT '2023-08','Organic',1000
        UNION ALL SELECT '2023-09','Organic',1000
        UNION ALL SELECT '2023-10','Organic',1000
        UNION ALL SELECT '2023-11','Organic',1000
        UNION ALL SELECT '2023-12','Organic',1000
        UNION ALL SELECT '2024-01','Organic',1000
    )

)

SELECT

    s.month,

    s.traffic_source,

    s.marketing_spend,

    u.new_users,

    ROUND(
        1.0 * s.marketing_spend /
        u.new_users,
        2
    ) AS cac

FROM monthly_spend s

JOIN monthly_users u
    ON s.month = u.month
   AND s.traffic_source = u.traffic_source

ORDER BY
    s.month,
    s.traffic_source;

/*
==================================================
QUERY 30 RESULT SUMMARY
==================================================

January 2024 CAC

Organic  : 2.21
Email    : 19.18
Search   : 27.74
Display  : 43.85
Facebook : 46.57

August 2023 CAC

Organic  : 4.20
Email    : 29.73
Search   : 50.52
Display  : 62.50
Facebook : 93.02

Key Findings:
- CAC improved significantly across all channels.
- Facebook CAC decreased from 93.02 to 46.57 (-49.9%).
- Search CAC decreased from 50.52 to 27.74 (-45.1%).
- Email CAC decreased from 29.73 to 19.18 (-35.5%).
- Organic remained the most efficient acquisition source.
- January 2024 delivered the best acquisition efficiency across all channels.

Business Insight:
Marketing efficiency improved substantially over the six-month period. Lower CAC combined with strong LTV indicates improving marketing performance and stronger acquisition economics.

==================================================
*/
/* ==================================================
   QUERY 31: DORMANT USER REVENUE AT RISK
================================================== */

WITH customer_revenue AS (

    SELECT

        o.user_id,

        MAX(o.created_at) AS last_order_date,

        SUM(oi.sale_price) AS lifetime_revenue

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.status = 'Complete'

    GROUP BY o.user_id

),

dormant_users AS (

    SELECT

        *,

        ROUND(
            JULIANDAY('2024-01-31') -
            JULIANDAY(last_order_date)
        ) AS days_since_last_order

    FROM customer_revenue

)

SELECT

    CASE

        WHEN days_since_last_order <= 45
            THEN 'Active'

        WHEN days_since_last_order <= 90
            THEN '46-90 Days'

        WHEN days_since_last_order <= 180
            THEN '91-180 Days'

        ELSE '180+ Days'

    END AS dormancy_bucket,

    COUNT(*) AS users,

    ROUND(
        SUM(lifetime_revenue),
        2
    ) AS revenue_at_risk,

    ROUND(
        SUM(lifetime_revenue) * 0.10,
        2
    ) AS estimated_win_back_revenue

FROM dormant_users

GROUP BY dormancy_bucket

ORDER BY users DESC;

/*
==================================================
QUERY 31 RESULT SUMMARY
==================================================

Dormant User Distribution

180+ Days     : 18,320 Users
91-180 Days   : 3,699 Users
46-90 Days    : 2,528 Users
Active        : 3,156 Users

Revenue At Risk

180+ Days     : 1,752,213.03
91-180 Days   :   381,065.79
46-90 Days    :   257,810.05
Active        :   324,694.87

Estimated Win-Back Revenue (10%)

180+ Days     : 175,221.30
91-180 Days   : 38,106.58
46-90 Days    : 25,781.01

Key Findings:
- More than 18,000 customers have been inactive for over 180 days.
- The largest revenue risk comes from the 180+ day segment.
- Total dormant revenue exceeds ₹2.39 million.
- Even a modest 10% win-back rate could recover substantial revenue.
- Dormant customers represent a major retention opportunity.

Business Insight:
The business has accumulated a large dormant customer base with significant historical spending. Reactivation campaigns could generate meaningful revenue without additional acquisition costs.

==================================================
*/