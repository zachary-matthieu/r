#### Libraries ----

install.packages("Snowballc")
install.packages("wordcloud")
install.packages("Rcpp")
install.packages("stringr")
install.packages('textdata')

library(tidyverse)
library(tidytext)
library(SnowballC)
library(wordcloud)
library(Rcpp)
library(stringr)
library(textdata)


#### DataFrame ----

df <- read.delim("C:\\Users\\zacha\\Hyperborea\\r\\csv\\txt_files\\spirit_conference.txt")
summary(df)


#### Stringr Functions ----

# Preview 
df %>% 
  str_sub(1, 500)

# Count
df %>% 
  str_count()

# Keywords
df %>%
  str_detect(c('pandemic', 'Pandemic', 
             'covid', 'Covid', 'covid-19', 
             'Covid-19', 'covid 19', 'Covid 19'))

# Match Count 
df %>%
  str_count('pandemic')

# Match Location
df %>%
  str_locate_all('pandemic')

# Match Context 
df %>%
  str_extract_all(".{100}(pandemic).{100}")




#### Text Tokenization ---- 

# Tibble Conversion
tokens <- tibble(df)

# Tokenize
tokens <- tokens %>%
  tidytext::unnest_tokens(output = word, input = Corrected.Transcript,
                          token = 'words', to_lower = TRUE)

# Order of Words
tokens <- tokens %>%
  mutate(order = row_number())

# Count Tokens 
tokens %>%
  nrow()

# Token Preview
tokens[1:15,]
tokens[10000:10100,]

# Match Count 
tokens %>%
  dplyr::filter(word == str_sub('pandemic')) %>%
  count()

# Match Location
tokens %>%
  dplyr::filter(word == str_sub('pandemic'))



#### Remove Stop Words ----

# Most Frequent Words
tokens %>%
  group_by(word) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  filter(count > 20) %>%
  mutate(token = reorder(word, count)) %>%
  ggplot(aes(x = count, y = token)) +
  geom_col()

# Load Custom Stopwords
custom_stop_words <- read_csv(r"(C:\Users\zacha\Hyperborea\r\csv\stopwords.csv)",
                              col_names = FALSE)

# Stopwords Removal 
tokens <- tokens %>%
  anti_join(custom_stop_words, by = c('word' = 'X1'))







#### Stemming ----

# Similar Words
arrange(tokens, word)[316:325,]

# Stem the Tokens
stemmed <- tokens %>%
  mutate(stem = wordStem(word))

# Similar Words Post-Lemmatizing
arrange(stemmed, word)[316:325,]

stemmed %>%
  group_by(stem) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  filter(count > 20) %>%
  mutate(token = reorder(stem, count)) %>%
  ggplot(aes(x = count, y = token)) +
  geom_col()


#### Wordcloud ----

set.seed(77)

stemmed %>%
  group_by(word) %>%
  summarise(count = n()) %>%
  with(wordcloud(words = word, freq = count, min.freq = 1, max.words = 100, 
                 random.order = F, rot.per = 0.30, colors = brewer.pal(8, "Dark2")))


#### Sentiment ----

# Finance Sentiment 
loughran_dict <- tidytext::get_sentiments('loughran')

# Dictionary Category Count  
loughran_dict %>%
  group_by(sentiment) %>%
  summarise(count = n())

# Add Sentiment 
sentimented <- stemmed %>%
  inner_join(loughran_dict, by = 'word')

# Category Distribution 
sentimented %>%
  group_by(sentiment) %>%
  summarise(count = n(), percent = count/nrow(sentimented))

sentimented %>%
  group_by(sentiment) %>%
  summarise(count = n(), percent = count/nrow(sentimented)) %>%
  ggplot(aes(x = '', y = percent, fill = sentiment)) +
  geom_bar(width = 1, stat = 'identity')







