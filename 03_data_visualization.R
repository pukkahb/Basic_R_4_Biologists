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
hist_sepal_length <- ggplot(iris_data, aes(x = Sepal.Length)) +
  geom_histogram(binwidth = 0.5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Sepal Length",
       x = "Sepal Length (cm)",
       y = "Frequency") +
  theme_minimal() # A clean theme for plots
print(hist_sepal_length)
# To save the plot: ggsave("sepal_length_histogram.png", hist_sepal_length)

# --- Section 3: Scatter Plots ---
# Scatter plots are used to visualize the relationship between two numeric variables.
# Let's plot Petal.Length vs Petal.Width, colored by Species.
scatter_petal <- ggplot(iris_data, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(alpha = 0.7) + # Add points with some transparency
  labs(title = "Petal Length vs. Petal Width by Species",
       x = "Petal Length (cm)",
       y = "Petal Width (cm)",
       color = "Species") +
  theme_minimal()
print(scatter_petal)
# To save the plot: ggsave("petal_scatter_plot.png", scatter_petal)

# --- Section 4: Box Plots ---
# Box plots are useful for comparing the distribution of a numeric variable across different categories.
# Let's compare Sepal.Length across different Species.
boxplot_sepal_length <- ggplot(iris_data, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Sepal Length Distribution by Species",
       x = "Species",
       y = "Sepal Length (cm)") +
  theme_minimal()
print(boxplot_sepal_length)
# To save the plot: ggsave("sepal_length_boxplot.png", boxplot_sepal_length)

# --- Section 5: Density Plots ---
# Density plots are another way to visualize the distribution of a numeric variable,
# often smoother than histograms and good for comparing distributions.
density_petal_length <- ggplot(iris_data, aes(x = Petal.Length, fill = Species)) +
  geom_density(alpha = 0.6) + # Add density plots with transparency
  labs(title = "Density of Petal Length by Species",
       x = "Petal Length (cm)",
       y = "Density") +
  theme_minimal()
print(density_petal_length)
# To save the plot: ggsave("petal_length_density.png", petal_length_density)
