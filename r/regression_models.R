# 1) Accessing the Data 

df <- read.csv("C:\\Users\\zacha\\Hyperborea\\r\\csv\\bike_rentals\\day.csv")

library(lubridate)
library(tidyverse)
library(ggplot2)

summary(df)

# Convert dteday to Date Type Object
df$dteday <- as.Date(df$dteday)

# Extracting Month Name
df <- df %>%
  mutate('mnth_name' = month.abb[df$dteday]) 

# Dropping a Column 
df = subset(df, select = -(mnth_name))



# 3) Preparing the Data

# Extracting Month Name (Numeric)
df$mnth_name <- month(ymd(df$dteday))

# Extracting Month Name (Character)
df <- df %>%
  mutate(month_name = month.name[lubridate::month(df$dteday, label = T)])



# 4) Running Regresion Models 

# Model of Data 
Model1 <- lm(df$cnt ~ df$month_name, data = df)

summary(Model1)

# R-squared is 0.3906 (or 0.3813 adjusted). 
# The independent variable (month_name) explains 39.06% (or 38.13% adjusted) 
# of the variance in the dependent variable (cnt).

# April is used as a reference (baseline).
# The number of trips in April is predicted to be 4484.9 based on this model (equal to the intercept).  

# The number of trips in January is predicted to be 2176.3.

# The number of trips in June is predicted to be 5772.4.

Model2 <- lm(df$cnt ~ df$temp + df$month_name, data = df)

summary(Model2)

# R-squared for Model 2 is 0.4469 (or 0.4377 adjusted). 
# The independent variables (temp and month_name) explain 44.69% (or 43.77% adjusted) 
# of the variance in the dependent variable (cnt).

#This is higher than the previous R-squared of 0.3906 (or 0.3813 adjusted) from Model 1.

# More variance due to outdoor temperature. People are more likely to rent bikes when the 
# weather is warmer.

# The coefficient of the month_nameJan variable from Model1 without temp is -2308.6.

# The coefficient of the month_nameJan variable from Model2 with temp is -852.3.

# The magnitude is smaller because temp is also used 
# to explain the variance in the dependent variable.

# The predicted count for January is 2261.
