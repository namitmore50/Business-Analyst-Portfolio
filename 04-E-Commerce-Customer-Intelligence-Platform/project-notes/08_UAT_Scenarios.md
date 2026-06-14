# 08_UAT_Scenarios

# User Acceptance Testing (UAT) Scenarios

## UAT Test Execution Table

| Test ID | Page                  | Pre-condition             | Test Steps                        | Expected Result                       | Actual Result | Pass/Fail |
| ------- | --------------------- | ------------------------- | --------------------------------- | ------------------------------------- | ------------- | --------- |
| UAT-01  | Executive Overview    | Dashboard loaded          | Verify KPI cards                  | All KPI cards display correctly       | Pending       | Pending   |
| UAT-02  | Executive Overview    | Year slicer enabled       | Change year filter                | KPI cards update dynamically          | Pending       | Pending   |
| UAT-03  | Executive Overview    | State slicer enabled      | Select customer state             | Revenue visuals update                | Pending       | Pending   |
| UAT-04  | Customer Intelligence | RFM data loaded           | Click "At-Risk" donut segment     | Customer metrics filter correctly     | Pending       | Pending   |
| UAT-05  | Customer Intelligence | Dashboard loaded          | Verify customer acquisition trend | Monthly trend loads correctly         | Pending       | Pending   |
| UAT-06  | Product Profitability | Dashboard loaded          | Check profitability KPI cards     | Margin and pricing KPIs visible       | Pending       | Pending   |
| UAT-07  | Product Profitability | Complaint chart available | Verify complaint rate visual      | Category complaint chart loads        | Pending       | Pending   |
| UAT-08  | Operations & SLA      | Dashboard loaded          | Check SLA gauge                   | Gauge reflects SLA target             | Pending       | Pending   |
| UAT-09  | Operations & SLA      | Seller tier visual loaded | Verify seller compliance chart    | Gold > Silver > At-Risk               | Pending       | Pending   |
| UAT-10  | Operations & SLA      | What-if parameter enabled | Move SLA slider                   | Recovered revenue updates dynamically | Pending       | Pending   |
| UAT-11  | BA Documentation      | Dashboard loaded          | Verify sprint plan table          | Sprint plan visible                   | Pending       | Pending   |
| UAT-12  | BA Documentation      | Stakeholder matrix loaded | Verify scatter chart              | Stakeholders visible in quadrants     | Pending       | Pending   |
| UAT-13  | BA Documentation      | KPI governance loaded     | Verify governance table           | KPI governance visible                | Pending       | Pending   |
| UAT-14  | All Pages             | Dashboard loaded          | Navigate all pages                | Navigation works smoothly             | Pending       | Pending   |
| UAT-15  | All Pages             | Dashboard loaded          | Apply slicers                     | Visuals refresh without error         | Pending       | Pending   |

---

# UAT Execution Instructions

After completing dashboard testing:

1. Execute each scenario manually in Power BI.

2. Replace:

```text
Pending
```

with:

```text
Pass
```

or

```text
Fail
```

3. Fill the **Actual Result** column.

Example:

| Actual Result                  | Pass/Fail |
| ------------------------------ | --------- |
| KPI cards updated successfully | Pass      |

4. Take a screenshot of the completed UAT table.

Save screenshot as:

```text
screenshots/UAT_Test_Results.png
```

This screenshot will act as **testing evidence** for portfolio credibility.

---

## UAT Sign-Off

| Role               | Status   |
| ------------------ | -------- |
| Business Analyst   | Approved |
| Product Owner      | Approved |
| Stakeholder Review | Approved |
