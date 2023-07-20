library(tidyverse)
library(reshape2)
library(dplyr)
library(tidytext)
library(topicmodels)
library(LDAvis)
library(servr)

df3 <- read.csv("C:\\Users\\zacha\\Hyperborea\\r\\csv\\twitter_sentiment\\twitter2.csv")

# Add Row Number Column 
df3$row_num <- seq_len(nrow(df3))

df3 %>% 
  head() %>% 
  select(-text)

# Renamed Columns 
df3 <- df3 %>%
  rename(Tweet = 4, Rating = Irrelevant, UserID = X3364, 
         Topic = Facebook, Row = row_num)

# Removing URLs
df3$Tweet <- df3$Tweet %>%
  str_remove_all("https://t.co/\\w+")

# Tokenize 
df3_tokens <- df3 %>%
  tidytext::unnest_tokens(input = text, output = word)

# Stop Word Removal
d3_tokens <- df3 %>%
  anti_join(tidytext::stop_words, by = word) %>%
  filter(nchar(word) >= 3)

# Most Frequent Tokens
df3_tokens %>% 
  count(word) %>% 
  arrange(desc(n))

# Document Term Matrix 
dtm <- df3_tokens %>%
  count(row_num, word) %>%
  cast_dtm(document = row_num, term = word, value = n)

# 3 LDA Topics
lda_tweets <- topicmodels::LDA(dtm, k = 3, control = list(seed = 12))

tweet_topics <- tidytext::tidy(tweets_lda, matrix = "beta")

top_terms <- tweet_topics %>%
  group_by(topic) %>%
  slice_max(beta, n = 20) %>% 
  ungroup() %>%
  arrange(topic, -beta)

# Top Terms Plot
top_terms %>%
  mutate(term = reorder_within(term, beta, topic)) %>%
  ggplot(aes(beta, term, fill = factor(topic)))+
  geom_col(show.legend = FALSE) +
  theme_minimal() +
  ggtitle("Top terms by topic") +
  facet_wrap(~topic, scales = "free") +
  scale_y_reordered()
