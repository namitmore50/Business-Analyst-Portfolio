# Day 01 — Dataset Verification Log

## Project

GrowthLens — Product Growth Intelligence & Experimentation Analytics Platform

## Dataset 1 — TheLook Ecommerce

| File                     | Actual Rows |
| ------------------------ | ----------- |
| users.csv                | 100,000     |
| orders.csv               | 125,226     |
| order_items.csv          | 181,759     |
| events.csv               | 2,431,963   |
| products.csv             | 29,120      |
| inventory_items.csv      | 490,705     |
| distribution_centers.csv | 10          |

### Notes

* Dataset successfully downloaded and verified.
* Row counts differ slightly from planning assumptions (expected due to Kaggle mirror variation).
* No missing files detected.

---

## Dataset 2 — Ecommerce Clickstream

| File       | Actual Rows |
| ---------- | ----------- |
| events.csv | 885,129     |

### Notes

* October 2019 clickstream dataset loaded successfully.
* File size and row count appear realistic for behavioral event analysis.

---

## Dataset 3 — A/B Testing Dataset

| File        | Actual Rows |
| ----------- | ----------- |
| ab_data.csv | 294,478     |

### Columns Verified

```python
['user_id', 'timestamp', 'group', 'landing_page', 'converted']
```

### Important Observation

* Dataset uses column name `group` instead of `group_name`.
* Future SQL and Python code must adapt accordingly.

---

## Day 01 Status

✅ Folder structure created
✅ Datasets downloaded
✅ Dataset verification complete
✅ Row counts validated
