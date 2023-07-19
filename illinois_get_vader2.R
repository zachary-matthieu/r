library(vader)
library(dplyr)
library(tidyverse)

df2 <- read.csv("C:\\Users\\zacha\\Hyperborea\\r\\csv\\twitter_sentiment\\twitter2.csv")

view(df2)
str(df2)
attach(df2)

# Renamed Columns 
df2 <- df2 %>%
  rename(Tweet = 4)

df2 <- df2 %>%
  rename(Rating = Irrelevant)

df2 <- df2 %>%
  rename(UserID = X3364)

df2 <- df2 %>%
  rename(Topic = Facebook)

# Number of Columns
nrow(df2)

# Get_Vader Function 
get_vader("I was inspired by @miserabletop to get assassins creed 
          on switch and now I couldnâ€™t be more excited to leave 
          the party early to go home and play Black Flag pic.twitter.com/yHrybJDYnn")

# Get_Vader to All Rows
Vscores <- df2$Tweet %>%
  lapply(get_vader)

# Converting Scores to Numeric
df2 <= df2$Tweet %>%
  mutate(Compound = Vscores %>%
           sapply(function(v) {as.numeric}))

# Mutating Additional Score Columns 
df2 <- df2 %>% 
  mutate(Compound = Vscores %>% sapply(function(v) { as.numeric(v["compound"]) }),
         Positive = Vscores %>% sapply(function(v) { as.numeric(v["pos"]) }),
         Neutral = Vscores %>% sapply(function(v) { as.numeric(v["neu"]) }),
         Negative = Vscores %>% sapply(function(v) { as.numeric(v["neg"]) }),)

# 50 Most Positive Tweets 
df2 %>% 
  arrange(desc(Compound)) %>% 
  select(UserID, Tweet, Compound, Positive, Neutral, Negative) %>%
  head(50)

# 50 Most Negative Tweets 
df2 %>% 
  arrange(Compound) %>% 
  select(UserID, Tweet, Compound, Positive, Neutral, Negative) %>%
  head(50)

# Average Compound Score
mean(df2$Compound)

# Boxplot 
df2 %>% 
  ggplot(aes(x = Compound)) + 
  theme_classic() +
  geom_boxplot()

# Histogram 
df2 %>% 
  ggplot(aes(x = Compound)) + 
  theme_classic() +
  geom_histogram(bins = 20, color="black", fill="white")