# R Tutorial for Biology Beginners: Getting Started with Data Analysis

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![R 4.0+](https://img.shields.io/badge/R-4.0%2B-blue.svg)](https://cran.r-project.org/)

Welcome to this beginner-friendly R tutorial! This guide is specifically designed for biology students and researchers who are new to R and want to get started with basic data analysis, visualization, and manipulation.

R is a powerful open-source programming language and environment for statistical computing and graphics. It's widely used in biology for everything from analyzing gene expression data to modeling ecological systems.

## 🎯 What You Will Learn

* How to set up your R environment.

* Loading and understanding a common biological dataset (Iris dataset).

* Performing basic data exploration (summaries, structure).

* Simple data manipulation (filtering, selecting columns).

* Creating basic visualizations using `ggplot2`.

* Conducting a very simple statistical test.

## 📦 Prerequisites

Before you begin, make sure you have the following installed:

1.  **R:** The base R environment. You can download it from [CRAN (The Comprehensive R Archive Network)](https://cran.r-project.org/).

2.  **RStudio Desktop:** An integrated development environment (IDE) that makes working with R much easier. Download it from [RStudio's website](https://posit.co/download/rstudio-desktop/).

## 🚀 Getting Started

Clone this repository to your local machine:

```bash
git clone [https://github.com/your-username/your-repo-name.git](https://github.com/your-username/your-repo-name.git)
cd your-repo-name
```

Open the .R script files in RStudio to follow along.

# Step 1: Loading and Exploring the Data
We'll start by loading the built-in iris dataset, which contains measurements of sepal length, sepal width, petal length, and petal width for 150 iris flowers of three different species (setosa, versicolor, and virginica).

Open 01_data_loading_exploration.R and run the commands.

# 01_data_loading_exploration.R

# --- Section 1: Load the Dataset ---
# The 'iris' dataset is built into R, so we don't need to load it from an external file.
# We can simply assign it to a variable for easier use.
# It's a classic dataset for demonstrating basic data analysis.
# It contains measurements in centimeters for the sepal length and width and petal length and width,
# for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica.
iris_data <- iris

# --- Section 2: Basic Data Exploration ---

# View the first few rows of the dataset
# This helps to quickly understand the structure and content of the data.
print("--- Head of the dataset ---")
head(iris_data)

# Get a summary of each column
# This provides statistical summaries like min, max, mean, median, and quartiles for numeric columns,
# and counts for categorical columns.
print("\n--- Summary of the dataset ---")
summary(iris_data)

# Check the structure of the dataset
# 'str()' shows the data types of each column (e.g., numeric, factor) and the number of observations.
print("\n--- Structure of the dataset ---")
str(iris_data)

# Get the dimensions of the dataset (number of rows and columns)
print("\n--- Dimensions of the dataset (rows, columns) ---")
dim(iris_data)

# Get the names of the columns
print("\n--- Column names ---")
names(iris_data)

# Get the number of unique species
print("\n--- Unique species in the dataset ---")
unique(iris_data$Species)

# Get the count of each species
print("\n--- Count of each species ---")
table(iris_data$Species)

# Step 2: Basic Data Manipulation
Once you have your data loaded, you'll often need to manipulate it. This includes selecting specific columns, filtering rows based on certain conditions, or creating new variables.

Open 02_data_manipulation.R and run the commands.

# 02_data_manipulation.R

# Ensure the iris_data is loaded (if running this script independently)
if (!exists("iris_data")) {
  iris_data <- iris
}

# --- Section 1: Selecting Columns ---
# You can select specific columns using their names.
# This creates a new data frame with only 'Sepal.Length' and 'Species'.
sepal_species_data <- iris_data[, c("Sepal.Length", "Species")]
print("--- Selected 'Sepal.Length' and 'Species' columns ---")
head(sepal_species_data)

# --- Section 2: Filtering Rows ---
# You can filter rows based on conditions.
# Here, we filter for only 'setosa' species.
setosa_only <- iris_data[iris_data$Species == "setosa", ]
print("\n--- Filtered for 'setosa' species only ---")
head(setosa_only)

# Filter for flowers with Sepal.Length greater than 7.0 cm
long_sepal_flowers <- iris_data[iris_data$Sepal.Length > 7.0, ]
print("\n--- Filtered for Sepal.Length > 7.0 cm ---")
head(long_sepal_flowers)

# Combining conditions: Filter for 'versicolor' species with Petal.Width less than 1.4 cm
versicolor_narrow_petal <- iris_data[iris_data$Species == "versicolor" & iris_data$Petal.Width < 1.4, ]
print("\n--- Filtered for 'versicolor' with Petal.Width < 1.4 cm ---")
head(versicolor_narrow_petal)

# --- Section 3: Creating a New Column ---
# You can create new columns based on existing ones.
# Let's create a new column 'Sepal.Area' by multiplying Sepal.Length and Sepal.Width.
iris_data$Sepal.Area <- iris_data$Sepal.Length * iris_data$Sepal.Width
print("\n--- Dataset with new 'Sepal.Area' column ---")
head(iris_data)

# You can also categorize data into new columns.
# Let's categorize 'Petal.Length' into 'Short', 'Medium', 'Long'.
iris_data$Petal.Length.Category <- cut(iris_data$Petal.Length,
                                       breaks = c(0, 2, 4, Inf),
                                       labels = c("Short", "Medium", "Long"),
                                       right = FALSE) # right = FALSE means [0, 2), [2, 4), [4, Inf)
print("\n--- Dataset with new 'Petal.Length.Category' column ---")
head(iris_data)
print(table(iris_data$Petal.Length.Category))

# Step 3: Data Visualization
Visualizing your data is crucial for understanding patterns, distributions, and relationships. We'll use the ggplot2 package, which is a very popular and powerful tool for creating high-quality graphics in R.

First, you need to install ggplot2 if you haven't already:

```R

install.packages("ggplot2")
```

Open 03_data_visualization.R and run the commands.

# 03_data_visualization.R

# --- Section 1: Install and Load ggplot2 ---
# Install ggplot2 if you haven't already. Only run this line once.
# install.packages("ggplot2")

# Load the ggplot2 library. You need to do this every time you start a new R session
# and want to use ggplot2 functions.
library(ggplot2)

# Ensure the iris_data is loaded
if (!exists("iris_data")) {
  iris_data <- iris
}

# --- Section 2: Basic Histograms ---
# Histograms are great for visualizing the distribution of a single numeric variable.
# We'll plot the distribution of Sepal.Length.
```R
hist_sepal_length <- ggplot(iris_data, aes(x = Sepal.Length)) +
  geom_histogram(binwidth = 0.5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Sepal Length",
       x = "Sepal Length (cm)",
       y = "Frequency") +
  theme_minimal() # A clean theme for plots
print(hist_sepal_length)
```
# To save the plot: ggsave("sepal_length_histogram.png", hist_sepal_length)

# --- Section 3: Scatter Plots ---
# Scatter plots are used to visualize the relationship between two numeric variables.
# Let's plot Petal.Length vs Petal.Width, colored by Species.
```R
scatter_petal <- ggplot(iris_data, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(alpha = 0.7) + # Add points with some transparency
  labs(title = "Petal Length vs. Petal Width by Species",
       x = "Petal Length (cm)",
       y = "Petal Width (cm)",
       color = "Species") +
  theme_minimal()
print(scatter_petal)
```
# To save the plot: ggsave("petal_scatter_plot.png", scatter_petal)

# --- Section 4: Box Plots ---
# Box plots are useful for comparing the distribution of a numeric variable across different categories.
# Let's compare Sepal.Length across different Species.
```R
boxplot_sepal_length <- ggplot(iris_data, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Sepal Length Distribution by Species",
       x = "Species",
       y = "Sepal Length (cm)") +
  theme_minimal()
print(boxplot_sepal_length)
```
# To save the plot: ggsave("sepal_length_boxplot.png", boxplot_sepal_length)

# --- Section 5: Density Plots ---
# Density plots are another way to visualize the distribution of a numeric variable,
# often smoother than histograms and good for comparing distributions.
```R
density_petal_length <- ggplot(iris_data, aes(x = Petal.Length, fill = Species)) +
  geom_density(alpha = 0.6) + # Add density plots with transparency
  labs(title = "Density of Petal Length by Species",
       x = "Petal Length (cm)",
       y = "Density") +
  theme_minimal()
print(density_petal_length)
```
# To save the plot: ggsave("petal_length_density.png", petal_length_density)

# Step 4: Simple Statistical Analysis
R is primarily a statistical language. Let's perform a very basic statistical test to compare the means of two groups. We'll use a t-test to see if there's a significant difference in Sepal.Length between 'setosa' and 'versicolor' species.

Open 04_simple_analysis.R and run the commands.

# 04_simple_analysis.R

# Ensure the iris_data is loaded
```R
if (!exists("iris_data")) {
  iris_data <- iris
}
```

# --- Section 1: Prepare Data for T-test ---
# We need to filter the data to include only 'setosa' and 'versicolor' species for comparison.
```R
setosa_versicolor_data <- iris_data[iris_data$Species == "setosa" | iris_data$Species == "versicolor", ]
```

# Ensure the 'Species' column is a factor and drop unused levels
```R
setosa_versicolor_data$Species <- factor(setosa_versicolor_data$Species)
```

# --- Section 2: Perform an Independent Samples T-test ---
# We want to test if the mean Sepal.Length is significantly different
# between Iris setosa and Iris versicolor.
# The formula is 'response_variable ~ grouping_variable'.
# 'var.equal = TRUE' assumes equal variances (check this assumption with an F-test or visualize distributions).
# For simplicity, we'll assume unequal variances (default for t.test).
t_test_result <- t.test(Sepal.Length ~ Species, data = setosa_versicolor_data)

# Print the results of the t-test
```R
print("--- Independent Samples T-test Results (Sepal.Length between Setosa and Versicolor) ---")
print(t_test_result)
```

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
```R
if (t_test_result$p.value < 0.05) {
  print("\nConclusion: The p-value is less than 0.05, suggesting a statistically significant difference in Sepal Length between Iris setosa and Iris versicolor.")
} else {
  print("\nConclusion: The p-value is not less than 0.05, suggesting no statistically significant difference in Sepal Length between Iris setosa and Iris versicolor at the 0.05 level.")
}

print(paste("Mean Sepal Length for setosa:", round(t_test_result$estimate[1], 2), "cm"))
print(paste("Mean Sepal Length for versicolor:", round(t_test_result$estimate[2], 2), "cm"))
```

# ➡️ Next Steps
Congratulations! You've completed a basic R tutorial for biologists. Here are some ideas for what to explore next:

Explore more ggplot2 features: Learn about different plot types (bar plots, violin plots), customizing colors, themes, and combining plots.

Learn about data wrangling with dplyr: A powerful package for data manipulation (filtering, selecting, arranging, summarizing, joining data).

Dive into more statistical tests: Explore ANOVA, regression, correlation, etc.

Work with your own data: Try importing your own biological datasets (e.g., .csv, .tsv files) into R and applying what you've learned.

Learn about functions: How to write your own reusable code blocks.

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
