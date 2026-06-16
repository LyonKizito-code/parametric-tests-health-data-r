# 02_normality.R
# Normality assessment for SBP (and similar variables)

# Histogram and Q-Q plot for SBP -----------------------------------------

hist(Health_Data$sbp,
     breaks = 20,
     main   = "Histogram of SBP",
     xlab   = "Systolic BP")

qqnorm(Health_Data$sbp,
       main = "Q-Q Plot of SBP")
qqline(Health_Data$sbp, col = "red", lwd = 2)

# Shapiro-Wilk test -------------------------------------------------------

shapiro_sbp <- shapiro.test(Health_Data$sbp)
print(shapiro_sbp)

# Interpretation (to be elaborated in report):
# - Null hypothesis: data are normally distributed.
# - If p-value <= 0.05, we reject normality; if > 0.05, data are consistent with normality.
