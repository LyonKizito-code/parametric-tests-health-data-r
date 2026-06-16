# 04_ttest_paired.R
# Paired t-test on pre_test and post_test scores

# Differences -------------------------------------------------------------

diff_scores <- Health_Data$pre_test - Health_Data$post_test

summary(diff_scores)
boxplot(diff_scores,
        main = "Differences (pre - post)",
        ylab = "Score difference")

# Normality of differences
shapiro_diff <- shapiro.test(diff_scores)
print(shapiro_diff)

qqnorm(diff_scores,
       main = "Q-Q Plot of differences (pre - post)")
qqline(diff_scores, col = "red", lwd = 2)

# Paired t-test -----------------------------------------------------------

res_paired <- t.test(Health_Data$pre_test, Health_Data$post_test,
                     paired = TRUE,
                     alternative = "two.sided")
print(res_paired)
