library(tidyverse)
library(ggplot2)
library(lubridate)

df <- read.csv("C:\\Users\\zacha\\Hyperborea\\r\\csv\\customer.csv")

str(df)

# 1) Variable Conversions 
df$Date <- as.Date(df$Date, format = "%m/%d/%Y")
df$Department <- as.factor(df$Department)
df$Category <- as.factor(df$Category)
df$CustomerCode <- as.factor(df$CustomerCode)

# 2) Quantity/Price Summaries 
summary(df$Quantity)
summary(df$Price)

# 3) Display Null Values
summary(df)

# 4) Category Bar Chart 
bc <- ggplot(df) +
  geom_bar(aes(x = Category), fill = '#003366')

bc <- bc + labs(title = "Store Inventory",
                x = "Category",
                y = "Quantity")
print(bc)

# 5) Revenue by Department
df <- df %>%
  mutate(df, Revenue = Price + Quantity)
df <- subset(df, select = -Revenue)
df <- df %>%
  mutate(df, Revenue = Price * Quantity)

ggplot(data = df, aes(x = Department, y = Revenue)) +
  geom_bar(stat = "identity", fill = '#801818')

options(scipen=999)

df %>%
  drop_na(Price, Quantity) %>%
  group_by(Department) %>%
  summarise(Total = sum(Revenue))

# 6) Histogram and Boxplot 
hist(df$Price)
hist(df$Quantity)

boxplot(df$Price)
boxplot(df$Quantity)
