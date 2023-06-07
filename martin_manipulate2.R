library(tidyverse)

sw <- starwars

#Dimension
dim(sw)         # row count, column count

#Structure
str(sw)

#Glimpse
glimpse(sw)

#View
view(sw)

#Preview Top 
head(sw)

#Preview Bottom 
tail(sw)

#Attach
attach(sw)      # enables user to omit table name 

#Displays Columns 
names(sw)

#Number of Columns
length(sw)

#Classfication 
class(height)

#Number of Values in Column 
length(height)

#Unique
unique(eye_color)

#Sorting DESC
view(sort(table(hair_color), decreasing = TRUE))

#Barplot
barplot(sort(table(hair_color), decreasing = TRUE))

#Proper Sorting DESC
sw %>%
  select(hair_color) %>%
  count(hair_color) %>%
  arrange(desc(n)) %>%
  view()

#NA Values
view(sw[is.na(hair_color), ])

#Summary 
summary(height)

#Boxplot
boxplot(height)

#Histogram
hist(height)




       