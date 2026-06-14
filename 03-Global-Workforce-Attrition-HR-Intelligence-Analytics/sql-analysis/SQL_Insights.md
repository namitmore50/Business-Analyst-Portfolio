# SQL Analysis & Business Insights

## Project Objective

The purpose of this SQL analysis was to identify workforce attrition patterns, employee risk factors, salary differences, and departmental performance trends using structured SQL queries. The analysis supports HR decision-making, workforce planning, and employee retention strategies.

---

# Q1 — Department Attrition Ranking

### Business Objective

Identify departments with the highest employee attrition risk.

### SQL Concepts Used

* CTE (Common Table Expression)
* CASE WHEN
* Aggregate Functions
* RANK() Window Function

### Key Finding

Departments were ranked based on attrition rate to identify workforce instability.

### Business Insight

Departments with higher attrition require targeted retention strategies, workload balancing, and employee engagement programs.

### Recommendation

Prioritize high-risk departments for workforce intervention and retention planning.

---

# Q2 — Salary Comparison of Leavers vs Stayers

### Business Objective

Compare salary differences between employees who left and those who stayed across job roles.

### SQL Concepts Used

* CTE
* CASE WHEN
* AVG()
* GROUP BY

### Key Finding

Salary gaps varied across job roles, indicating compensation may influence employee retention.

### Business Insight

Employees with relatively lower salaries in certain job roles may show higher attrition tendencies.

### Recommendation

Review compensation benchmarking for high-risk job roles.

---

# Q3 — Workforce Performance by Department

### Business Objective

Analyze workforce training performance and KPI achievement by department.

### SQL Concepts Used

* GROUP BY
* AVG()
* ROUND()
* ORDER BY

### Key Finding

Departments showed different training performance and KPI achievement levels.

### Business Insight

Higher training effectiveness and KPI achievement may contribute to workforce stability and operational efficiency.

### Recommendation

Increase training interventions in lower-performing departments.

---

# Q4 — Cumulative Employee Exits by Department

### Business Objective

Track cumulative employee exits over tenure across departments.

### SQL Concepts Used

* WINDOW FUNCTION
* SUM() OVER()
* PARTITION BY
* ORDER BY

### Key Finding

Employee exits accumulated differently across departments over time.

### Business Insight

Certain departments may face long-term retention risks due to sustained employee exits.

### Recommendation

Develop department-specific retention strategies focused on employee lifecycle stages.

---

# Q5 — Employee Attrition Risk Classification

### Business Objective

Classify employees into Low, Medium, and High attrition risk categories.

### SQL Concepts Used

* CASE WHEN
* Conditional Logic
* Derived Columns

### Key Finding

Employees with overtime, lower satisfaction, and shorter tenure showed higher attrition risk.

### Business Insight

High-risk employees can be proactively identified for intervention.

### Recommendation

Implement early retention strategies for high-risk employee groups.

---

# Q6 — Departments with Attrition Above Company Average

### Business Objective

Identify departments where attrition exceeds company average.

### SQL Concepts Used

* HAVING
* Aggregate Functions
* Subquery
* GROUP BY

### Key Finding

Certain departments exceeded overall company attrition benchmarks.

### Business Insight

Departments above company average attrition represent strategic workforce risk.

### Recommendation

Introduce department-specific retention planning and performance reviews.

---

# Conclusion

The SQL analysis demonstrated advanced workforce analytics techniques to uncover employee attrition patterns, workforce performance gaps, salary trends, and retention risks. These findings can help organizations make informed HR decisions, improve employee engagement, and reduce attrition-related business costs.
