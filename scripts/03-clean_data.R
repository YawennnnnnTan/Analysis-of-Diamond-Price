#### Preamble ####
# Purpose: Cleans the raw data
# Author: Yawen Tan
# Date: 01 December 2024
# Contact: yawen,tan@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - The `readr`,`arrow`,`caTools`,`dplyr` package must be installed and loaded
# - 02-download_data.R must have been run

#### Workspace setup ####
library(readr)
library(arrow)
library(caTools)
library(dplyr)

#### Clean data ####
# Step 1: Read the raw data and clean the column name
raw_data <- read_delim("data/01-raw_data/diamondprice.txt", delim = "\t")
cleaned_data <-
  raw_data |>
  janitor::clean_names()
# Step 2: Remove NA value
if (any(is.na(cleaned_data))) {
  cleaned_data <- cleaned_data[complete.cases(cleaned_data), ]
}
# Step 3: Convert categorical variables to factors
train_data$color <- factor(train_data$color)
train_data$cut <- factor(train_data$cut)
train_data$clarity <- factor(train_data$clarity)

# Step 3: Save cleaned data as parquet file
write_parquet(cleaned_data, "data/02-analysis_data/cleaned_diamondprice.parquet")



#### Data Split ####

# Step 1: Split into train (70%) and test (30%) datasets
set.seed(141)  # For reproducibility
split <- sample.split(cleaned_data$price, SplitRatio = 0.7)
train_data <- cleaned_data %>%
  filter(split == TRUE)
test_data <- cleaned_data %>%
  filter(split == FALSE)


# Step 2: Save train and test datasets as parquet files
write_parquet(train_data, "data/02-analysis_data/diamondprice_train_data.parquet")
write_parquet(test_data, "data/02-analysis_data/diamondprice_test_data.parquet")


