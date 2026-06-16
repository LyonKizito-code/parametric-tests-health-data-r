# 01_descriptives.R
# Descriptive statistics for sbp, dbp, income

# Assume Health_Data is already loaded in the workspace

# Custom mode function (base R only)
get_mode <- function(x) {
  x_no_na <- x[!is.na(x)]
  ux <- unique(x_no_na)
  ux[which.max(tabulate(match(x_no_na, ux)))]
}

# Means and medians -------------------------------------------------------

mean_sbp    <- mean(Health_Data$sbp, na.rm = TRUE)
median_sbp  <- median(Health_Data$sbp, na.rm = TRUE)
mode_sbp    <- get_mode(Health_Data$sbp)

mean_dbp    <- mean(Health_Data$dbp, na.rm = TRUE)
median_dbp  <- median(Health_Data$dbp, na.rm = TRUE)
mode_dbp    <- get_mode(Health_Data$dbp)

mean_income   <- mean(Health_Data$income, na.rm = TRUE)
median_income <- median(Health_Data$income, na.rm = TRUE)

# Use DescTools::Mode if available (optional)
# install.packages("DescTools")
# library(DescTools)
# mode_sbp_desc   <- Mode(Health_Data$sbp)
# mode_dbp_desc   <- Mode(Health_Data$dbp)
# mode_income_desc<- Mode(Health_Data$income)

# Print nicely ------------------------------------------------------------

cat("SBP: mean =", mean_sbp, " median =", median_sbp, " mode =", mode_sbp, "\n")
cat("DBP: mean =", mean_dbp, " median =", median_dbp, " mode =", mode_dbp, "\n")
cat("Income: mean =", mean_income, " median =", median_income, "\n")

# Five-number summary and boxplot for income ------------------------------

cat("Five-number summary for income (Min, Q1, Median, Q3, Max):\n")
print(fivenum(Health_Data$income))

boxplot(Health_Data$income,
        main = "Box Plot of Income",
        ylab = "Income")
