install.packages("tidyverse")
require(tidyverse)
data()

view(starwars)
data(starwars)

#Mutate Function 
starwars %>%
  select(gender, mass, height, species) %>%
  filter(species == "Human") %>%
  na.omit() %>%
  mutate(height = height / 100) %>%
  mutate(bmi = mass / height^2) %>%
  group_by(gender) %>%
  summarise(avg_bmi = mean(bmi))

#Assigning New Table
sw_bmi <- starwars %>%
  select(gender, mass, height, species) %>%
  filter(species == "Human") %>%
  na.omit() %>%
  mutate(height = height / 100) %>%
  mutate(bmi = mass / height^2) 

#Renaming Columns 
sw <- starwars %>%
  select(name, gender, height, mass) %>%
  rename(weight = mass)

#Creating Bins with Mutate Function 
sw <- starwars %>%
  select(name, gender, height, mass) %>%
  rename(weight = mass) %>%
  na.omit() %>%
  mutate(height = height / 100) %>%
  filter(gender == "masculine" | gender == "feminine") %>%                # %in% c("masculine", "feminine")
  mutate(gender = recode(gender, masculine = "m", feminine = "f")) %>%
  mutate(size = height > 1 & weight > 75,
         size = if_else(size == TRUE, "big", "small")) 

library(tidyverse)
view(msleep)  
?msleep

#Filter
df <- msleep %>%
  select(name, order, bodywt, sleep_total) %>%
  filter(order == "Primates" | bodywt > 20)                              #! indicates opposite 

df <- msleep %>%
  select(name, sleep_total) %>%
  filter(name == "Cow" | 
          name == "Dog" |
           name == "Goat")    

#Between
df <- msleep %>%
  select(name, sleep_total) %>%
  filter(between(sleep_total, 16, 18))

#Near
df <- msleep %>%
  select(name, sleep_total) %>%
  filter(near(sleep_total, 17, tol = 0.5))

#NA Values 
df <- msleep %>%
  select(name, conservation, sleep_total) %>%
  filter(is.na(conservation))

#No NA Values 
df <- msleep %>%
  select(name, conservation, sleep_total) %>%
  filter(!is.na(conservation))


