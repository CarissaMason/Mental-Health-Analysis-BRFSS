# Predicting Mental Health Outcomes from Socioeconomic Factors using the CDC's 2021 BRFSS

## Overview
This project analyzes the 2021 Behavioral Risk Factor Surveillance System (BRFSS) survey to explore how socioeconomic factors such as sex, education level, and insurance status affect mental health outcomes in U.S. adults. The focus is on predicting the number of poor mental health days reported in the past 30 days.

## Objectives
- Clean and preprocess BRFSS survey data
- Visualize patterns in mental health outcomes
- Build linear regression models to identify key predictors
- Evaluate disparities based on socioeconomic status

## Dataset
- **Source**: [CDC BRFSS 2021](https://www.cdc.gov/brfss/)
- **Target variable**: `MENTHLTH` (Poor mental health days)
- **Predictor variables**:
  - `SEXVAR`: Respondent’s sex (1 = Male, 2 = Female)
  - `EDUCA`: Education level (1 = No school, 6 = College graduate)
  - `PRIMINSR`: Type of health insurance (1–10, 88 = No coverage)

## Data Cleaning
- Used BRFSS codebook to interpret and clean variables
- Removed or recoded responses like 77, 88, 99, and NAs
- Converted "None" in `MENTHLTH` (88) to 0
- Filtered out invalid entries for all selected variables

## Methods
- Data wrangling using `dplyr`
- Visualization using `ggplot2`
- Regression modeling with `lm()` and `lm.beta`
- Model evaluation using Adjusted R² and AIC

## Results
- **Significant predictors**: Insurance type and education level
- **Trends**:
  - Uninsured individuals reported more poor mental health days
  - Lower education levels correlated with worse mental health
  - Female respondents showed higher averages for poor mental health days

## Visualizations
Plots of variable distributions and regression results are available in the `/plots/` folder.

## How to Run
```r
# Load necessary packages
install.packages(c("tidyverse", "lm.beta", "psych"))
library(tidyverse)
library(lm.beta)
library(psych)

# Load and clean the data
source("mental_health_analysis.R")
