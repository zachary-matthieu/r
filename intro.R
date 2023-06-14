install.packages("gapminder")
library(gapminder)

#Load Function
data(gapminder)

#Summary Function
summary(gapminder)

#Mean Function 
mean(gapminder$gdpPercap)

#Assigning a Value 
mean_gdppc <- mean(gapminder$gdpPercap)
mean_gdppc

#Column Shortcut 
attach(gapminder)
median(pop)
hist(lifeExp)
hist(pop)
hist(log(pop))
boxplot(lifeExp ~ continent)
plot(lifeExp ~ log(gdpPercap))

library(dplyr)

gapminder %>%
  select(country, lifeExp) %>%
  filter(country == "South Africa" | country == "Ireland") %>%
  group_by(country) %>%
  summarise(average_life = mean(lifeExp))


df1 <- gapminder %>%
          select(country, lifeExp) %>%
          filter(country == "South Africa" | country == "Ireland") 

df1

t.test(data = df1, lifeExp ~ country)

library(ggplot2)

gapminder %>%
  filter(gdpPercap < 50000) %>%
  ggplot(aes(x = log(gdpPercap), y = lifeExp, col = continent, size = pop)) +
  geom_point(alpha = 0.3) +
  geom_smooth(method = lm) +
  facet_wrap(~ continent)













