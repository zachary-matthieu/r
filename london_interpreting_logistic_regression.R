df <- read.csv("C:\\Users\\zacha\\Hyperborea\\r\\csv\\diabetes.csv")
attach(df)
library(tidyverse)
library(dplyr)

# Filter FUnction 
df %>%
  filter(location == "Buckingham" & dm == "yes") 

# Table Function 
location <- as.factor(df[, 'location'])
t <- table(location)
addmargins(t)

# Cross Tabulation 
dm_by_location <- table(location, dm, exclude = NULL) 
dm_by_location

# Logistic Regression 
ld <- glm(dm ~ location, family = "binomial")
summary(ld) 
table(ld$y)

# Cross Tabulation II
dm_by_age <- table(age, dm)

# Frequency of Diabetes by Age
freq_table <- prop.table(dm_by_age, margin = 1) 

# Odds of Diabetes
odds <- freq_table[, "yes"]/freq_table[, "no"] 

# Log Odds
logodds <- log(odds) 

# Plot Aginst Log Odds of Diabetes 
plot(rownames(freq_table), logodds) 

# Contrasts Function 
contrasts(gender)

# Levels Function 
levels(gender)