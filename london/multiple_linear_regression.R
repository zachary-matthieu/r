df <- read.csv("C:\\Users\\zacha\\Hyperborea\\r\\csv\\diabetes.csv")
attach(df)

# Histogram
hist(age, breaks = 18, col = 'skyblue3')

# Density 
d <- density(age)

# Density Plot
plot(d, main = "")

m <- glm(as.factor(dm) ~ age + gender, data = df, family = binomial) 

# Exponentiate Coefficient 
exp(confint(m)) 

# Multiple Logistic Regression 
m2 <- glm(as.factor(dm) ~ age + chol + insurance, data = df, family = binomial) 
summary(m2)
exp(confint(m2)) 
