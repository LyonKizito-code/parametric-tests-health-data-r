# Parametric Tests on Health Data in R

This repository contains an end-to-end worked example of **parametric tests** in R using a health dataset (`Health_Data`). It is structured as if for a university MSc Data Science assignment or a consulting-style reproducible analysis.

Topics covered:
- Normality assessment (Shapiro–Wilk, histograms, Q–Q plots)
- One-sample t-test
- Independent (two-sample) t-test
- Paired t-test (pre–post evaluation)
- One-way ANOVA
- Basic descriptive statistics (mean, median, mode, five-number summary, boxplots)
- Good-practice diagnostics (checking assumptions, equal variances, interpretation of p-values and confidence intervals)

The analysis is based on an example `Health_Data` data frame with variables such as:
- `sbp`: systolic blood pressure
- `dbp`: diastolic blood pressure
- `age`: age in years
- `income`: numeric income variable
- `diabetes`: indicator for diabetes status
- `pepticulcer`: indicator for peptic ulcer status
- `pre_test`, `post_test`: pre/post intervention test scores

> Note: The dataset itself is **not** included, since it may be course‑specific. All code is written so that if you have a compatible `Health_Data` object in your R session, you can run the scripts directly.

## Repository structure

- `R/01_descriptives.R` – descriptive statistics and modes for `sbp`, `dbp`, `income`, plus income boxplot.
- `R/02_normality.R` – normality checks for `sbp` and other variables (histograms, Q–Q plots, Shapiro–Wilk).
- `R/03_ttests_one_two_sample.R` – one-sample and independent two-sample t-tests (DBP vs 80 mmHg; age vs diabetes; SBP vs peptic ulcer).
- `R/04_ttest_paired.R` – paired t-test on `pre_test`/`post_test` with differences and diagnostics.
- `R/05_anova.R` – one-way ANOVA example with `income ~ religion_2`.
- `report/summary_conclusions.md` – narrative explanation of findings and interpretation in plain language.

## How to use

1. Clone the repository:

```bash
git clone https://github.com/LyonKizito-code/parametric-tests-health-data-r.git
cd parametric-tests-health-data-r
```

2. Open the project in RStudio or VS Code with R support.

3. Ensure you have a `Health_Data` data frame in your R environment with the variables listed above.

4. Source the scripts in order (from `R/01_descriptives.R` to `R/05_anova.R`) or run them interactively.

## Requirements

Base R is sufficient for most of the analysis. For a convenient mode function, this repo demonstrates both a **custom mode function** and the `DescTools::Mode()` function, but you can comment out whichever you prefer.

## Author

Created by **Lyon Kizito** as part of MSc Data Science learning on parametric tests and R programming.
