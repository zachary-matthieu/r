library(ggplot2)
library(cowplot)

url <- "https://raw.githubusercontent.com/StatQuest/logistic_regression_demo/master/processed.cleveland.data"

df <- read.csv(url, header=FALSE)

head(df)

colnames(df) <- c(
  "age",
  "sex",# 0 = female, 1 = male
  "cp", # chest pain
  # 1 = typical angina,
  # 2 = atypical angina,
  # 3 = non-anginal pain,
  # 4 = asymptomatic
  "trestbps", # resting blood pressure (in mm Hg)
  "chol", # serum cholestoral in mg/dl
  "fbs",  # fasting blood sugar if less than 120 mg/dl, 1 = TRUE, 0 = FALSE
  "restecg", # resting electrocardiographic results
  # 1 = normal
  # 2 = having ST-T wave abnormality
  # 3 = showing probable or definite left ventricular hypertrophy
  "thalach", # maximum heart rate achieved
  "exang",   # exercise induced angina, 1 = yes, 0 = no
  "oldpeak", # ST depression induced by exercise relative to rest
  "slope", # the slope of the peak exercise ST segment
  # 1 = upsloping
  # 2 = flat
  # 3 = downsloping
  "ca", # number of major vessels (0-3) colored by fluoroscopy
  "thal", # this is short of thalium heart scan
  # 3 = normal (no cold spots)
  # 6 = fixed defect (cold spots during rest and exercise)
  # 7 = reversible defect (when cold spots only appear during exercise)
  "hd" # (the predicted attribute) - diagnosis of heart disease
  # 0 if less than or equal to 50% diameter narrowing
  # 1 if greater than 50% diameter narrowing
)

head(df) 

str(df)

# Converting "?" to NAs
df[df == "?"] <- NA

# Converting to Factors 
df$sex <- as.factor(df$sex)
df$cp <- as.factor(df$cp)
df$fbs <- as.factor(df$fbs)
df$restecg <- as.factor(df$restecg)
df$exang <- as.factor(df$exang)
df$slope <- as.factor(df$slope)

df$ca <- as.integer(df$ca) 
df$ca <- as.factor(df$ca)  

df$thal <- as.integer(df$thal) 
df$thal <- as.factor(df$thal)

# Replacing Classifiers 
df[df$sex == 0,]$sex <- "F"
df[df$sex == 1,]$sex <- "M"

df$hd <- ifelse(test=df$hd == 0, yes="Healthy", no="Unhealthy")
df$hd <- as.factor(df$hd) # Now convert to a factor

# Verify Columns 
str(df) 

# NAs Count 
nrow(df[is.na(df$ca) | is.na(df$thal),])

# Locate NAs
df[is.na(df$ca) | is.na(df$thal),]

# Row Count 
nrow(df)

# Removing NA Rows
df <- df[!(is.na(df$ca) | is.na(df$thal)),]

# Freq Tables 
xtabs(~ hd + sex, data=df)
xtabs(~ hd + cp, data=df)
xtabs(~ hd + fbs, data=df)
xtabs(~ hd + restecg, data=df)
xtabs(~ hd + exang, data=df)
xtabs(~ hd + slope, data=df)
xtabs(~ hd + ca, data=df)
xtabs(~ hd + thal, data=df)

# Logistic Regression 
logistic1 <- glm(hd ~ sex, data=df, family="binomial") 
summary(logistic1)

# Logistic Regression ALL Columns 
logistic2 <- glm(hd ~ ., data=df, family="binomial")
summary(logistic2)

# Logistic Prediction 
predicted.data <- data.frame(
  probability.of.hd=logistic2$fitted.values,
  sex=df$sex)

predicted.data <- predicted.data[
  order(predicted.data$probability.of.hd, decreasing=FALSE),]
df$rank <- 1:nrow(predicted.data)

# Logistic Plot 
ggplot(data=predicted.data, aes(x=sex, y=probability.of.hd)) +
  geom_point(aes(color=sex), size=5) +
  xlab("Sex") +
  ylab("Predicted probability of getting heart disease")