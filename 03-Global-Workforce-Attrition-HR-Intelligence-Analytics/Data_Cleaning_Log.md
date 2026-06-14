# Data Cleaning Log

## Dataset 1 — IBM Employee Attrition

### Cleaning Steps Applied

* Removed constant columns:

  * EmployeeCount
  * Over18
  * StandardHours
* Converted Attrition:

  * Yes → 1
  * No → 0
* Mapped Job Satisfaction scale:

  * 1 → Low
  * 2 → Medium
  * 3 → High
  * 4 → Very High
* Created `TenureBand`:

  * <1yr
  * 1–3 Years
  * 3–6 Years
  * 6–10 Years
  * 10+ Years
* Created `MonthlyIncome_Annual`:

  * MonthlyIncome × 12

### Null Handling

* No major missing values found.

---

## Dataset 2 — Workforce Planning

### Cleaning Steps Applied

* Filled `previous_year_rating` missing values using mode:

  * 3.0
* Filled `education` missing values:

  * Bachelors
* Created `performance_tier`:

  * 1–2 → Low
  * 3 → Mid
  * 4–5 → High
* Kept region codes unchanged for consistency.
* Created `Region_Display` derived field.
* Created `Top_Performer`:

  * KPI > 80 = 1 AND awards_won = 1

### Null Handling

* Education nulls resolved.
* Previous year rating nulls resolved.

---

## Dataset 3 — Salary Benchmark

### Cleaning Steps Applied

* Filtered:

  * Full-time employees only
  * Work year = 2023
* Converted salary to `$K` format:

  * salary_in_usd ÷ 1000
* Renamed benchmark scope:

  * Data & Analytics Market Benchmark
* Computed salary benchmark metrics:

  * P25
  * P50 (Median)
  * P75
  * P90
* Grouped analysis by:

  * job_category
  * experience_level

### Null Handling

* No major null values impacting analysis.

---

## Exported Clean Files

* ibm_clean.csv
* workforce_clean.csv
* salary_bench_2023.csv
