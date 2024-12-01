#### Preamble ####
# Purpose: Building Multivariable model
# Author: Yawen Tan
# Date: 30 November 2024
# Contact: yawen.tan@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(arrow)
library(stats)

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
library(rstanarm)
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
summary(model_bayes)


#### Save Model ####
saveRDS(model_glm, "models/glm.rds")
saveRDS(model_lm, "models/lm.rds")


#### Test Model ####
#Prepare test data
test_data$price <- scale(test_data$price, center = TRUE, scale = TRUE)
test_data$price<-exp(test_data$price)
test_data$color <- factor(test_data$color)
test_data$cut <- factor(test_data$cut)
test_data$clarity <- factor(test_data$clarity)

# Find predictions based on 2 models
predictions_glm <- predict(model_glm, newdata = test_data, type = "response")
predictions_lm <- predict(model_lm, newdata = test_data)
predictions_bayes <- predict(model_bayes, newdata = test_data)
# Calculate MSE
mse_glm <- mean((test_data$price - predictions_glm)^2)
mse_lm <- mean((test_data$price - predictions_lm)^2)
mse_bayes <- mean((test_data$price - predictions_bayes)^2)

mse_glm
mse_lm
mse_bayes

#Put in Result section
library(ggplot2)

test_data$predicted_price <- predict(model_glm, newdata = test_data, type = "response")


ggplot(data = test_data, aes(x = 1:nrow(test_data))) +
  geom_line(aes(y = predicted_price), color = "red", size = 1, linetype = "solid") + 
  geom_point(aes(y = price), color = "green", size = 2) + 
  labs(
    title = "Actual vs Predicted Values",
    x = "Index",
    y = "Price"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) 




