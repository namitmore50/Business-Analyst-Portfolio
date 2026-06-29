/* ==================================================
QUERY 15: FULL RFM SCORING
================================================== */

WITH rfm_base AS (

    SELECT

        u.id AS user_id,

        ROUND(
            JULIANDAY('2024-01-31') -
            JULIANDAY(MAX(o.created_at))
        ) AS recency_days,

        COUNT(DISTINCT o.order_id) AS frequency,

        ROUND(SUM(oi.sale_price),2) AS monetary

    FROM users u

    JOIN orders o
        ON u.id = o.user_id

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.status='Complete'

    GROUP BY u.id

),

rfm_scores AS (

    SELECT

        user_id,
        recency_days,
        frequency,
        monetary,

        6 - NTILE(5) OVER (ORDER BY recency_days) AS recency_score,

        NTILE(5) OVER (ORDER BY frequency) AS frequency_score,

        NTILE(5) OVER (ORDER BY monetary) AS monetary_score

    FROM rfm_base

)

SELECT

    user_id,
    recency_days,
    frequency,
    monetary,

    recency_score,
    frequency_score,
    monetary_score,

    recency_score + frequency_score + monetary_score
    AS rfm_total_score

FROM rfm_scores

ORDER BY rfm_total_score DESC;
/*
RESULT SUMMARY:
- RFM scoring successfully classified customers using Recency, Frequency, and Monetary value.
- Maximum achievable score was 15 (5+5+5), identifying Champion customers.
- Top-ranked customers demonstrated recent activity, repeat purchasing behavior, and high spending levels.
- Several Champion users generated revenue exceeding $1,000.
- RFM framework creates a scalable customer segmentation model for retention and marketing analysis.
*/
/* ==================================================
   QUERY 16: RFM SEGMENT CLASSIFICATION
================================================== */

WITH rfm_base AS (

    SELECT

        u.id AS user_id,

        ROUND(
            JULIANDAY('2024-01-31') -
            JULIANDAY(MAX(o.created_at))
        ) AS recency_days,

        COUNT(DISTINCT o.order_id) AS frequency,

        ROUND(SUM(oi.sale_price),2) AS monetary

    FROM users u

    JOIN orders o
        ON u.id = o.user_id

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.status='Complete'

    GROUP BY u.id

),

rfm_scores AS (

    SELECT

        user_id,

        6 - NTILE(5) OVER (ORDER BY recency_days) AS recency_score,

        NTILE(5) OVER (ORDER BY frequency) AS frequency_score,

        NTILE(5) OVER (ORDER BY monetary) AS monetary_score

    FROM rfm_base

),

customer_segments AS (

    SELECT

        user_id,

        CASE

            WHEN recency_score >= 4
             AND frequency_score >= 4
             AND monetary_score >= 4
                THEN 'Champions'

            WHEN recency_score >= 3
             AND frequency_score >= 3
             AND monetary_score >= 3
                THEN 'Loyal Customers'

            WHEN recency_score >= 4
             AND frequency_score >= 2
                THEN 'Potential Loyalists'

            WHEN recency_score <= 2
             AND frequency_score >= 3
                THEN 'At Risk'

            ELSE 'Lost Customers'

        END AS segment

    FROM rfm_scores

)

SELECT

    segment,
    COUNT(*) AS users,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS pct_of_users

FROM customer_segments

GROUP BY segment

ORDER BY users DESC;
/*
RESULT SUMMARY:
- Lost Customers are the largest segment with 8,989 users (32.45%).
- At Risk customers account for 6,463 users (23.33%) and require retention campaigns.
- Loyal Customers represent 5,662 users (20.44%), providing stable repeat revenue.
- Champions account for 4,330 users (15.63%) and are the highest-value customer group.
- Potential Loyalists represent 2,259 users (8.15%) and offer upsell opportunities.
- Over 55% of customers belong to Lost or At Risk segments, indicating significant retention potential.
*/
/* ==================================================
   QUERY 17: WINDOW SHOPPER VS INTENT BUYER
================================================== */

