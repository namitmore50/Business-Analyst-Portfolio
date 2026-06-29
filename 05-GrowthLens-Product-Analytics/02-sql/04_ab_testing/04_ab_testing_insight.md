## Query 21: Sample Ratio Mismatch (SRM) Check

### Key Finding
Treatment and Control groups received nearly identical traffic allocation (50.02% vs 49.98%).

### Business Insight
The experiment passed the SRM check, indicating no traffic allocation issues or randomization failures. This validates the integrity of the A/B test and allows reliable interpretation of experiment outcomes.
## Query 22: Conversion Rate by Experiment Group

### Key Finding
The Control group achieved a conversion rate of 12.11%, compared to 11.96% for the Treatment group.

### Business Insight
The experimental variation produced a small negative impact on conversion performance. Users exposed to the Treatment converted less frequently than users exposed to the Control experience.

### Recommendation
Do not launch the Treatment experience without further investigation. Analyze user behavior, funnel drop-offs, and segment-level performance to identify why conversion declined.
## Query 23: Daily Conversion Rate Trend

### Key Finding
Control maintained higher conversion rates across most experiment days, while Treatment only outperformed on a limited number of days.

### Business Insight
Conversion performance remained stable throughout the experiment, indicating no meaningful novelty effect. Users did not become more likely to convert as they gained exposure to the Treatment experience.

### Recommendation
Focus on diagnosing UX or funnel differences between Control and Treatment rather than extending the test duration.
## Query 24: Segment-Level Experiment Results

### Key Finding
Control performs better for most New User segments, while Treatment outperforms Control for several Returning User segments.

### Business Insight
The experiment impacts customer segments differently. New users generally respond better to the Control experience, whereas returning users show stronger engagement with the Treatment on selected days.

### Recommendation
Consider segment-specific deployment rather than a universal rollout. Additional testing focused on returning users may reveal opportunities for targeted optimization.
## Query 25: Statistical Comparison Summary

### Key Finding
The Treatment group generated a -0.15 percentage point absolute lift and a -1.24% relative lift compared with Control.

### Business Insight
The experimental variation reduced conversion performance rather than improving it. The negative lift indicates that the Treatment experience does not provide sufficient business value for deployment.

### Recommendation
Do not roll out the Treatment. Conduct deeper funnel analysis to identify where conversion losses occurred.
## Query 26: Revenue Impact Projection

### Key Finding
The observed -1.24% conversion lift translates into an estimated annual revenue loss of ₹1.29 million.

### Business Insight
Even minor conversion declines can create substantial financial consequences when applied across a large customer base. The Treatment variant would negatively impact long-term business performance.

### Recommendation
Maintain the Control experience and prioritize redesigning the Treatment before running another experiment.