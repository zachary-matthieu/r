ms

#Simple Functions
head(ms)
class(ms$sleep_total)
length(ms)
names(ms)
unique(ms$vore)

#Missing Identifier 
missing <- !complete.cases(ms) %>%
  view()

library(dplyr)
library(tidyverse)
install.packages("dplyr")
library(dplyr)

data("starwars")
sw <- starwars

#Select Function
sw %>%
  select(1:3)

sw %>%
  select(name, height, mass)

#Contains Functions
sw %>%
  select(ends_with("color"))

sw%>%
  select(starts_with("skin"))

#Rename Function
sw %>%
  rename("characters" = "name") %>%
  head()

#Variable Change 
sw %>%
  mutate(height = as.numeric(height)) %>%
  glimpse()

sw %>%
  mutate(height = as.character(height)) %>%
  glimpse()

#Recode Function
sw %>%
  select(sex) %>%
  mutate(sex = recode(sex,
                     male = "XY",
                     female = "XX"))

#Delete Dataframe
rm(sq)

#Mean Function 
mean(sw$height, na.rm = TRUE)                       #na.rm is necessary with missing values 

#If Else Function 
sw1 <- sw %>%
  select(name, height, sex) %>%
  mutate(size = 
           if_else(height >= 180,
                   "tall",
                   "short")) %>%
  mutate(sex = recode(sex,
                      "male" = "XY",
                      "female" = "XX"))

view(long_df)

data(msleep)
ms <- msleep

#Stats Functions
min(ms$awake)
max(ms$awake)
range(ms$awake)
IQR(ms$awake)
mean(ms$awake)
median(ms$awake)
summary(ms)

#Table Function 
table(ms$vore)

#Multiple Filter
ms %>%
  select(vore, order) %>%
  filter(order %in% c("Rodentia", "Primates")) %>%
  table()

data(pressure)
plot(pressure)

#ggplot Formula
ggplot(data = sw, 
       aes(x = gender)) + geom_bar()

#Visualizations
sw %>%
  drop_na(height) %>%
  ggplot(aes(height)) + geom_histogram()

sw %>%
  drop_na(height) %>%
  ggplot(aes(height)) + 
  geom_boxplot(fill = "steelblue") +
  theme_bw() +

sw %>%
  drop_na(height) %>%
  filter(sex %in% c("male", "female")) %>%
  ggplot(aes(height,
             color = sex,
             fill = sex)) +
  geom_density(alpha = 0.2) +
  theme_bw()

sw %>%
  filter(mass < 200) %>%
  ggplot(aes(height, mass, color = sex)) +
  geom_point(size = 5, alpha = 0.5) +
  theme_minimal() +
  labs(title = "Height and Mass by Sex")

sw %>%
  drop_na(height) %>%
  filter(mass < 200) %>%
  ggplot(aes(height, mass, color = sex)) +
  geom_point(size = 3, alpha = 0.8) +
  geom_smooth() +                                 #Adds linear diagram 
  facet_wrap(~sex) +                              #Separate visual into boxes
  theme_bw() +
  labs(title = "Height and Mass by Sex")

library(gapminder)
library(dplyr)
library(tidyverse)
library(gapminder)

view(gapminder)
gm <- gapminder

#T-Test
gapminder %>%
  filter(continent %in% c("Africa", "Europe")) %>%
  t.test(lifeExp ~ continent, data = .,
         altrnative = "two.sided",
         paired = FALSE)

#Anova Test
gm %>%
  filter(year == 2007) %>%
  filter(continent %in% c("Americas", "Europe", "Asia")) %>%
  aov(lifeExp ~ continent, data = .) %>%
  summary()






















