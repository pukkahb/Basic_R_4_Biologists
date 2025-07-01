# 04_simple_analysis.R

# Ensure the iris_data is loaded
if (!exists("iris_data")) {
  iris_data <- iris
}

# --- Section 1: Prepare Data for T-test ---
# We need to filter the data to include only 'setosa' and 'versicolor' species for comparison.
setosa_versicolor_data <- iris_data[iris_data$Species == "setosa" | iris_data$Species == "versicolor", ]

# Ensure the 'Species' column is a factor and drop unused levels
setosa_versicolor_data$Species <- factor(setosa_versicolor_data$Species)

# --- Section 2: Perform an Independent Samples T-test ---
# We want to test if the mean Sepal.Length is significantly different
# between Iris setosa and Iris versicolor.
# The formula is 'response_variable ~ grouping_variable'.
# 'var.equal = TRUE' assumes equal variances (check this assumption with an F-test or visualize distributions).
# For simplicity, we'll assume unequal variances (default for t.test).
t_test_result <- t.test(Sepal.Length ~ Species, data = setosa_versicolor_data)

# Print the results of the t-test
print("--- Independent Samples T-test Results (Sepal.Length between Setosa and Versicolor) ---")
print(t_test_result)

# --- Section 3: Interpret the Results ---
# The output provides:
# - 'data': The data used for the test.
# - 't': The calculated t-statistic.
# - 'df': Degrees of freedom.
# - 'p-value': The probability of observing such a difference (or more extreme) if the null hypothesis (no difference) were true.
# - 'alternative hypothesis': What the test is looking for (e.g., true difference in means is not equal to 0).
# - '95 percent confidence interval': A range within which the true difference in means is likely to fall.
# - 'sample estimates': The mean of Sepal.Length for each group.

# Common interpretation:
# If p-value < 0.05 (a common significance level), we typically reject the null hypothesis,
# suggesting a statistically significant difference between the group means.
if (t_test_result$p.value < 0.05) {
  print("\nConclusion: The p-value is less than 0.05, suggesting a statistically significant difference in Sepal Length between Iris setosa and Iris versicolor.")
} else {
  print("\nConclusion: The p-value is not less than 0.05, suggesting no statistically significant difference in Sepal Length between Iris setosa and Iris versicolor at the 0.05 level.")
}

print(paste("Mean Sepal Length for setosa:", round(t_test_result$estimate[1], 2), "cm"))
print(paste("Mean Sepal Length for versicolor:", round(t_test_result$estimate[2], 2), "cm"))
