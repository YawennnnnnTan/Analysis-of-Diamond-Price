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

#Scale and exponent the response variable
train_data$price <- scale(train_data$price, center = TRUE, scale = TRUE)
train_data$price<-exp(train_data$price)

# Covert categorical variables into factors
# Redefine the factor level order so that the first value automatically becomes the reference level
train_data$color <- factor(train_data$color, levels = c('K','J','I','H','G','F','E','D'))
train_data$clarity <- factor(train_data$clarity, levels = c('SI2','SI1','VS2','VS1','VVS2','VVS1','IF'))
train_data$cut <- factor(train_data$cut, levels = c('Good','Very Good','Excellent','Ideal'))


#### Fit Models ####
# GLM
model_glm <- glm(price ~ carat_size + color + cut+ clarity,
                 family = Gamma(link = "log"),
                 data = train_data)


# Linear regression
model_lm <- lm(price ~ carat_size + color + cut + clarity, data = train_data)


# Bayes regression
model_bayes <-
  stan_glm(
    formula = price ~ carat_size + color + cut + clarity,
    data = train_data,
    family = Gamma(link = "log"),
    prior = normal(location = 0, scale = 10, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 10, autoscale = TRUE),
    prior_aux = exponential(rate = 3, autoscale = TRUE),
  )

#### Save Model ####
saveRDS(model_glm, "models/glm.rds")
saveRDS(model_lm, "models/lm.rds")
saveRDS(model_bayes, "models/bayes.rds")

