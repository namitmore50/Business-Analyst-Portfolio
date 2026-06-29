/* ==================================================
   QUERY 32: WEEKLY ACTIVE BUYERS TREND
================================================== */

SELECT

    DATE(o.created_at, '-6 days', 'weekday 1')
    AS week_start_date,

    COUNT(DISTINCT o.user_id)
    AS active_buyers,

    COUNT(DISTINCT o.order_id)
    AS completed_orders,

    ROUND(
        SUM(oi.sale_price),
        2
    ) AS revenue,

    ROUND(
        SUM(oi.sale_price) /
        COUNT(DISTINCT o.order_id),
        2
    ) AS avg_order_value

FROM orders o

JOIN order_items oi
    ON o.order_id = oi.order_id

WHERE o.status = 'Complete'

GROUP BY week_start_date

ORDER BY week_start_date;
/*
==================================================
QUERY 32 RESULT SUMMARY
==================================================

Period Covered:
Jan 2019 – Jan 2024

Key Metrics:

First Week (Jan 2019)
- Active Buyers: 1
- Revenue: 31.99

Peak Week
- Week Starting: 08-Jan-2024
- Active Buyers: 891
- Orders: 924
- Revenue: 83,106.61
- AOV: 89.94

Latest Week
- Week Starting: 15-Jan-2024
- Active Buyers: 626
- Revenue: 61,002.69

Growth Trend:
- Weekly active buyers increased from 1 to 891.
- Revenue grew from 31.99 to 83,106.61.
- Average Order Value remained relatively stable between 80–100.
- Significant acceleration occurred during 2023 and early 2024.

Business Insight:
The North Star Metric (Weekly Active Buyers) shows strong long-term growth. Customer acquisition and retention efforts successfully scaled the buyer base while maintaining healthy order values.

==================================================
*/
/* ==================================================
   QUERY 33: GROWTH ACCOUNTING
================================================== */

WITH monthly_activity AS (

    SELECT

        user_id,

        STRFTIME('%Y-%m', created_at) AS activity_month

    FROM orders

    WHERE status = 'Complete'

    GROUP BY user_id, activity_month

),

user_history AS (

    SELECT

        user_id,
        activity_month,

        LAG(activity_month) OVER (
            PARTITION BY user_id
            ORDER BY activity_month
        ) AS previous_month,

        MIN(activity_month) OVER (
            PARTITION BY user_id
        ) AS first_month

    FROM monthly_activity

),

classified AS (

    SELECT

        activity_month,

        CASE

            WHEN activity_month = first_month
                THEN 'New'

            WHEN previous_month =
                 STRFTIME(
                     '%Y-%m',
                     DATE(activity_month || '-01','-1 month')
                 )
                THEN 'Retained'

            ELSE 'Resurrected'

        END AS user_status

    FROM user_history

)

SELECT

    activity_month AS month,

    SUM(CASE WHEN user_status='New' THEN 1 ELSE 0 END)
        AS new_users,

    SUM(CASE WHEN user_status='Retained' THEN 1 ELSE 0 END)
        AS retained_users,

    SUM(CASE WHEN user_status='Resurrected' THEN 1 ELSE 0 END)
        AS resurrected_users

FROM classified

GROUP BY activity_month

ORDER BY activity_month;
/*
==================================================
QUERY 33 RESULT SUMMARY
==================================================

Latest Month (Jan 2024)

New Users         : 1,891
Retained Users    : 57
Resurrected Users : 146

Growth Trend:

2019
- New user acquisition remained below 100 users/month.

2020
- Monthly acquisition crossed 200 users/month.
- Early signs of customer reactivation appeared.

2021
- Consistent growth with 250–420 new users/month.
- Resurrected users increased significantly.

2022
- Monthly acquisition accelerated to 400–700 users.
- Resurrected users regularly exceeded 50 users/month.

2023
- Hyper-growth period.
- New users increased from 745 to 1,737.
- Resurrected users increased from 97 to 247.

2024 (Jan)
- Highest acquisition month recorded.
- 1,891 new users acquired.
- 146 previously inactive users returned.

Key Findings:
- New user acquisition is the primary growth driver.
- Resurrected users continue growing, indicating successful re-engagement.
- Growth accelerated significantly during 2023.
- January 2024 achieved the highest monthly user growth in dataset history.

Business Insight:
The company is successfully scaling acquisition while simultaneously reactivating inactive users. Growth remains heavily acquisition-driven, with retention representing a future optimization opportunity.

==================================================
*/
/* ==================================================
   QUERY 34: TOP 20 PRODUCTS BY REVENUE WITH YOY GROWTH
================================================== */

WITH product_revenue AS (

    SELECT

        p.id AS product_id,
        p.name AS product_name,
        p.category,

        ROUND(SUM(
            CASE
                WHEN STRFTIME('%Y',o.created_at)='2022'
                THEN oi.sale_price
                ELSE 0
            END
        ),2) AS revenue_2022,

        ROUND(SUM(
            CASE
                WHEN STRFTIME('%Y',o.created_at)='2023'
                THEN oi.sale_price
                ELSE 0
            END
        ),2) AS revenue_2023

    FROM order_items oi

    JOIN orders o
        ON oi.order_id=o.order_id

    JOIN products p
        ON oi.product_id=p.id

    WHERE o.status='Complete'

    GROUP BY
        p.id,
        p.name,
        p.category

)

