# Data Cleaning Log

## E-Commerce Customer Intelligence Platform

---

## Objective

The objective of this process was to transform raw e-commerce transactional data into a clean, analytics-ready dataset for business intelligence, SQL analysis, dashboarding, customer intelligence, and performance reporting.

---

## 1. Dataset Collection

The Brazilian E-Commerce (Olist) dataset was imported from Kaggle.

### Source Files Imported

1. `olist_orders_dataset.csv`
2. `olist_customers_dataset.csv`
3. `olist_order_items_dataset.csv`
4. `olist_products_dataset.csv`
5. `olist_sellers_dataset.csv`
6. `olist_order_payments_dataset.csv`
7. `olist_order_reviews_dataset.csv`
8. `olist_geolocation_dataset.csv`
9. `product_category_name_translation.csv`

---

## 2. Data Loading

All raw CSV files were loaded into Python using **Pandas DataFrames** for preprocessing and transformation.

### Datasets Loaded

* Orders
* Customers
* Order Items
* Products
* Sellers
* Payments
* Reviews
* Geolocation
* Category Translation

**Status:** Successfully Loaded

---

## 3. Data Profiling

Initial profiling was performed to evaluate dataset quality and identify inconsistencies.

### Validation Checks Performed

* Dataset Shape Analysis
* Column Validation
* Data Type Inspection
* Missing Value Assessment
* Duplicate Review

### Key Observations

The **orders dataset** contained missing values in the following columns:

* `order_approved_at`
* `order_delivered_carrier_date`
* `order_delivered_customer_date`

### Business Interpretation

These missing values were expected because some orders were:

* Cancelled
* Processing
* Unavailable
* Not yet delivered

Therefore, records were retained to preserve business accuracy.

---

## 4. Date Standardization

Date-related fields were converted into proper datetime format to enable accurate time-based analysis.

### Columns Standardized

* `order_purchase_timestamp`
* `order_approved_at`
* `order_delivered_carrier_date`
* `order_delivered_customer_date`
* `order_estimated_delivery_date`

### Method Used

```python
pd.to_datetime(errors='coerce')
```

### Result

All date fields were successfully converted to:

```text
datetime64[ns]
```

This enabled delivery analysis, monthly trend tracking, and time-series reporting.

---

## 5. Feature Engineering

Several business-oriented features were created to improve analytical capability.

### Features Added

### delivery_days

Calculated the total delivery duration.

**Formula:**

```text
Delivery Date − Purchase Date
```

**Purpose:**
Evaluate logistics performance and delivery efficiency.

---

### is_late

Created a delivery performance indicator.

**Logic:**

* `1` → Late Delivery
* `0` → On-Time Delivery

**Purpose:**
Measure SLA adherence and operational performance.

---

### order_month

Extracted monthly order periods.

**Purpose:**
Enable monthly sales and order trend analysis.

---

### order_year

Extracted purchase year.

**Purpose:**
Support time-based filtering and reporting.

---

## 6. Product Category Translation

Portuguese product category names were translated into English for improved readability and business usability.

### Transformation Applied

Merged:

```text
products + product_category_name_translation
```

### Example Conversions

| Portuguese    | English        |
| ------------- | -------------- |
| perfumaria    | perfumery      |
| esporte_lazer | sports_leisure |
| bebes         | baby           |

Missing category names were replaced with:

```text
Unknown
```

**Purpose:**
Improve reporting clarity for business stakeholders.

---

## 7. Master Dataset Creation

A consolidated analytics dataset was created by merging multiple business tables.

### Tables Merged

* Orders
* Customers
* Order Items
* Products
* Payments
* Reviews

### Final Dataset Generated

```text
master_orders.csv
```

### Final Dataset Size

```text
119,143 rows × 22 columns
```

### Observation

The row count increased because a single order may contain multiple products/items.

This accurately reflects real-world transactional behavior.

---

## 8. Clean Dataset Export

Processed datasets were exported for downstream analytics and dashboard development.

### Files Generated

* `master_orders.csv`
* `orders_clean.csv`
* `products_clean.csv`

### Export Directory

```text
cleaned-data/
```

---

## 9. Data Quality Validation

Final validation checks were performed on critical business fields.

### Critical Column Validation

| Column      | Null Values | Status |
| ----------- | ----------- | ------ |
| order_id    | 0           | Valid  |
| customer_id | 0           | Valid  |

### Minor Missing Values

| Column        | Missing Records |
| ------------- | --------------- |
| payment_value | 3               |
| review_score  | 997             |

### Assessment

Minor missing values were retained because the percentage impact was negligible and preserving records maintained dataset integrity.

---

## Final Outcome

A production-ready, analytics-ready dataset was successfully created for:

* SQL Analytics
* Business Intelligence Reporting
* Power BI Dashboards
* Customer Intelligence
* Revenue Analysis
* Seller Performance Tracking
* Delivery Performance Monitoring
* Customer Satisfaction Analysis
* Trend & Forecasting Analysis
