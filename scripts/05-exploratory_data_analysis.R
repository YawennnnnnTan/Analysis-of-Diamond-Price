#### Preamble ####
# Purpose: Explore the Cleaned Data
# Author: Yawen Tan
# Date: 2 December 2024
# Contact: yawen.tan@utoronto.ca
# License: MIT
# Pre-requisites: 
# - The `tidyverse`,`arrow`,`dplyr` package must be installed and loaded
# - 03-clean_data.R must have been run


#### Workspace setup ####
library(tidyverse)
library(arrow)
library(dplyr)

#### Read data ####
cleaned_data <- read_parquet(here("data/02-analysis_data/cleaned_diamondprice.parquet"))


#### Explore data ####

#Find the category each variables

variable_types <- sapply(cleaned_data, class)
variable_types


#Find the range of each variables

# Categories Variable: color, cut, and clarity
color_categories <- unique(cleaned_data$color)
cut_categories <- unique(cleaned_data$cut)
clarity_categories <- unique(cleaned_data$clarity)
# Continuous Variablle: carat_size, price
carat_min <- min(cleaned_data$carat_size, na.rm = TRUE)
carat_max <- max(cleaned_data$carat_size, na.rm = TRUE)
price_min <- min(cleaned_data$price, na.rm = TRUE)
price_max <- max(cleaned_data$price, na.rm = TRUE)
# Display the results
list(
  Color_Categories = color_categories,
  Cut_Categories = cut_categories,
  Clarity_Categories = clarity_categories,
  Carat_Size_Min = carat_min,
  Carat_Size_Max = carat_max,
  Pirce_Min = price_min,
  Price_Max = price_max
)



