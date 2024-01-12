library(tidyverse)
library(tidytext)

my_text <- "Our performance has been stellar"
tokens <- tibble(my_text)
tokens <- tokens %>% tidytext::unnest_tokens(
  output=word,
  input=my_text,
  token='words',
  to_lower=TRUE
)

print(tokens)
