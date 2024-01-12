library(tidyverse)

data(airquality)

#Qplot
qplot(airquality$Wind, airquality$Temp)

#Correlation Function 
cor(airquality$Wind, airquality$Temp)

#Regression
qplot(airquality$Wind, airquality$Temp) +
  geom_smooth(method = "lm", se = F)

#Model
model <- lm(Temp ~ Wind, data = airquality)  #Wind Coefficient: Every unit of Wind
                                              #increases, Temp decreases by -1.2305
#Summary Function 
summary(model)

#Coefficient Function 
coef(model)

#Predicted Values in Table
fitted.values(model)

#Adding Prediction Column to Table
airquality$predicted <- fitted.values(model)

#Residual Function 
residuals(model)

#Adding Residual Column to Table 
airquality$residuals <- residuals(model)

#Residual Plot
qplot(fitted.values(model), residuals(model)) +
  geom_smooth(method = "lm", se = F)                #To check if there is a linear relationship 
, se = F                                            #slope should be straight, slope implies bias 
                                                    #and lack of data variance 
