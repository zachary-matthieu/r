library(tidyverse)
library(dplyr)
library(ggplot2)
theme_set(theme_minimal())
admissions <- read.csv("C:\\Users\\zacha\\Hyperborea\\r\\csv\\admissions.csv")
df <- admissions

ggplot(data = df, aes(x = gpa, y = admitted)) +
  geom_jitter(height = 0.05, alpha = 0.1)

model <- glm(admitted ~ gpa, data = df, family = "binomial")
summary(model)

ggplot(data = df, aes(x = gpa, y = admitted)) +
  geom_jitter(height = 0.05, 
              alpha = 0.1) +
  geom_smooth(method = "glm", 
              method.args = list(family = "binomial"),
              se = F)

admissions <- df %>%
  group_by(gpa) %>%
  summarise(proportion_admitted = mean(admitted),
            count = n())

admissions

ggplot(data = admissions, aes(x = gpa, y = proportion_admitted)) +
  geom_point()

model2 <- glm(proportion_admitted ~ gpa, family = "binomial", 
              data = admissions, weights = count)

summary(model2)

ggplot(data = admissions, aes(x = gpa, 
                              y = proportion_admitted,
                              weight = count)) +
  geom_point() +
  geom_smooth(method = "glm", 
              method.args = list(family = "binomial"),
              se = F)