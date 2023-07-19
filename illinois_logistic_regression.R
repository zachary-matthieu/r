library(readr)

df <- read.csv("C:\\Users\\zacha\\Hyperborea\\r\\csv\\airline_satisfaction\\airline_test.csv")

view(df)

# Numeric Conversion of Satisfcation 
df$satisfaction_numeric <- 0

df[df$satisfaction == "neutral or dissatisfied",]$satisfaction_numeric = 0
df[df$satisfaction == "satisfied",]$satisfaction_numeric = 1

# Logistic Regression
log_satisfaction <- glm(df$satisfaction_numeric ~ df$Seat.comfort, family = "binomial")
summary(log_satisfaction)

log_satisfaction2 <- glm(df$satisfaction_numeric ~ df$Seat.comfort + 
                          df$Inflight.wifi.service, family = "binomial")
summary(log_satisfaction2)