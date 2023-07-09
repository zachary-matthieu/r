#### Data CLeanining ----

library(gapminder)
library(tidyverse)

data(gapminder)

df <- gapminder

df %>%
  arrange(desc(gdpPercap)) %>%
  head(n=15)

outliers <- df %>%
  filter(country == "Hong Kong, China")

df_clean <- df %>%
  filter(country != "Hong Kong, China")

str(df_clean)

df_clean$country <- as.character(df_clean$country)
df_clean$continent <- as.character(df_clean$country)

str(df_clean)

summary(df_clean)

#### Joins ----

country <- gapminder %>%
  select(country, year, lifeExp, pop, gdpPercap)

continent <- gapminder %>%
  select(continent, year)

df_j1 <- left_join(country, continent, by = 'year')

df_j2 <- inner_join(country, continent, by = 'year')

df_j3 <- right_join(country, continent, by = 'year')