df <- read.delim("C:\\Users\\zacha\\Hyperborea\\r\\csv\\lungcap.txt")

#Plot Function 
plot(Age, LungCap, main = "Scatterplot") +

#Correlation Function 
cor(Age, LungCap)

#Model Function 
model <- lm(LungCap ~ Age)

#Summary Function 
summary(model)

#Alt Regression Line
abline(model, col = 2, lwd = 3)

#Confidence Interval Function 
confint(model)
confint(model, level = 0.99)

#Anova Function
anova(model)

#Quick Residual Plot 
plot(model)                                     #Straight line indicates good data,
                                                #Slope indicates skewed or biased data

#Multiview
par(mfrow = c(2,2))                             #(a,b)
plot(model)                                     #(number of rows, number of columns)
