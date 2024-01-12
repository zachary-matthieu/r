library(tidyverse)
library(dplyr)
library(ggplot2)

data("airquality")
attach(airquality)
aq <- airquality

qplot(Month, Temp, data = airquality, geom = "point") + 
  geom_smooth(method = "lm", se = F)

aq %>%
  filter(Month == 9) %>%
  summarise(avg_sep_temp = mean(Temp))

cor(Month, Temp)

model <- lm(Temp ~ Month)

fitted.values(model)

aq$Predicted <- fitted.values(model)

aq$Residuals <- residuals(model)

qplot(fitted.values(model), residuals(model), geom = "point"``) +
        geom_smooth(method = "lm", se = F)

summary(model)

anova(model)

confint(model, level = 0.99)

mean(Temp)

max(Temp)

min(Temp)

predict(model, data.frame(Month = c(1,2,3,4,5,6,7,8,9)))
