install.packages("survival")
library(survival)

install.packages("survminer")
library(survminer)

df <- read.csv("C:\\Users\\zacha\\Hyperborea\\r\\csv\\heart.csv")

ethnicgroup <- factor(df[,"ethnicgroup"]) 
fu_time <- df[,"fu_time"]
death <- df[,"death"]

cox <- coxph(Surv(fu_time, death) ~ ethnicgroup, data = df)
summary(cox)

cox <- coxph(Surv(fu_time, death) ~ age + gender + copd + prior_dnas + ethnicgroup)
summary(cox)
