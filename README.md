# Analysis-of-Diamond-Price
"What are the key factors that affect the price of diamonds? How to accurately predict the price by the characteristics of diamonds (carat weight, color, clarity and cut)? "
Outline:
## Intro: 
### Background:
This paper introduces the diamond market and its main influencing factors (carat weight, color, clarity, cut, etc.).
This paper expounds the practicability and research significance of multivariate regression model.
### Research questions:
What variables have a significant impact on diamond prices?
How to build a reliable regression model to predict the price?
### Research objectives:
The key factors affecting the price are analyzed by multivariate linear regression model.
Evaluate the prediction performance and generalization ability of the model on the test set.


## Data
### Data Tool: R packages that we use

### Data Preparation
#### Data cleaning
Check the missing values, duplicate values and abnormal values in the data set and deal with them.
Check whether the classification variables need to be re-coded (such as color, clarity, cutting code).
Standardize numerical variables (such as carat weight and price) to eliminate scale influence.
#### Data Split: 80:20

### Exploratory data analysis(EDA)
#### Univariate analysis:
Use histogram and box chart to understand the distribution and abnormal values of variables.
#### Bivariate analysis:
Visualize the relationship between independent variables and price & the correlation between variables;
Visualize the relationship between independent variables and price: scatter plot, add regression line; Box graph or histogram.
Correlation between variables: calculate the correlation matrix between variables and identify potential multicollinearity.
#### Data balance check:
Check whether the classification variables (such as color, clarity and cut) are evenly distributed and whether there is category imbalance.
#### Exploration of feature selection:
Through the preliminary univariate regression, this paper analyzes which variables may most significantly affect the price.

## Measurement???

## Model
### Assumptions of linear regression: 4 assumptions
### Model Construction
#### Linear regression model
1. Final initial model, check and explain summary(lm_model) r-square(adjusted r-square)
2. If the p value of some variables is large (such as > 0.05), consider eliminating them and fitting the model again. Use Stepwise Regression to automatically select variables.
#### Lasso model
If the variables are multicollinearity, consider lasso and ridge
#### Ridge model
#### Extended model of linear regression
If it is found that the goodness of fit of the initial linear model is not high
1. Add nonlinear term
2. Introducing interactive items
### Model Comparison: after comparing, we can get the final mode
advantage ang disdavantage of each model ang why we choose final model

### Model Evaluation(final model): 
#### Diagonsis
Residuals vs. Fitted Plot: Check the hypothesis that the mean of residuals is zero.
Normal Q-Q Plot: Check whether the residual conforms to the normal distribution.
Scale-Location Plot: Check whether the variance of the residual is uniform (homovariance).
Residuals vs. Leverage Plot: Check abnormal values and high leverage points.
#### Model performance evaluation
1. R-square and adjusted R-square in train data
2. mean square error (MSE), root mean square error (RMSE) and mean absolute error (MAE)in test data.
3. Visualize the prediction results of the model on the test set

## Result
1. State what are key variables
2. Visualize the model
3. Explain how does each variable affect response(coefficient) (model summary)

。


## Discussion
Deeper explanation based on the result
Limitation
Further Consideration

## Surveys, sampling, and observational data appendix???
Please include an appendix where you focus on some aspect of surveys, sampling or observational data, related to your paper. This should be an in-depth exploration, akin to the "idealized methodology/survey/pollster methodology" sections of Paper 2. Some aspect of this is likely covered in the Measurement sub-section of your Data section, but this would be much more detailed, and might include aspects like simulation and linkages to the literature, among other aspects.

