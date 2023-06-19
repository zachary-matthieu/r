# Library Package ----
library(tidyverse)
library(ggplot2)

# Data Acquisition ----
data(cars)
?cars
head(cars,10)

# Linear Model ----
cars %>%
  lm(dist ~ speed, data = .) %>%
  summary()

# Model ----
model <- lm(dist ~ speed, data = cars)

# Residuals ---- 
model$residuals

# Histogram ----
hist(model$residuals)

# New Prediction Values ----
new_speeds <- data.frame(speed = c(10,15,20))

# Predictions ----
predict(model, new_speeds) %>% 
  round(1)

model$fitted.values

# Prediction Model ----
cars %>%
  lm(dist ~ speed, data = .) %>%
  predict(data.frame(speed = c(10,15,20))) %>%
  round(1)

# Qplot ----
qplot(speed, dist, data = cars) +
  geom_point() +
  geom_smooth(method = "lm", se = F)

  