SELECT

    product_id,
    product_name,
    category,
    revenue_2022,
    revenue_2023,

    ROUND(
        100.0 *
        (revenue_2023 - revenue_2022) /
        NULLIF(revenue_2022,0),
        2
    ) AS yoy_growth_pct,

    CASE

        WHEN revenue_2023 > revenue_2022
            THEN 'Growing'

        WHEN revenue_2023 < revenue_2022
            THEN 'Declining'

        ELSE 'Stable'

    END AS growth_classification

FROM product_revenue

ORDER BY revenue_2023 DESC

LIMIT 20;
/*
==================================================
QUERY 34 RESULT SUMMARY
==================================================

Top Revenue Generating Products in 2023

#1 The North Face Apex Bionic Soft Shell Jacket
   Revenue: 2,709

#2 Darla
   Revenue: 1,998

#3 Nike Women's Pro Compression Sports Bra
   Revenue: 1,806

#4 Catherine Malandrino Women's Skinny Stretch Leather Pant
   Revenue: 1,790

#5 7 For All Mankind Men's Ombre Plaid Blazer
   Revenue: 1,592

Growth Analysis

- 100% of Top 20 products were classified as Growing.
- Several products generated zero revenue in 2022 and became top sellers in 2023.
- Outerwear & Coats appeared most frequently among top-performing products.
- Suits & Sport Coats was the second strongest category.
- Premium apparel products dominated revenue rankings.

Highest YoY Growth

7 For All Mankind Men's Ombre Plaid Blazer:
+300%

Zoot Sports Men's Ultra Speedzoot Swim Race Suit:
+300%

Nike Women's Pro Compression Sports Bra:
+100%

Business Insight:
Outerwear, premium jackets, suits, and performance apparel were the strongest revenue drivers in 2023. Product assortment appears to be shifting toward higher-value premium products.

==================================================
*/
/* ==================================================
   QUERY 35: EXECUTIVE KPI SCORECARD
================================================== */

WITH revenue_metrics AS (

    SELECT

        COUNT(DISTINCT o.user_id) AS total_customers,

        COUNT(DISTINCT o.order_id) AS completed_orders,

        ROUND(SUM(oi.sale_price),2) AS total_revenue,

        ROUND(
            SUM(oi.sale_price) /
            COUNT(DISTINCT o.order_id),
            2
        ) AS avg_order_value

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.status='Complete'

),

user_metrics AS (

    SELECT
        COUNT(*) AS total_users
    FROM users

),

repeat_metrics AS (

    SELECT

        ROUND(
            100.0 *
            COUNT(
                CASE WHEN orders_per_user > 1
                THEN 1 END
            ) /
            COUNT(*),
            2
        ) AS repeat_customer_pct

    FROM (

        SELECT
            user_id,
            COUNT(*) AS orders_per_user
        FROM orders
        WHERE status='Complete'
        GROUP BY user_id

    )

),

conversion_metrics AS (

    SELECT
        ROUND(
            100.0 *
            COUNT(DISTINCT CASE WHEN status='Complete' THEN user_id END) /
            (SELECT COUNT(*) FROM users),
            2
        ) AS conversion_rate_pct
    FROM orders

)

SELECT

    u.total_users,

    r.total_customers,

    r.completed_orders,

    r.total_revenue,

    r.avg_order_value,

    c.conversion_rate_pct,

    rp.repeat_customer_pct,

    14.68 AS ltv_365,

    4.94 AS cac,

    ROUND(14.68/4.94,2) AS ltv_cac_ratio

FROM revenue_metrics r
CROSS JOIN user_metrics u
CROSS JOIN repeat_metrics rp
CROSS JOIN conversion_metrics c;
/*
==================================================
QUERY 35 RESULT SUMMARY
==================================================

Executive KPI Scorecard

Total Users              : 100,000
Total Customers          : 27,703
Completed Orders         : 31,354
Total Revenue            : 2,715,783.74

Average Order Value      : 86.62
Conversion Rate          : 27.70%
Repeat Customer Rate     : 11.94%

LTV (365 Day)            : 14.68
CAC                      : 4.94
LTV:CAC Ratio            : 2.97

Key Findings:
- Platform acquired 100K users.
- 27.7% of users converted into customers.
- Generated 31,354 completed orders.
- Total revenue exceeded 2.71M.
- Average order value remained healthy at 86.62.
- Repeat purchase rate remains relatively low at 11.94%.
- LTV:CAC ratio is near the healthy benchmark of 3:1.

Business Insight:
The business demonstrates strong acquisition and revenue generation capabilities. The biggest opportunity lies in improving retention and repeat purchasing behavior to increase customer lifetime value and push LTV:CAC above the 3:1 benchmark.

==================================================
*/