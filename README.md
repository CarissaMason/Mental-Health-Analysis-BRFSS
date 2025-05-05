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
### Mental Health Days Graphs
<img src="plots/avg%20menhlth%20by%20priminsr.png" width="600" height="400">


<img src="plots/avg%20menthlth%20%20by%20educa.png" width="600" height="400">


<img src="plots/avg%20menthlth%20by%20sexvar.png" width="600" height="400">

### Variable Distribution
<img src="/plots/dist%20educa.png" width="600" height="400">

<img src="/plots/dist%20of%20menthlth.png" width="600" height="400">

<img src="/plots/dist%20priminsr.png" width="600" height="400">

<img src="/plots/dist%20sexvar.png" width="600" height="400">

### Discussion
- The distribution of poor mental health days shows that most respondents reported 0 days.
- The distribution of education shows a left-skew, which means the data set is skewed toward higher education levels.
- The sex distribution shows slightly more females in the dataset than males.
- The distribution of primary health insurance types shows that employer/union plans and Medicare are the most used.
- The Average Days of Poor Mental Health by Type of Health Insurance shows that respondents with Medicaid have the highest number of poor mental health days in the past month, while those with Medicare have the least.
- The Average Days of Poor Mental Health by Education chart shows that, on average, respondents with some high school education report a higher number of poor mental health days, while those who are college graduates report the least.
- Finally, the Average Days of Poor Mental Health by Sex chart shows that females report a higher number of poor mental health days in the past month than males.

### Outliers
<img src="/plots/educa%20out.png" width="600" height="400">

<img src="/plots/menthlth%20out.png" width="600" height="400">

<img src="/plots/priminsr%20out.png" width="600" height="400">

### Outlier Discussion
I created box plots to look for outliers since box plots make it easy to visualize outliers. However, I could not find any true outliers. The box plots make it look like codes 77, 88, and 99 are outliers because of the numeric difference between the other codes with a lower numeric value. I removed 77 and 99 from PRIMINSR and MENTHLTH because "Don't know/Not Sure" and "Refused" were not relevant. I renamed 88, the value for "None" in MENTHLTH and PRIMINSR to 0 to better represent the data.

### Basic Descriptive Statistics
<img src="/plots/basic%20stats.JPG" width="1200" height="300">

### Discussion
- For SEXVAR, based on the summary() descriptive statistic, SEXVAR has 29,852 more females than males.
- For MENTHLTH, the summary() shows the minimum is 0 poor mental health days in the past month. The 1st Quartile is 0, meaning 25% of respondents reported no poor mental health days in the past month. The median number of poor mental health days is 0, meaning half of the respondents reported no poor mental health days, and half reported more. The mean for this variable shows respondents have an average of 4.1 poor mental health days in the past month, which means even though most respondents report 0 poor mental health days, there are a significant number of people who report more days.
- For PRIMINSR, the summary() gives a breakdown of the amount of respondents in each insurance category. This table shows that the majority of respondents are covered by employer/union plans, followed by Medicare. A notable portion of respondents have no insurance.
- For EDUCA, the summary() shows that most respondents have a college degree, while very few have only none/only kindergarten level of education. This suggests that the dataset is skewed toward higher education levels.

## How to Run
```r
# Download the Dataset
Get the `brfss2021.csv` file from the [CDC BRFSS Data Portal](https://www.cdc.gov/brfss/annual_data/annual_2021.html)  
Ensure it is named brfss2021.csv
Save it in the same folder as the R script

# Load necessary packages
install.packages(c("tidyverse", "lm.beta", "psych"))
library(tidyverse)
library(lm.beta)
library(psych)

# Load and clean the data
source("mental_health_analysis.R")
