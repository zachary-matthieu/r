df <- read.csv("C:\\Users\\zacha\\Hyperborea\\r\\csv\\diabetes.csv")
attach(df)

# Extract Variable Names
colnames(df)

dimnames(df)

# Establishing Categorical Variables
chol <- df["chol"]
gender <- as.factor(df[, "gender"])
dm <- as.factor(df[, "dm"])

# Tabling to Determine Stats 
t <- table(gender)
addmargins(t)

round(prop.table(t), digits = 3)

# Eliminating Null Values
dm2 <- factor(dm, exclude = NULL)
table(dm2)

# Summary Function 
summary(chol)

height <- df[,'height']
weight <- df[, 'weight']
summary(height)
summary(weight)

# Calculating BMI 
height.si <- height*0.0254
weight.si <- weight*0.453592
bmi <- weight.si/height.si^2
summary(bmi)

# Ifelse Function
bmi_categorised <- ifelse(bmi < 18.5, "underweight", 
                          ifelse(bmi >= 18.5 & bmi <= 25, "normal", 
                                 ifelse(bmi > 25 & bmi <= 30, "overweight", 
                                        ifelse(bmi > 30, "obese", NA)))) 

table(bmi_categorised, exclude = NULL)

# Cross-Tabulation 
dm_by_bmi_category <- table(bmi_categorised, dm2, exclude = NULL) 
dm_by_bmi_category
round(100 * prop.table(dm_by_bmi_category, margin = 1), digits = 1) 