/* =========================================================
   QUERY 01: OVERALL CONVERSION FUNNEL
========================================================= */

WITH funnel_stages AS (

    SELECT
        'Stage 1: Home/Browse' AS stage,
        1 AS stage_order,
        COUNT(DISTINCT user_id) AS users
    FROM events
    WHERE event_type = 'home'

    UNION ALL

    SELECT
        'Stage 2: Product View',
        2,
        COUNT(DISTINCT user_id)
    FROM events
    WHERE event_type = 'product'

    UNION ALL

    SELECT
        'Stage 3: Add To Cart',
        3,
        COUNT(DISTINCT user_id)
    FROM events
    WHERE event_type = 'cart'

    UNION ALL

    SELECT
        'Stage 4: Purchase Event',
        4,
        COUNT(DISTINCT user_id)
    FROM events
    WHERE event_type = 'purchase'

    UNION ALL

    SELECT
        'Stage 5: Completed Orders',
        5,
        COUNT(DISTINCT user_id)
    FROM orders
    WHERE status = 'Complete'
)

SELECT
    stage,
    users,
    LAG(users) OVER (ORDER BY stage_order) AS previous_stage_users,
    ROUND(
        100.0 * users /
        LAG(users) OVER (ORDER BY stage_order),
        2
    ) AS stage_conversion_pct,
    ROUND(
        100.0 * users /
        FIRST_VALUE(users) OVER (ORDER BY stage_order),
        2
    ) AS cumulative_conversion_pct
FROM funnel_stages
ORDER BY stage_order;
/* =========================================================
RESULT SUMMARY

Stage 1: Home/Browse         = 63,197 users
Stage 2: Product View        = 80,044 users
Stage 3: Add To Cart         = 80,044 users
Stage 4: Purchase Event      = 80,044 users
Stage 5: Completed Orders    = 27,703 users

========================================================= */
/* =========================================================
   QUERY 02: FUNNEL BY DEVICE TYPE
========================================================= */

WITH device_events AS (

    SELECT
        e.user_id,

        CASE
            WHEN e.browser IN (
                'Chrome Mobile',
                'Safari Mobile',
                'Android Browser',
                'IE Mobile',
                'Opera Mini'
            ) THEN 'Mobile'

            WHEN e.browser IN (
                'Chrome',
                'Firefox',
                'Safari',
                'IE',
                'Opera'
            ) THEN 'Desktop'

            ELSE 'Tablet/Other'
        END AS device_type,

        MAX(CASE WHEN e.event_type='home' THEN 1 ELSE 0 END) AS visited_home,
        MAX(CASE WHEN e.event_type='product' THEN 1 ELSE 0 END) AS viewed_product,
        MAX(CASE WHEN e.event_type='cart' THEN 1 ELSE 0 END) AS added_to_cart,
        MAX(CASE WHEN e.event_type='purchase' THEN 1 ELSE 0 END) AS purchased

    FROM events e

    GROUP BY
        e.user_id,
        device_type
)

SELECT
    device_type,

    SUM(visited_home) AS home_visitors,
    SUM(viewed_product) AS product_viewers,
    SUM(added_to_cart) AS cart_adders,
    SUM(purchased) AS purchasers,

    ROUND(
        100.0 * SUM(purchased) /
        NULLIF(SUM(visited_home),0),
        2
    ) AS home_to_purchase_rate,

    ROUND(
        100.0 * SUM(added_to_cart) /
        NULLIF(SUM(viewed_product),0),
        2
    ) AS product_to_cart_rate,

    ROUND(
        100.0 * SUM(purchased) /
        NULLIF(SUM(added_to_cart),0),
        2
    ) AS cart_to_purchase_rate

FROM device_events

GROUP BY device_type

ORDER BY home_to_purchase_rate DESC;
/* =========================================================
RESULT SUMMARY

Tablet/Other
Home Visitors      : 4,259
Product Viewers    : 8,509
Cart Adders        : 8,509
Purchasers         : 8,508

Desktop
Home Visitors      : 60,927
Product Viewers    : 78,220
Cart Adders        : 78,220
Purchasers         : 78,219

========================================================= */
/* =========================================================
   QUERY 03: PRODUCT CATEGORY POPULARITY
========================================================= */

SELECT
    p.category,
    COUNT(*) AS product_views,
    COUNT(DISTINCT e.user_id) AS unique_users
FROM events e
JOIN products p
    ON CAST(REPLACE(e.uri,'/product/','') AS INTEGER) = p.id
WHERE e.event_type = 'product'
  AND e.uri LIKE '/product/%'
GROUP BY p.category
ORDER BY product_views DESC;
/* =========================================================
RESULT SUMMARY

Top Categories by Product Views

1. Intimates                      62,132
2. Jeans                          58,992
3. Tops & Tees                    55,759
4. Fashion Hoodies & Sweatshirts  55,112
5. Swim                           52,991

Lowest Category

Clothing Sets                        954

========================================================= */
/* =========================================================
   QUERY 04: TIME TO CONVERT DISTRIBUTION
========================================================= */

