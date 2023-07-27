copd <- read.csv("C:\\Users\\zacha\\Hyperborea\\r\\csv\\copd.csv") 
attach(copd)

# Histogram 
hist(copd$MWT1Best,
     main = "Histogram of MWT1Best",
     xlab = "MWT1Best",
     breaks = 12)

hist(copd$FEV1, 
     main="Histogram of FEV1", 
     xlab="FEV1")

# Subset Function 
subset(copd, MWT1Best > 650)

subset(copd, MWT1Best > 600 | MWT1Best < 150)

# Descriptve Summaries 
summary(copd$MWT1Best)
sd(copd$MWT1Best, na.rm = T)
range(copd$MWT1Best, na.rm = T)
IQR(copd$MWT1Best, na.rm = T)

summary(copd$FEV1)
sd(copd$FEV1, na.rm = T)
range(copd$FEV1, na.rm = T)
IQR(copd$FEV1, na.rm = T)

# Scatterplot
plot(copd$FEV1, copd$MWT1Best,
     xlab = "FEV1",
     ylab = "MWT1Best")

plot(copd$AGE, copd$MWT1Best, 
     xlab = "AGE", 
     ylab = "MWT1Best") 

# Correlation Test
cor.test(copd$FEV1, copd$MWT1Best, 
         use = "complete.obs",
         method = "pearson")

cor.test(copd$FEV1, copd$MWT1Best, 
         use = "complete.obs",
         method = "spearman")

cor.test(copd$AGE, copd$MWT1Best, 
         use = "complete.obs", 
         method="pearson")

cor.test(copd$AGE, copd$MWT1Best, 
         use="complete.obs", 
         method="spearman") 

# Linear Model 
MWT1Best_FEV1 <- lm(MWT1Best ~ FEV1, data = copd)
summary(MWT1Best_FEV1)

# Confidence Interval 
confint(MWT1Best_FEV1)

# Residual Plots
par(mfrow=c(2,2)) 
plot(MWT1Best_FEV1)
