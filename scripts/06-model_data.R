#### Preamble ####
# Purpose: Building Multivariable model: Generalize Linear model, Linear model, Bayes Regression Model
# Author: Yawen Tan
# Date: 01 December 2024
# Contact: yawen.tan@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - The `arrow`,`stats`,`rstanarm` package must be installed and loaded
# - 03-clean_data.R must have been run


#### Workspace setup ####
library(arrow)
library(stats)
library(rstanarm)

#### Data Preparation ####
train_data <- read_parquet("data/02-analysis_data/diamondprice_train_data.parquet")
test_data <- read_parquet("data/02-analysis_data/diamondprice_test_data.parquet")

train_data$price <- scale(train_data$price, center = TRUE, scale = TRUE)
train_data$price<-exp(train_data$price)
train_data$color <- factor(train_data$color)
train_data$cut <- factor(train_data$cut)
train_data$clarity <- factor(train_data$clarity)



#### Fit Models ####
# GLM
model_glm <- glm(price ~ carat_size + color + cut+ clarity,
                 family = Gamma(link = "log"),
                 data = train_data)
summary(model_glm)

# Linear regression
model_lm <- lm(price ~ carat_size + color + cut + clarity, data = train_data)


# Bayes regression
model_bayes <-
  stan_glm(
    formula = price ~ carat_size + color + cut + clarity,
    data = train_data,
    family = Gamma(link = "log"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 141
  )


#### Save Model ####
saveRDS(model_glm, "models/glm.rds")
saveRDS(model_lm, "models/lm.rds")
saveRDS(model_lm, "models/bayes.rds")

