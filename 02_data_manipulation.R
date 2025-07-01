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
