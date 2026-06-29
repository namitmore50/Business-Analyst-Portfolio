# GrowthLens Data Dictionary

## Dataset Overview

This document describes all datasets, fields, data types, business meanings, null handling procedures, and transformations applied during data cleaning.

---

# 1. users

Source: TheLook Ecommerce

Rows: 100,000

Primary Key: id

| Column         | Type     | Description            |
| -------------- | -------- | ---------------------- |
| id             | Integer  | Unique user identifier |
| first_name     | String   | Customer first name    |
| last_name      | String   | Customer last name     |
| email          | String   | Customer email         |
| age            | Integer  | Customer age           |
| gender         | String   | Customer gender        |
| state          | String   | Customer state         |
| street_address | String   | Address                |
| postal_code    | String   | Postal code            |
| city           | String   | City                   |
| country        | String   | Country                |
| latitude       | Float    | Latitude               |
| longitude      | Float    | Longitude              |
| traffic_source | String   | Acquisition source     |
| created_at     | Datetime | User signup date       |

### Engineered Columns

| Column       | Type     | Description                    |
| ------------ | -------- | ------------------------------ |
| age_band     | Category | Age segmentation               |
| cohort_month | String   | First purchase month (YYYY-MM) |

### Null Handling

traffic_source NULL → Unknown

### Transformations

Gender standardized.

Age bands created:

* <18
* 18–24
* 25–34
* 35–44
* 45–54
* 55+

---

# 2. orders

Source: TheLook Ecommerce

Rows: 125,226

Primary Key: order_id

| Column       | Type     | Description             |
| ------------ | -------- | ----------------------- |
| order_id     | Integer  | Unique order identifier |
| user_id      | Integer  | Customer ID             |
| status       | String   | Order status            |
| gender       | String   | Customer gender         |
| created_at   | Datetime | Order creation date     |
| returned_at  | Datetime | Return date             |
| shipped_at   | Datetime | Shipping date           |
| delivered_at | Datetime | Delivery date           |
| num_of_item  | Integer  | Number of products      |

### Engineered Columns

| Column                | Type    | Description   |
| --------------------- | ------- | ------------- |
| order_completion_days | Float   | Delivery time |
| is_returned           | Integer | Return flag   |
| order_month           | String  | YYYY-MM       |
| order_quarter         | String  | Quarter       |
| order_year            | Integer | Year          |

### Null Handling

Lifecycle NULLs retained.

### Transformations

Datetime conversion completed.

---

# 3. order_items

Source: TheLook Ecommerce

Rows: 181,759

Primary Key: id

| Column            | Type     | Description           |
| ----------------- | -------- | --------------------- |
| id                | Integer  | Order item identifier |
| order_id          | Integer  | Order ID              |
| user_id           | Integer  | Customer ID           |
| product_id        | Integer  | Product ID            |
| inventory_item_id | Integer  | Inventory ID          |
| status            | String   | Item status           |
| created_at        | Datetime | Purchase timestamp    |
| shipped_at        | Datetime | Shipping timestamp    |
| delivered_at      | Datetime | Delivery timestamp    |
| returned_at       | Datetime | Return timestamp      |
| sale_price        | Float    | Sale price            |

### Engineered Columns

| Column            | Type  | Description                          |
| ----------------- | ----- | ------------------------------------ |
| sale_price_capped | Float | Sale price after 99th percentile cap |
| gross_margin      | Float | Sale Price − Product Cost            |

### Null Handling

No NULL sale_price values.

### Transformations

99th percentile cap:

300.00

Rows affected:

1,817

Cancelled items separated for revenue analysis.

---

# 4. products

Source: TheLook Ecommerce

Rows: 29,120

Primary Key: id

| Column                 | Type    | Description         |
| ---------------------- | ------- | ------------------- |
| id                     | Integer | Product ID          |
| cost                   | Float   | Product cost        |
| category               | String  | Product category    |
| name                   | String  | Product name        |
| brand                  | String  | Brand               |
| retail_price           | Float   | Retail price        |
| department             | String  | Department          |
| sku                    | String  | SKU                 |
| distribution_center_id | Integer | Distribution center |

### Engineered Columns

| Column     | Type     | Description             |
| ---------- | -------- | ----------------------- |
| price_tier | Category | Product pricing segment |

### Price Tiers

Budget < ₹500

Mid ₹500–₹2000

Premium > ₹2000

### Data Quality Findings

Products below cost:

0

---

# 5. events

Source: TheLook Ecommerce

Rows After Cleaning: 814,748

| Column          | Type     | Description        |
| --------------- | -------- | ------------------ |
| id              | Integer  | Event ID           |
| user_id         | Integer  | User ID            |
| sequence_number | Integer  | Event sequence     |
| session_id      | String   | Session identifier |
| created_at      | Datetime | Event timestamp    |
| ip_address      | String   | User IP            |
| city            | String   | City               |
| state           | String   | State              |
| postal_code     | String   | Postal code        |
| browser         | String   | Browser            |
| traffic_source  | String   | Source             |
| uri             | String   | Page URI           |
| event_type      | String   | Event type         |

### Engineered Columns

| Column            | Type     | Description    |
| ----------------- | -------- | -------------- |
| funnel_stage      | Category | Funnel mapping |
| page_category     | Category | URI category   |
| event_hour        | Integer  | Hour of event  |
| event_day_of_week | String   | Weekday        |

### Funnel Mapping

product → Product View

cart → Add to Cart

purchase → Purchase

home → Non-Funnel

department → Non-Funnel

cancel → Non-Funnel

### Cleaning Rules

Removed NULL user_id.

Removed duplicate:

(user_id, session_id, event_type)

keeping first occurrence only.

---

# 6. inventory_items

Rows: 490,705

Primary Key: id

Contains warehouse-level inventory records and product fulfillment tracking.

---

# 7. distribution_centers

Rows: 10

Primary Key: id

Contains warehouse and distribution center locations.

---

# 8. channel_costs

Rows: 36

Manually created dataset.

| Column      | Type    | Description       |
| ----------- | ------- | ----------------- |
| channel     | String  | Marketing channel |
| month       | Integer | Month             |
| year        | Integer | Year              |
| spend_inr   | Float   | Spend             |
| impressions | Integer | Impressions       |
| clicks      | Integer | Clicks            |

---

# 9. ab_test

Rows After Cleaning: 290,688

| Column       | Type     | Description          |
| ------------ | -------- | -------------------- |
| user_id      | Integer  | Experiment user      |
| timestamp    | Datetime | Experiment timestamp |
| group_name   | String   | Control/Treatment    |
| landing_page | String   | Old/New page         |
| converted    | Integer  | Conversion flag      |

### Engineered Columns

| Column     | Type    | Description           |
| ---------- | ------- | --------------------- |
| day_number | Integer | Experiment day number |

### Cleaning Rules

Removed contaminated users appearing in multiple groups.

Contaminated Users Removed:

1,895

Rows Removed:

3,790

### SRM Validation

Control:

145,307

Treatment:

145,381

SRM:

0.0255%

Result:

PASS
