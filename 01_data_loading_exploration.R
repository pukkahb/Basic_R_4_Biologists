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