WITH first_event AS (

    SELECT
        user_id,
        MIN(created_at) AS first_event_date
    FROM events
    GROUP BY user_id

),

first_purchase AS (

    SELECT
        user_id,
        MIN(created_at) AS first_purchase_date
    FROM orders
    WHERE status = 'Complete'
    GROUP BY user_id

)

SELECT

    CASE

        WHEN julianday(first_purchase_date) - julianday(first_event_date) <= 1
            THEN '0-1 Days'

        WHEN julianday(first_purchase_date) - julianday(first_event_date) <= 3
            THEN '2-3 Days'

        WHEN julianday(first_purchase_date) - julianday(first_event_date) <= 7
            THEN '4-7 Days'

        WHEN julianday(first_purchase_date) - julianday(first_event_date) <= 14
            THEN '8-14 Days'

        WHEN julianday(first_purchase_date) - julianday(first_event_date) <= 30
            THEN '15-30 Days'

        ELSE '30+ Days'

    END AS conversion_bucket,

    COUNT(*) AS users,

    ROUND(
        100.0 * COUNT(*)
        / SUM(COUNT(*)) OVER (),
        2
    ) AS pct_of_converters

FROM first_event fe
JOIN first_purchase fp
ON fe.user_id = fp.user_id

GROUP BY conversion_bucket

ORDER BY users DESC;
/* =========================================================
RESULT SUMMARY

0-1 Days     : 20,285 Users (73.22%)
30+ Days     : 6,415 Users (23.16%)
15-30 Days   :   482 Users (1.74%)
8-14 Days    :   211 Users (0.76%)
2-3 Days     :   159 Users (0.57%)
4-7 Days     :   151 Users (0.55%)

========================================================= */
/* =========================================================
   QUERY 05: TRAFFIC SOURCE FUNNEL QUALITY
========================================================= */

SELECT

    u.traffic_source,

    COUNT(DISTINCT u.id) AS total_users,

    COUNT(DISTINCT o.user_id) AS converted_users,

    ROUND(
        100.0 * COUNT(DISTINCT o.user_id)
        / COUNT(DISTINCT u.id),
        2
    ) AS conversion_rate_pct,

    COUNT(DISTINCT o.order_id) AS completed_orders,

    ROUND(
        1.0 * COUNT(DISTINCT o.order_id)
        / NULLIF(COUNT(DISTINCT o.user_id),0),
        2
    ) AS orders_per_converted_user

FROM users u

LEFT JOIN orders o
ON u.id = o.user_id
AND o.status = 'Complete'

GROUP BY u.traffic_source

ORDER BY conversion_rate_pct DESC;
/* =========================================================
RESULT SUMMARY

Facebook : 27.92%
Search   : 27.80%
Organic  : 27.41%
Display  : 27.34%
Email    : 27.23%

Highest Converting Channel:
Facebook (27.92%)

Lowest Converting Channel:
Email (27.23%)

========================================================= */
/* =========================================================
   QUERY 06: NEW VS RETURNING USER FUNNEL
========================================================= */

WITH user_orders AS (

    SELECT
        user_id,
        COUNT(*) AS completed_orders
    FROM orders
    WHERE status = 'Complete'
    GROUP BY user_id

)

SELECT

    CASE
        WHEN completed_orders > 1
        THEN 'Returning User'
        ELSE 'New User'
    END AS user_type,

    COUNT(*) AS users,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS pct_of_users,

    ROUND(
        AVG(completed_orders),
        2
    ) AS avg_completed_orders

FROM user_orders

GROUP BY user_type

ORDER BY users DESC;
/* =========================================================
RESULT SUMMARY

New User
Users                : 24,394
Percentage           : 88.06%
Average Orders       : 1.00

Returning User
Users                : 3,309
Percentage           : 11.94%
Average Orders       : 2.10

========================================================= */
/* =========================================================
   QUERY 07: PEAK CONVERSION TIMING ANALYSIS
========================================================= */

SELECT

    CASE strftime('%w', o.created_at)
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS day_of_week,

    CAST(
        strftime('%H', o.created_at)
        AS INTEGER
    ) AS hour_of_day,

    COUNT(*) AS completed_orders,

    ROUND(
        SUM(oi.sale_price),
        0
    ) AS revenue,

    ROUND(
        AVG(oi.sale_price),
        2
    ) AS avg_order_value

FROM orders o

JOIN order_items oi
ON o.order_id = oi.order_id

WHERE o.status = 'Complete'

GROUP BY
    day_of_week,
    hour_of_day

ORDER BY completed_orders DESC

LIMIT 20;
/* =========================================================
RESULT SUMMARY

Top Conversion Windows

Monday 13:00      454 Orders
Sunday 08:00      400 Orders
Monday 08:00      390 Orders
Wednesday 11:00   390 Orders
Wednesday 02:00   389 Orders

Highest Revenue Window

Monday 13:00      Revenue = 27,567

========================================================= */