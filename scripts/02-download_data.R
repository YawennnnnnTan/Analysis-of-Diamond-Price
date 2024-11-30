#### Preamble ####
# Purpose: Downloads and saves the data from Statistics Canada
# Author: Yawen Tan
# Date: 12 November 2024
# Contact: yawen.tan@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)

#### Download data ####
url <- "https://dasl.datadescription.com/download/data/3161"

#### Save data ####
download.file(url, "data/01-raw_data/diamondprice.txt")
