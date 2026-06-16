# 05_anova.R
# One-way ANOVA: income by religion_2

# One-way ANOVA model -----------------------------------------------------

res_aov <- aov(income ~ religion_2, data = Health_Data)
summary(res_aov)

# Basic diagnostic plots --------------------------------------------------

par(mfrow = c(2, 2))
plot(res_aov)
par(mfrow = c(1, 1))

# The summary() output includes the F-statistic and p-value
# for testing H0: all group means are equal.