WITH user_behavior AS (

    SELECT

        e.user_id,

        COUNT(DISTINCT e.session_id) AS sessions,

        SUM(
            CASE
                WHEN e.event_type = 'product'
                THEN 1 ELSE 0
            END
        ) AS product_views,

        SUM(
            CASE
                WHEN e.event_type = 'cart'
                THEN 1 ELSE 0
            END
        ) AS cart_events,

        SUM(
            CASE
                WHEN e.event_type = 'purchase'
                THEN 1 ELSE 0
            END
        ) AS purchases

    FROM events e

    GROUP BY e.user_id

),

classified_users AS (

    SELECT

        *,

        CASE

            WHEN purchases > 0
                THEN 'Intent Buyer'

            ELSE 'Window Shopper'

        END AS user_type

    FROM user_behavior

)

SELECT

    user_type,

    COUNT(*) AS users,

    ROUND(AVG(sessions),2) AS avg_sessions,

    ROUND(AVG(product_views),2) AS avg_product_views,

    ROUND(AVG(cart_events),2) AS avg_cart_events,

    ROUND(AVG(purchases),2) AS avg_purchases,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN purchases > 0
                THEN 1 ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS conversion_rate_pct

FROM classified_users

GROUP BY user_type

ORDER BY users DESC;
/*
RESULT SUMMARY:
- All tracked users were classified as Intent Buyers.
- No Window Shoppers remained after data cleaning.
- Average buyer completed 2.27 sessions.
- Average buyer viewed 4.32 products.
- Average buyer generated 4.32 cart events.
- Average buyer completed 2.27 purchase events.

Business Insight:
The cleaned behavioral dataset primarily contains users who progressed through the funnel and completed purchases. As a result, meaningful comparison between Window Shoppers and Intent Buyers is not possible using the current dataset.
*/.
/* ==================================================
   QUERY 18: CHAMPIONS DEMOGRAPHIC PROFILE
================================================== */

WITH rfm_base AS (

    SELECT

        u.id AS user_id,
        u.gender,
        u.age,
        u.traffic_source,

        ROUND(
            JULIANDAY('2024-01-31') -
            JULIANDAY(MAX(o.created_at))
        ) AS recency_days,

        COUNT(DISTINCT o.order_id) AS frequency,

        ROUND(SUM(oi.sale_price),2) AS monetary

    FROM users u

    JOIN orders o
        ON u.id = o.user_id

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.status='Complete'

    GROUP BY u.id

),

rfm_scores AS (

    SELECT

        *,

        6 - NTILE(5) OVER (ORDER BY recency_days) AS r_score,

        NTILE(5) OVER (ORDER BY frequency) AS f_score,

        NTILE(5) OVER (ORDER BY monetary) AS m_score

    FROM rfm_base

)

SELECT

    traffic_source,
    gender,

    ROUND(AVG(age),1) AS avg_age,

    COUNT(*) AS users,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS pct_of_champions

FROM rfm_scores

WHERE r_score >= 4
AND f_score >= 4
AND m_score >= 4

GROUP BY
    traffic_source,
    gender

ORDER BY users DESC;
/*
==================================================
QUERY 18 RESULT SUMMARY
==================================================

Champion Segment Size:
4,330 Users

Top Champion Sources

Search (Male)   : 1,609 Users (37.16%)
Search (Female) : 1,488 Users (34.36%)

Combined Search Contribution:
71.52%

Other Sources

Organic         : 13.81%
Facebook        : 5.52%
Email           : 5.29%
Display         : 3.86%

Average Age Range:
39 - 42 Years

Key Findings:
- Search is the dominant acquisition source for Champions.
- More than 70% of Champions originate from Search.
- Gender distribution is nearly balanced.
- Champion customers are predominantly aged 39–42.
- Organic traffic is the second strongest source of high-value customers.

Business Insight:
The highest-value customers are primarily acquired through Search channels. Customers aged around 40 years demonstrate the strongest long-term value and engagement.

==================================================
*/
/* ==================================================
   QUERY 19: AT-RISK SEGMENT ANALYSIS
================================================== */

