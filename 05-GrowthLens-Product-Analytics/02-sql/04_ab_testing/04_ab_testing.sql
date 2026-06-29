/* ==================================================
   QUERY 21: SRM CHECK
================================================== */

SELECT

    group_name,

    COUNT(DISTINCT user_id) AS users,

    ROUND(
        100.0 * COUNT(DISTINCT user_id) /
        SUM(COUNT(DISTINCT user_id)) OVER (),
        2
    ) AS pct_of_total

FROM ab_test

GROUP BY group_name

ORDER BY users DESC;
/*
==================================================
QUERY 21 RESULT SUMMARY
==================================================

Group Distribution:

Treatment : 146,284 Users (50.02%)
Control   : 146,195 Users (49.98%)

Difference:
89 Users

Key Findings:

- Traffic allocation is almost perfectly balanced.
- Treatment and Control groups each received ~50% of users.
- Difference between groups is only 89 users.
- No evidence of Sample Ratio Mismatch (SRM).

Business Insight:

The experiment passed the SRM validation check. Traffic was distributed correctly between Control and Treatment groups, making subsequent A/B test results statistically trustworthy.

==================================================
*/
/* ==================================================
   QUERY 22: CONVERSION RATE BY EXPERIMENT GROUP
================================================== */

SELECT

    a.group_name,

    COUNT(DISTINCT a.user_id) AS users,

    COUNT(
        DISTINCT CASE
            WHEN a.converted = 1
            THEN a.user_id
        END
    ) AS converters,

    ROUND(
        100.0 *
        COUNT(DISTINCT CASE WHEN a.converted = 1 THEN a.user_id END)
        /
        COUNT(DISTINCT a.user_id),
        2
    ) AS conversion_rate_pct

FROM ab_test a

GROUP BY a.group_name

ORDER BY conversion_rate_pct DESC;
/*
==================================================
QUERY 22 RESULT SUMMARY
==================================================

Control Group

Users        : 146,195
Converters   : 17,704
Conversion   : 12.11%

Treatment Group

Users        : 146,284
Converters   : 17,492
Conversion   : 11.96%

Observed Lift

Treatment vs Control:
-0.15 percentage points

Relative Lift:
-1.24%

Key Findings:
- Control outperformed Treatment.
- Treatment reduced conversion rate slightly.
- Difference is small but unfavorable.
- No evidence that the new experience improved performance.

Business Insight:
The Treatment variation did not improve conversion performance. Based on observed conversion rates, the Control experience remains the stronger-performing version.

==================================================
*/
/* ==================================================
   QUERY 23: DAILY CONVERSION RATE TREND
================================================== */

SELECT

    DATE(timestamp) AS test_date,

    group_name,

    COUNT(DISTINCT user_id) AS users,

    SUM(converted) AS converters,

    ROUND(
        100.0 * SUM(converted)
        / COUNT(DISTINCT user_id),
        2
    ) AS conversion_rate_pct

FROM ab_test

GROUP BY
    DATE(timestamp),
    group_name

ORDER BY
    test_date,
    group_name;

/*
==================================================
QUERY 23 RESULT SUMMARY
==================================================

Average Conversion Performance

Control   : 12.11%
Treatment : 11.96%

Days Treatment Outperformed Control

06-Jan-2017 : 12.40% vs 11.64%
08-Jan-2017 : 12.09% vs 11.90%
10-Jan-2017 : 12.66% vs 11.32%
17-Jan-2017 : 12.73% vs 12.23%
24-Jan-2017 : 12.05% vs 11.84%

Days Control Outperformed Treatment

Majority of experiment days

Key Findings:
- Daily conversion rates remained relatively stable throughout the experiment.
- No strong novelty effect was observed.
- Treatment occasionally outperformed Control on individual days.
- Control maintained higher conversion on most days.
- Performance gap remained consistent over time.

Business Insight:
The Treatment variant did not show signs of improving with user exposure over time. The absence of a novelty effect suggests the negative conversion impact is likely inherent to the new experience rather than a temporary adjustment period.

==================================================
*/
/* ==================================================
   QUERY 24: SEGMENT LEVEL EXPERIMENT RESULTS
================================================== */

WITH user_segments AS (

    SELECT

        user_id,

        CASE
            WHEN ROW_NUMBER() OVER (
                PARTITION BY user_id
                ORDER BY timestamp
            ) = 1
            THEN 'New User'
            ELSE 'Returning User'
        END AS user_type

    FROM ab_test

)

SELECT

    us.user_type,

    strftime('%w', a.timestamp) AS day_of_week,

    a.group_name,

    COUNT(DISTINCT a.user_id) AS users,

    SUM(a.converted) AS converters,

    ROUND(
        100.0 * SUM(a.converted)
        / COUNT(DISTINCT a.user_id),
        2
    ) AS conversion_rate_pct

FROM ab_test a

JOIN user_segments us
    ON a.user_id = us.user_id

GROUP BY
    us.user_type,
    day_of_week,
    a.group_name

ORDER BY
    us.user_type,
    day_of_week,
    a.group_name;
