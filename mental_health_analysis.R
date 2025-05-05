
# mental_health_analysis.R

# Load libraries
library(tidyverse)
library(lm.beta)
library(psych)

# Load the dataset (make sure the CSV file is in your working directory)
brf <- read_csv("brfss2021.csv", show_col_types = FALSE)

# Select relevant variables
brf_cm <- brf %>%
  select(MENTHLTH, SEXVAR, EDUCA, PRIMINSR)

# Clean the dataset
# Recode 88 (None) in MENTHLTH as 0, and remove 77, 99, and NA values across variables
brf_cm <- brf_cm %>%
  mutate(MENTHLTH = ifelse(MENTHLTH == 88, 0, MENTHLTH)) %>%
  filter(
    !MENTHLTH %in% c(77, 99), !is.na(MENTHLTH),
    !SEXVAR %in% c(7, 9), !is.na(SEXVAR),
    !EDUCA %in% c(9), !is.na(EDUCA),
    !PRIMINSR %in% c(77, 99), !is.na(PRIMINSR)
  )

# Basic descriptive statistics
brf_cm %>%
  select(SEXVAR, MENTHLTH, PRIMINSR, EDUCA) %>%
  summary()

# Run 3 linear regression models

# Model1 predicts the number of poor mental health days based on the predictor PRIMINSR.
model1 <- lm(MENTHLTH ~ PRIMINSR, data = brf_cm)
summary(model1)

# Model2 predicts the number of poor mental health days based on the predictors PRIMINSR and SEXVAR.
model2 <- lm(MENTHLTH ~ PRIMINSR + SEXVAR, data = brf_cm)
summary(model2)

# Model3 predicts the number of poor mental health days based on the predictors PRIMINSR and EDUCA.
model3 <- lm(MENTHLTH ~ PRIMINSR + EDUCA, data = brf_cm)
summary(model3)

# Run AIC for each model
AIC(model1, k=1)
AIC(model2, k=2)
AIC(model3, k=2)
