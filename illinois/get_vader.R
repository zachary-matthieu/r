install.packages('vader')
library(vader)
library(dplyr)
library(tidyverse)

df2 <- read.csv("C:\\Users\\zacha\\Hyperborea\\r\\csv\\twitter_sentiment\\twitter.csv")

view(df2)
attach(df2)

# Renamed Columns 
df2 <- df2 %>%
  rename(Tweet = im.getting.on.borderlands.and.i.will.murder.you.all..)

df2 <- df2 %>%
  rename(Satisfaction = Positive)

df2 <- df2 %>%
  rename(UserID = X2401)

df2 <- df2 %>%
  rename(Game = Borderlands)

# Number of Columns
nrow(df2)

# Get_Vader Function 
get_vader("Man Gearbox really needs to fix this dissapointing drops 
          in the new Borderlands 3 DLC cant be fine to farm bosses 
          on Mayhem 10 to get 1 legendary drop while anywhere else 
          i get 6-10 drops. . Really sucks alot")

# Get_Vader to All Rows
Vscores <- df2$Tweet %>%
  lapply(get_vader)

df2 <= df2$Tweet %>%
  mutate(Compound = Vscores %>%
           sapply(function(v) {as.numeric}))

df2 <- df2$Tweet %>%
  lapply(get_vader)

df2 <- df2 %>% 
  mutate(Compound = Vscores %>% sapply(function(v) { as.numeric(v["compound"]) }),
  Positive = Vscores %>% sapply(function(v) { as.numeric(v["pos"]) }),
  Neutral = Vscores %>% sapply(function(v) { as.numeric(v["neu"]) }),
  Negative = Vscores %>% sapply(function(v) { as.numeric(v["neg"]) }),)
