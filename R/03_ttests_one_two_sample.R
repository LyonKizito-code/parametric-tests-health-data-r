# 03_ttests_one_two_sample.R
# One-sample and two-sample t-tests

# One-sample t-test: DBP vs 80 mmHg --------------------------------------

res_one_sample <- t.test(Health_Data$dbp, mu = 80)
print(res_one_sample)

# Independent two-sample t-test: age by diabetes status -------------------

# Quick summaries
print(tapply(Health_Data$age, Health_Data$diabetes, summary))

# Boxplot
boxplot(age ~ diabetes, data = Health_Data,
        main = "Age by diabetes status",
        xlab = "Diabetes",
        ylab = "Age")

# Normality in each group
by(Health_Data$age, Health_Data$diabetes, shapiro.test)

# Equal variances (F-test)
print(var.test(age ~ diabetes, data = Health_Data))

# Two-sample t-test (equal variances, as in notes)
res_two_sample_age <- t.test(age ~ diabetes, data = Health_Data,
                             var.equal   = TRUE,
                             alternative = "two.sided")
print(res_two_sample_age)

# SBP by peptic ulcer status ---------------------------------------------

print(tapply(Health_Data$sbp, Health_Data$pepticulcer, summary))

boxplot(sbp ~ pepticulcer, data = Health_Data,
        main = "SBP by peptic ulcer status",
        xlab = "Peptic ulcer (1/2)",
        ylab = "Systolic BP")

# Normality and equal variances
by(Health_Data$sbp, Health_Data$pepticulcer, shapiro.test)
print(var.test(sbp ~ pepticulcer, data = Health_Data))

# Welch t-test for difference in mean SBP
res_ulcer <- t.test(sbp ~ pepticulcer,
                    data      = Health_Data,
                    var.equal = FALSE,
                    alternative = "two.sided")
print(res_ulcer)
