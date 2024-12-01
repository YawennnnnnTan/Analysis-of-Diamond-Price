#### Preamble ####
# Purpose: Simulates a dataset
# Author: Yawen Tan
# Date: 30 November 2024
# Contact: yawen.tan@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(readr)
library(arrow)
set.seed(141)


#### Simulate data ####

# Dataset size
n <- 141

# Generate simulated data
simulated_data <- data.frame(
  price = sample(1000:10000, n, replace = TRUE), # Price range: 1000-10000 as integers
  color = sample(c('D', 'E', 'F', 'G', 'H', 'I', 'J', 'K'), n, replace = TRUE), # Color categories
  cut = sample(c('Ideal', 'Good', 'Very Good', 'Excellent'), n, replace = TRUE), # Cut categories
  clarity = sample(c('IF', 'VVS1', 'VVS2', 'VS1', 'VS2', 'SI1', 'SI2'), n, replace = TRUE), # Clarity categories
  carat_size = runif(n, min = 0.2, max = 5.0) # Carat size range: 0.2-5.0
)


#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_diamondprice.csv")
write_parquet(simulated_data, "data/00-simulated_data/simulated_diamondprice.parquet")


