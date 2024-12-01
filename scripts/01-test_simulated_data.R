#### Preamble ####
# Purpose: Tests the structure and validity of the simulated data
# Author: Yawen Tan
# Date: 30 November 2024
# Contact: yawen.tan@utoronto.ca
# License: MIT
# Pre-requisites: 
# - The `tidyverse` package must be installed and loaded
# - 00-simulate_data.R must have been run

#### Workspace setup ####
library(tidyverse)


simulated_data <- read_csv("data/00-simulated_data/simulated_diamondprice.csv")

# Test if the data was successfully loaded
if (exists("simulated_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 141 rows
if (nrow(simulated_data) == 141) {
  message("Test Passed: The dataset has 141 rows.")
} else {
  stop("Test Failed: The dataset does not have 141 rows.")
}

# Check if the dataset has 5 columns
if (ncol(simulated_data) == 5) {
  message("Test Passed: The dataset has 5 columns.")
} else {
  stop("Test Failed: The dataset does not have 5 columns.")
}


# Check if the 'color' column contains only valid diamond color names
valid_color <- c('D','E','F','G','H','I','J','K')

if (all(simulated_data$color %in% valid_color)) {
  message("Test Passed: The 'color' column contains only valid diamond color names.")
} else {
  stop("Test Failed: The 'color' column contains invalid color names.")
}


# Check if column contains only valid diamond clarity names
valid_color <- c('IF','VVS1','VVS2','VS1','VS2','SI1','SI2')

if (all(simulated_data$clarity %in% valid_color)) {
  message("Test Passed: The 'clarity' column contains only valid diamond clarity names.")
} else {
  stop("Test Failed: The 'clarity' column contains invalid clarity names.")
}


# Check if column contains only valid diamond cut names
valid_cut <- c('Ideal','Good','Very Good','Excellent')

if (all(simulated_data$cut %in% valid_cut)) {
  message("Test Passed: The 'cut' column contains only valid diamond cut names.")
} else {
  stop("Test Failed: The 'color' column contains invalid cut names.")
}


# Check if there are any missing values in the dataset
if (all(!is.na(simulated_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}
