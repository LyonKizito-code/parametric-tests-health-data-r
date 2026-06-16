# Summary of Findings and Conclusions

This document summarises the main statistical findings from the R scripts in this repository, using an example health dataset (`Health_Data`).

## Descriptive statistics

- Systolic blood pressure (SBP) and diastolic blood pressure (DBP) were summarised using means, medians, and modes. For example, SBP showed a central tendency around the low 130s mmHg with evidence of right-skewness and some high values.
- Income had a minimum of about 52,900, first quartile near 68,600, median around 86,600, third quartile near 99,700, and maximum around 117,200, indicating a moderately spread but roughly symmetric distribution.
- A boxplot of income visualised the five-number summary and highlighted the central 50% of observations and any potential outliers.

## Normality assessment

- Normality of SBP was assessed using a histogram, Q–Q plot, and Shapiro–Wilk test. The visual plots showed approximate normality in the centre with deviations in the tails, and the formal test output guided decisions about whether normality was a reasonable working assumption.
- For two-sample and paired tests, normality of the relevant variables or of the pairwise differences was assessed, since the t-test assumes approximate normality of the underlying population or of the difference scores.

## One-sample t-test (DBP vs 80 mmHg)

- A one-sample t-test compared mean DBP to a hypothetical value of 80 mmHg.
- The test returned a small p-value (<< 0.05) and a confidence interval for the mean that lay entirely above 80 mmHg, leading to the conclusion that the population mean DBP is significantly different from 80 mmHg and, in fact, higher.

## Independent two-sample t-tests

### Age by diabetes status

- Age distributions for two diabetes groups were summarised and visualised using boxplots. Shapiro–Wilk tests and an F-test supported approximate normality and homogeneity of variances.
- An independent two-sample t-test (with equal variances) compared mean age between the diabetes groups. The p-value exceeded 0.05, and the 95% confidence interval for the mean difference contained 0, indicating no statistically significant difference in mean age between the groups.

### SBP by peptic ulcer status

- SBP was summarised by peptic ulcer status and visualised using a boxplot. Group means suggested slightly higher SBP in one group, but the distributions showed overlap.
- Normality was reasonable in one group but less so in the other; an F-test indicated similar variances. A Welch two-sample t-test was used to compare mean SBP between ulcer groups.
- The resulting p-value was greater than 0.05 and the confidence interval for the mean difference spanned values close to 0, suggesting no clear evidence of an association between SBP and peptic ulcer status in this sample.

## Paired t-test (pre-test vs post-test)

- Pre- and post-test scores were analysed using a paired t-test. Differences (pre − post) were computed and assessed for normality; the Shapiro–Wilk test did not indicate strong departures from normality.
- The paired t-test produced a large-magnitude negative mean difference (pre − post) and a very small p-value, with a confidence interval for the mean difference entirely below 0.
- Interpreting the sign of the difference, post-test scores were, on average, substantially higher than pre-test scores (by roughly 30–40 points), providing strong evidence of improvement after the intervention.

## One-way ANOVA (income by religion_2)

- A one-way ANOVA model assessed whether mean income differed across categories of a categorical variable `religion_2`.
- The ANOVA summary reported an F-statistic with a p-value below 0.05, leading to the conclusion that at least one group mean income differs from the others.
- Diagnostic plots (residuals vs fitted, Q–Q plot of residuals, scale–location, residuals vs leverage) were generated to check ANOVA assumptions of normality, homoscedasticity, and absence of extreme influential points.

## General lessons and best practices

- Always examine distributions (histograms, Q–Q plots, boxplots) alongside formal tests such as Shapiro–Wilk; large samples often flag minor deviations that are not practically important.
- For independent t-tests, check both normality and equality of variances; use Welch’s t-test when equal variances are questionable.
- For paired t-tests, focus on the distribution of the **differences**, not the raw scores separately.
- Report both p-values and confidence intervals, as the latter provide information about the magnitude and direction of effects, not just statistical significance.
- Clear, consistent object naming and modular scripts (separate files for descriptives, t-tests, ANOVA, etc.) make analyses easier to understand and re-use, especially in collaborative or consulting contexts.
