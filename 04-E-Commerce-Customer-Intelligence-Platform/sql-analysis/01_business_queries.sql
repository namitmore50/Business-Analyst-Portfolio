-- =====================================================
-- QUERY 1: BUSINESS OVERVIEW KPI
-- Objective: Understand overall business scale
-- =====================================================

SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM master_orders;

-- =====================================================
-- QUERY 2: MONTHLY REVENUE TREND
-- Objective: Understand monthly revenue growth
-- =====================================================

SELECT
    SUBSTR(order_purchase_timestamp, 1, 7) AS order_month,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM master_orders
WHERE order_purchase_timestamp IS NOT NULL
GROUP BY order_month
ORDER BY order_month;

-- =====================================================
-- QUERY 3: TOP PRODUCT CATEGORIES BY REVENUE
-- Objective: Identify highest revenue-generating categories
-- =====================================================

SELECT
    product_category_name_english,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM master_orders
WHERE product_category_name_english IS NOT NULL
GROUP BY product_category_name_english
ORDER BY total_revenue DESC
LIMIT 10;

-- =====================================================
-- QUERY 4: TOP 10 STATES BY REVENUE
-- Objective: Identify highest revenue-generating states
-- =====================================================

SELECT
    customer_state,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM master_orders
WHERE customer_state IS NOT NULL
GROUP BY customer_state
ORDER BY total_revenue DESC
LIMIT 10;

-- =====================================================
-- QUERY 5: TOP 10 CUSTOMERS BY SPENDING
-- Objective: Identify highest-value customers
-- =====================================================

SELECT
    customer_id,
    ROUND(SUM(payment_value), 2) AS total_spent
FROM master_orders
WHERE customer_id IS NOT NULL
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- =====================================================
-- QUERY 6: TOP 10 SELLERS BY REVENUE
-- Objective: Identify highest-performing sellers
-- =====================================================

SELECT
    seller_id,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM master_orders
WHERE seller_id IS NOT NULL
GROUP BY seller_id
ORDER BY total_revenue DESC
LIMIT 10;

-- =====================================================
-- QUERY 7: LATE DELIVERY ANALYSIS
-- Objective: Analyze delayed order percentage
-- =====================================================

SELECT
    is_late,
    COUNT(order_id) AS total_orders,
    ROUND(
        COUNT(order_id) * 100.0 /
        (SELECT COUNT(*) FROM master_orders),
        2
    ) AS percentage
FROM master_orders
GROUP BY is_late;

-- =====================================================
-- QUERY 8: CUSTOMER SATISFACTION ANALYSIS
-- Objective: Analyze customer review score distribution
-- =====================================================

SELECT
    review_score,
    COUNT(*) AS total_reviews
FROM master_orders
WHERE review_score IS NOT NULL
GROUP BY review_score
ORDER BY review_score DESC;

-- =====================================================
-- QUERY 9: PAYMENT METHOD ANALYSIS
-- Objective: Analyze customer payment preferences
-- =====================================================

SELECT
    payment_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM master_orders
GROUP BY payment_type
ORDER BY total_revenue DESC;

-- =====================================================
-- QUERY 10: ORDER STATUS ANALYSIS
-- Objective: Analyze order fulfillment performance
-- =====================================================

SELECT
    order_status,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(
        COUNT(DISTINCT order_id) * 100.0 /
        (SELECT COUNT(DISTINCT order_id) FROM master_orders),
        2
    ) AS percentage
FROM master_orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- =====================================================
-- QUERY 11: DELIVERY TIME ANALYSIS
-- Objective: Analyze average order delivery duration
-- =====================================================

SELECT
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days,
    MIN(delivery_days) AS min_delivery_days,
    MAX(delivery_days) AS max_delivery_days
FROM master_orders
WHERE delivery_days IS NOT NULL;

-- =====================================================
-- QUERY 12: REVENUE VS CUSTOMER SATISFACTION
-- Objective: Analyze revenue contribution by review score
-- =====================================================

SELECT
    review_score,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(AVG(payment_value), 2) AS avg_order_value,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM master_orders
WHERE review_score IS NOT NULL
GROUP BY review_score
ORDER BY review_score DESC;

-- ============================================
-- QUERY 13: MONTHLY ORDER TREND ANALYSIS
-- Objective: Analyze monthly order volume trend
-- ============================================

SELECT 
    order_month,
    COUNT(DISTINCT order_id) AS total_orders
FROM master_orders
GROUP BY order_month
ORDER BY order_month;

-- ============================================
-- QUERY 14: TOP PRODUCT CATEGORIES BY ORDERS
-- Objective: Identify most sold product categories
-- ============================================

SELECT 
    product_category_name_english,
    COUNT(DISTINCT order_id) AS total_orders
FROM master_orders
WHERE product_category_name_english != 'Unknown'
GROUP BY product_category_name_english
ORDER BY total_orders DESC
LIMIT 10;

-- ============================================
-- QUERY 15: TOP SELLERS BY REVENUE
-- Objective: Identify highest revenue sellers
-- ============================================

SELECT
    seller_id,
    ROUND(SUM(payment_value), 2) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM master_orders
GROUP BY seller_id
ORDER BY total_revenue DESC
LIMIT 10;

-- ============================================
-- QUERY 16: REPEAT CUSTOMER ANALYSIS
-- Objective: Identify repeat vs one-time customers
-- ============================================

SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(customer_id) AS total_customers,
    ROUND(
        COUNT(customer_id) * 100.0 /
        (SELECT COUNT(DISTINCT customer_id) FROM master_orders),
        2
    ) AS percentage
FROM (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders
    FROM master_orders
    GROUP BY customer_id
) customer_orders
GROUP BY customer_type
ORDER BY total_customers DESC;

-- ============================================
-- QUERY 17: AVERAGE ORDER VALUE (AOV)
-- Objective: Analyze average customer spending
-- ============================================

SELECT
    ROUND(AVG(payment_value), 2) AS avg_order_value,
    ROUND(MIN(payment_value), 2) AS min_order_value,
    ROUND(MAX(payment_value), 2) AS max_order_value
FROM master_orders
WHERE payment_value IS NOT NULL;

-- ============================================
-- QUERY 18: REVENUE CONTRIBUTION BY STATE
-- Objective: Analyze state-wise revenue share
-- ============================================

SELECT
    customer_state,
    ROUND(SUM(payment_value), 2) AS total_revenue,
    ROUND(
        SUM(payment_value) * 100.0 /
        (SELECT SUM(payment_value)
         FROM master_orders
         WHERE payment_value IS NOT NULL),
        2
    ) AS revenue_percentage
FROM master_orders
WHERE customer_state IS NOT NULL
GROUP BY customer_state
ORDER BY total_revenue DESC;

-- ============================================
-- QUERY 19: CATEGORY SATISFACTION ANALYSIS
-- Objective: Analyze customer satisfaction
-- by product category
-- ============================================

SELECT
    product_category_name_english,
    ROUND(AVG(review_score), 2) AS avg_review_score,
    COUNT(order_id) AS total_orders
FROM master_orders
WHERE review_score IS NOT NULL
AND product_category_name_english != 'Unknown'
GROUP BY product_category_name_english
HAVING total_orders > 100
ORDER BY avg_review_score DESC
LIMIT 10;

-- ============================================
-- QUERY 20: MONTHLY REVENUE TREND
-- Objective: Analyze revenue growth trend
-- ============================================

SELECT
    order_month,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM master_orders
GROUP BY order_month
ORDER BY order_month;