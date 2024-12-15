# Analysis of Diamond Price
This paper investigates how the Four Cs—carat weight, color, clarity, and cut—affect diamond pricing and develops a predictive model using a Generalized Linear Model (GLM) with a Gamma distribution. The analysis shows that carat weight has the strongest positive influence on price, followed by clarity and color, while cut has a relatively smaller impact. The model demonstrates robust performance, providing a reliable framework for forecasting diamond prices and understanding market patterns. These findings enhance pricing transparency, help the diamond industry adapt to shifting consumer preferences, and offer valuable insights into the economic and cultural factors shaping diamond valuation.


# File Structure
-   data/raw_data: Contains raw datasets sourced from DASL.
-   data/analysis_data: Includes the cleaned data, train data and test data.
-   models: Stores fitted generalized linear model, linear regression model and bayesian regression model.
-   other: Contains supplementary materials such as LLM (Large Language Model) interaction logs, and project sketches and datasheet.
-   paper: Houses the research paper files, including the Quarto document, references bibliography, and the final PDF.
-   scripts: Contains R scripts for data simulation, data download, data cleaning, data testing, data analysis and modeling.

# How to run
-   Run scripts/00-simulate_data.R to simulate diamond data
-   Run scripts/01-test_simulated_data.R to test simulate diamond data
-   Run scripts/02-download_data.R to download raw data from DADL
-   Run scripts/03-data_cleaning.R to generate cleaned data, train data and test data
-   Run scripts/04-test_analysis_data.R to test simulate diamond data
-   Run scripts/05-exploratory_data_analysis.R to explore cleaned diamond data
-   Run scripts/06-model_data.R to generalize linear model, linear regression model and bayesian regression model based on the train data.
-   Render paper/paper.qmd to generate the PDF of the paper

# Statement on LLM Usage
Parts of this project were developed with assistance from ChatGPT-4o. The complete interaction history is available in others/llm_usage, ensuring transparency in the use of AI tools during the workflow
