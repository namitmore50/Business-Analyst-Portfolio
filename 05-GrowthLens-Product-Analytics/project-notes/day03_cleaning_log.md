# Day 3 — Core Table Data Cleaning

Date: 17-Jun-2026

## Users Table

- Converted created_at to datetime
- Filled missing traffic_source with 'Unknown'
- Created age_band feature
- Created cohort_month feature using first order date
- Filtered analysis period to 2019-2024
- Final Shape: (100000, 17)

## Orders Table

- Converted all timestamp fields to datetime
- Created order_completion_days
- Created is_returned flag
- Created order_month
- Created order_quarter
- Created order_year
- Final Shape: (125226, 14)

## Order Items Table

- Verified no NULL sale prices
- Verified no zero sale prices
- Applied 99th percentile cap (₹300)
- Added sale_price_capped
- Joined product cost
- Added gross_margin
- Created revenue analysis dataset excluding cancelled records
- Final Shape: (181759, 15)

## Products Table

- Verified no retail_price < cost anomalies
- Reviewed all 26 categories
- No category standardization required
- Created price_tier segmentation
- Final Shape: (29120, 10)

## Exported Datasets

- cleaned_users.csv
- cleaned_orders.csv
- cleaned_order_items.csv
- cleaned_products.csv

Status: COMPLETE