/*
==================================================
QUERY 24 RESULT SUMMARY
==================================================

New Users

Control Conversion Range:
11.64% - 12.45%

Treatment Conversion Range:
11.72% - 12.22%

Control outperformed Treatment on:
Sunday, Monday, Wednesday, Thursday, Saturday

Treatment outperformed Control on:
Tuesday, Friday

Returning Users

Treatment Outperformed:
Sunday (13.03% vs 12.57%)
Monday (13.21% vs 12.63%)
Tuesday (12.87% vs 11.52%)
Thursday (16.09% vs 11.40%)

Control Outperformed:
Wednesday (15.83% vs 13.64%)
Friday (15.23% vs 12.62%)
Saturday (15.06% vs 10.40%)

Key Findings:
- Control consistently performs better for New Users.
- Treatment shows stronger performance for some Returning User segments.
- Returning users exhibit higher conversion rates than new users overall.
- Treatment may appeal more to existing customers than first-time visitors.
- Experiment impact varies significantly by customer segment.

Business Insight:
The Treatment experience appears less effective for new-user acquisition but shows promising results among certain returning-user cohorts. A segmented rollout strategy may be more effective than a full rollout.

==================================================
*/
/* ==================================================
   QUERY 25: STATISTICAL COMPARISON SUMMARY
================================================== */

WITH experiment_summary AS (

    SELECT

        group_name,

        COUNT(DISTINCT user_id) AS users,

        SUM(converted) AS converters,

        1.0 * SUM(converted) /
        COUNT(DISTINCT user_id) AS conversion_rate

    FROM ab_test

    GROUP BY group_name

)

SELECT

    ROUND(
        100.0 *
        MAX(CASE WHEN group_name='control'
        THEN conversion_rate END),
        2
    ) AS control_cr,

    ROUND(
        100.0 *
        MAX(CASE WHEN group_name='treatment'
        THEN conversion_rate END),
        2
    ) AS treatment_cr,

    ROUND(
        100.0 *
        (
            MAX(CASE WHEN group_name='treatment'
            THEN conversion_rate END)
            -
            MAX(CASE WHEN group_name='control'
            THEN conversion_rate END)
        ),
        2
    ) AS absolute_lift_pct,

    ROUND(
        100.0 *
        (
            (
                MAX(CASE WHEN group_name='treatment'
                THEN conversion_rate END)
                /
                MAX(CASE WHEN group_name='control'
                THEN conversion_rate END)
            ) - 1
        ),
        2
    ) AS relative_lift_pct

FROM experiment_summary;

/*
==================================================
QUERY 25 RESULT SUMMARY
==================================================

Control Conversion Rate:
12.12%

Treatment Conversion Rate:
11.97%

Absolute Lift:
-0.15%

Relative Lift:
-1.24%

Key Findings:
- Treatment underperformed Control.
- Conversion decreased by 0.15 percentage points.
- Relative performance declined by 1.24%.
- No evidence of positive experiment impact.
- Control remains the superior-performing experience.

Business Insight:
The experiment generated a negative conversion lift. Deploying the Treatment would likely reduce overall conversions and business performance.

Recommendation:
Retain the Control experience and investigate which elements of the Treatment contributed to lower conversion rates.

==================================================
*/
//* ==================================================
   QUERY 26: REVENUE IMPACT PROJECTION
================================================== */

WITH experiment_summary AS (

    SELECT

        group_name,

        COUNT(DISTINCT user_id) AS users,

        SUM(converted) AS converters,

        1.0 * SUM(converted) /
        COUNT(DISTINCT user_id) AS conversion_rate

    FROM ab_test

    GROUP BY group_name

),

lift_calc AS (

    SELECT

        MAX(CASE WHEN group_name='control'
            THEN conversion_rate
        END) AS control_cr,

        MAX(CASE WHEN group_name='treatment'
            THEN conversion_rate
        END) AS treatment_cr

    FROM experiment_summary

)

SELECT

    100000 AS monthly_active_users,

    86.46 AS average_order_value,

    ROUND(
        ((treatment_cr / control_cr) - 1) * 100,
        2
    ) AS relative_lift_pct,

    ROUND(
        ((treatment_cr / control_cr) - 1)
        * 100000
        * 86.46
        * 12,
        2
    ) AS annual_revenue_impact

FROM lift_calc;
/*
==================================================
QUERY 26 RESULT SUMMARY
==================================================

Monthly Active Users:
100,000

Average Order Value:
₹86.46

Relative Lift:
-1.24%

Projected Annual Revenue Impact:
-₹1,285,883.28

Key Findings:
- Treatment generated negative conversion lift.
- Projected annual revenue impact is a loss of ₹1.29 Million.
- Deploying Treatment would reduce yearly revenue.
- Small conversion declines create significant business impact at scale.
- Control remains the financially superior experience.

Business Insight:
Although the conversion difference appears small (-1.24%), scaling the impact across 100,000 monthly active users results in an estimated annual revenue loss exceeding ₹1.28 million.

Recommendation:
Do not launch the Treatment variant. Retain the Control experience and redesign the Treatment before future testing.

==================================================
*/