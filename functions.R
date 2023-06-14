df <- read.delim("C:\\Users\\zacha\\Hyperborea\\r\\csv\\lungcap.txt")
attach(df)

#Name Function
names(df)

#Summary Function
summary(df)

#Frequency Table for Categorical Variable 
table(Smoke)

#Proportion of Frequency
table(Smoke)/725

#Length Function 
length(Smoke)

#Proper Syntax
table(Smoke)/length(Smoke)

#Contigency Table (Pivot Table)
table(Smoke, Gender)

#Mean Function 
mean(LungCap)

#Median Function
median(LungCap)

#Variance Function 
var(LungCap)

#Standard Deviation Function 
sd(LungCap)

#Minimum Function 
min(LungCap)

#Maximum Function 
max(LungCap)

#Range Function 
range(LungCap)

#Quantile Function
quantile(LungCap, probs = 0.9)
quantile(LungCap, probs = c(0.2, 0.5, 0.9, 1))

#Correlation Function 
(cor(LungCap, Age)

#Linear Regression Plot
qplot(LungCap, Age, data = df, geom = "point") +
  geom_smooth(method = "lm", se = F)