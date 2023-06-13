data(cars)

library(tidyverse)

library(ggplot2)

#Quick Plots 
qplot(speed, dist, data = cars, geom = "point")

qplot(speed, dist, data = cars, geom = "point") +
  geom_smooth(method = "lm", se = FALSE)

lm(dist ~ speed, data = cars) 

#Constructing a Model
model <- lm(dist~ speed, data = cars)
summary(model)
view(model)

#Specifying Model Nodes 
model$residuals

cars$predicted <- model$fitted.values

view (cars)

#Prediction Model 
predict(model, data.frame(speed = c(12.5,  15.5, 17)))