WITH rfm_base AS (

    SELECT

        u.id AS user_id,

        MAX(o.created_at) AS last_purchase_date,

        ROUND(
            JULIANDAY('2024-01-31') -
            JULIANDAY(MAX(o.created_at))
        ) AS recency_days,

        COUNT(DISTINCT o.order_id) AS frequency,

        ROUND(SUM(oi.sale_price),2) AS monetary

    FROM users u

    JOIN orders o
        ON u.id = o.user_id

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.status='Complete'

    GROUP BY u.id

),

rfm_scores AS (

    SELECT

        *,

        6 - NTILE(5) OVER (ORDER BY recency_days) AS r_score,

        NTILE(5) OVER (ORDER BY frequency) AS f_score,

        NTILE(5) OVER (ORDER BY monetary) AS m_score

    FROM rfm_base

),

at_risk AS (

    SELECT *
    FROM rfm_scores
    WHERE r_score <= 2
      AND f_score >= 3

)

SELECT

    CASE

        WHEN recency_days <= 30 THEN '0-30 Days'
        WHEN recency_days <= 90 THEN '31-90 Days'
        WHEN recency_days <= 180 THEN '91-180 Days'
        WHEN recency_days <= 365 THEN '181-365 Days'
        ELSE '365+ Days'

    END AS last_purchase_bucket,

    COUNT(*) AS users,

    ROUND(SUM(monetary),2) AS revenue_at_risk

FROM at_risk

GROUP BY last_purchase_bucket

ORDER BY users DESC;
/*
==================================================
QUERY 19 RESULT SUMMARY
==================================================

At-Risk Customers:
6,463 Users

Revenue At Risk:
₹904,349.30

Last Purchase Distribution:

365+ Days : 6,463 Users

Key Findings:
- All At-Risk customers have not purchased for more than 365 days.
- Revenue exposure from this segment exceeds ₹904K.
- These customers were previously active buyers with meaningful purchase history.
- At-Risk users represent a substantial reactivation opportunity.
- Failure to recover this segment may result in permanent customer loss.

Business Insight:
A large pool of previously valuable customers has been inactive for over one year. Even modest reactivation success could recover significant revenue and improve overall customer lifetime value.

==================================================
*/
/* ==================================================
   QUERY 20: PRODUCT BROWSING SEQUENCE ANALYSIS
================================================== */

WITH page_sequence AS (

    SELECT

        user_id,

        event_type AS current_event,

        LEAD(event_type) OVER (
            PARTITION BY user_id
            ORDER BY created_at
        ) AS next_event

    FROM events

)

SELECT

    current_event,
    next_event,

    COUNT(*) AS transitions

FROM page_sequence

WHERE next_event IS NOT NULL

GROUP BY
    current_event,
    next_event

ORDER BY transitions DESC

LIMIT 20;
/*
==================================================
QUERY 20 RESULT SUMMARY
==================================================

Top User Navigation Paths:

Department → Product      : 449,047
Product → Cart            : 447,603
Cart → Department         : 247,927
Product → Product         : 221,384
Cart → Purchase           : 134,339

Additional Patterns:

Product → Department      : 123,164
Cart → Product            : 119,004
Home → Department         : 87,157
Department → Department   : 61,652
Cart → Cart               : 59,674

Key Findings:

- Users primarily move from Department pages to Product pages.
- Product-to-Cart is the strongest conversion step.
- Many users return from Cart back to browsing categories.
- Product comparison behavior is evident through Product-to-Product transitions.
- Significant drop-offs occur through Cancel events before purchase.

Business Insight:

The dominant purchase journey is:
Home → Department → Product → Cart → Purchase

Large volumes of Cart → Department and Cart → Product transitions indicate users continue evaluating products before purchasing. Optimizing cart experience and reducing decision friction could increase conversions.

==================================================
*/