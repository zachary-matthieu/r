# Import Data 
g <- read.csv("C:\\Users\\zacha\\Hyperborea\\r\\csv\\diabetes.csv", 
              header=TRUE, sep=",") 

# Define Variables 

chol <- g[,"chol"]  
gender <- as.factor(g[,"gender"])  
height <- g[,"height"] 
weight <- g[,"weight"] 
age <- g[,"age"] 
dm <- as.factor(g[,"dm"]) 
insurance <- as.factor(g[,"insurance"])
# 0 = none, 1 = gov, 2 = private 
fh <- as.factor(g[,"fh"]) 
# 1 = FH, 0 = no FH 
smoking <- as.factor(g[,"smoking"]) 
# 1, 2 , 3 
hdl <- g[,"hdl"] 
ratio <- g[,"ratio"] 
location <- as.factor(g[,"location"]) 
frame <- as.factor(g[,"frame"]) 
systolic <- g[,"bp.1s"] 
diastolic <- g[,"bp.1d"] 

# Calculate BMI 

# 1) Convert Height/Weight to Metric Units 
height.si <- height*0.0254 
weight.si <- weight*0.453592 

# 2) BMI = (Weight/Height)^2 
bmi <- weight.si/height.si^2 

# Table for Gender Variable
table_gender <- table(gender)  

# Gender Percentage
round(100 * prop.table(table_gender), digits = 1)  

## Female   Male  
##   58.1   41.9 

# BMI Categorization 
bmi_categorised <- ifelse(bmi < 18.5, "underweight", 
                          ifelse(bmi >= 18.5 & bmi <= 25, "normal", 
                                 ifelse(bmi > 25 & bmi <= 30, "overweight", 
                                        ifelse(bmi > 30, "obese", NA)))) 

# Cross Tabulate Diabetes Status and BMI Category 
dm_by_bmi_category <- table(bmi_categorised, dm, exclude = NULL) 
dm_by_bmi_category 

# Table in Each BMI Category With or Without Diabetes 
round(100 * prop.table(dm_by_bmi_category, margin = 1), digits = 1) 

# Categorise Age by Group 
age_grouped <- ifelse(age < 45, "under 45", 
                      ifelse(age >= 45 & age < 65, "45 - 64",  
                             ifelse(age >= 65 & age < 75, "65 - 74",  
                                    ifelse(age >= 75, "75 or over", NA)))) 

# Cross Tabulate Age by Gender 
age_group_by_gender <- table(age_grouped, gender, exclude = NULL) 

# % in Each Age Group by Gender 
round(100 * prop.table(age_group_by_gender, margin = 2), digits = 1) 

# Null Logistic Model for Diabetes 
m <- glm(dm ~ 1, family = binomial(link = logit)) 
summary(m)

# Logistic Regression with Gender as Predictor Variable 
m <- glm(dm ~ gender, family = binomial(link = logit)) 
summary(m) 

# 1) Gender Variable Levels 
levels(gender) 

# 2) "Male" as Reference Group 
gender <- relevel(gender, ref = "male") 

# 3) Logistic Regression 
m <- glm(dm ~ gender, family = binomial(link = logit)) 
summary(m) 

# 4) Exponentiate Log Odds of Diabetes When Female 
exp(m$coefficients["genderfemale"]) 

# Logistic Model with Age as Predictor Variable 
m <- glm(dm ~ age, family = binomial(link = logit)) 
summary(m) 

# 1) Cross Tabulation of Age and Diabetes Status  
dm_by_age <- table(age, dm) 

# 2) Frequencies of Diabetes Status by Age 
freq_table <- prop.table(dm_by_age, margin = 1) 

# 3) Odds of Diabetes 
odds <- freq_table[, "yes"]/freq_table[, "no"] 

# 4. Log Odds 
logodds <- log(odds) 

# 5) Plot Ages Found in Sample Against Log Odds of Diabetes 
plot(rownames(freq_table), logodds) 
