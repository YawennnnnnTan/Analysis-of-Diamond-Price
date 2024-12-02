#### Preamble ####
# Purpose: Tests the structure and validity of the cleaned data
# Author: Yawen Tan
# Date: 30 November 2024
# Contact: yawen.tan@utoronto.ca
# License: MIT
# Pre-requisites: 
# - The `tidyverse` package must be installed and loaded
# - 03-clean_data.R must have been run

#### Workspace setup ####
library(tidyverse)

cleaned_data <- read_parquet(here("data/02-analysis_data/cleaned_diamondprice.parquet"))


# Test if the data was successfully loaded
if (exists("cleaned_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 2690 rows
if (nrow(cleaned_data) == 2690) {
  message("Test Passed: The dataset has 2690 rows.")
} else {
  stop("Test Failed: The dataset does not have 2690 rows.")
}

# Check if the dataset has 5 columns
if (ncol(cleaned_data) == 5) {
  message("Test Passed: The dataset has 5 columns.")
} else {
  stop("Test Failed: The dataset does not have 5 columns.")
}


# Check if the 'color' column contains only valid diamond color names
valid_color <- c('D','E','F','G','H','I','J','K')

if (all(cleaned_data$color %in% valid_color)) {
  message("Test Passed: The 'color' column contains only valid diamond color names.")
} else {
  stop("Test Failed: The 'color' column contains invalid color names.")
}


# Check if 'clarity' column contains only valid diamond clarity names
valid_color <- c('IF','VVS1','VVS2','VS1','VS2','SI1','SI2')

if (all(cleaned_data$clarity %in% valid_color)) {
  message("Test Passed: The 'clarity' column contains only valid diamond clarity names.")
} else {
  stop("Test Failed: The 'clarity' column contains invalid clarity names.")
}


# Check if 'cut' column contains only valid diamond cut names
valid_cut <- c('Ideal','Good','Very Good','Excellent')

if (all(cleaned_data$cut %in% valid_cut)) {
  message("Test Passed: The 'cut' column contains only valid diamond cut names.")
} else {
  stop("Test Failed: The 'color' column contains invalid cut names.")
}


# Check if the 'price' column contains non-negative value
if (all(cleaned_data$price >=0)) {
  message("Test Passed: The 'price' column contains non-negative value")
} else {
  stop("Test Failed: The 'price' column contains negative value")
}



# Check if there are any missing values in the dataset
if (all(!is.na(cleaned_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}
