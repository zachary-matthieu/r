library(tidyverse)
library(ggplot2)
library(dplyr)

lc <- read.delim("C:\\Users\\zacha\\Hyperborea\\r\\csv\\lungcap.txt")
attach(lc)

boxplot(LungCap)

#H0: mu < 8
#95% confint for mu (one-sided)

t.test(LungCap, mu = 8, alt = "less", conf = 0.95)

data(starwars)

sw <- starwars

attach(sw)

#T Test Function 
t.test(Height ~ Gender, data = sw)

sw %>%
  select(Gender, Height) %>%
  filter(Gender %in% c("masculine", "feminine")) %>%
  drop_na(Height) %>%
  t.test(Height ~ Gender, data = .)

library(tidyverse)
library(gapminder)

data(gapminder)

gm <- gapminder

gm %>%
  group_by(continent) %>%
  summarise(avg_life = mean(lifeExp))

gm %>%
  filter(continent == "Africa") %>%
  select(lifeExp) %>%
  t.test(mu = 50)

tt1 <- gm %>%
  filter(continent == "Africa") %>%
  select(lifeExp) %>%
  t.test(mu = 50)

gm %>%
  filter(continent %in% c("Africa", "Europe")) %>%
  t.test(lifeExp ~ continent, data = ., alternative = "two.sided")

gm %>%
  filter(country %in% c("Ireland", "Switzerland")) %>%
  t.test(lifeExp ~ country, data = ., alternative = "less", conf.level = 0.95)

gm %>%
  filter(country %in% c("China", "Japan")) %>%
  t.test(lifeExp ~ country, data = ., alternative = "less", conf.level = 0.95)

gm %>%
  filter(country %in% c("France", "Spain")) %>%
  t.test(lifeExp ~ country, data = ., alternative = "less", conf.level = 0.95)

gm %>%
  filter(year %in% c(1957, 2007) & continent == "Africa") %>%
  mutate(year = factor(year, levels = c(2007,  1957))) %>%
  t.test(lifeExp ~ year, data = ., paired = T, conf.level = 0.95)

gm %>%
  filter(year %in% c(1957, 2007) & continent == "Africa") %>%
  t.test(lifeExp ~ year, data = ., paired = T, conf.level = 0.95)
  
















