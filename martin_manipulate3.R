library(gapminder)

view(gapminder)
df <- gapminder
df <- df %>%
  select(country, year, lifeExp)

#Wide Pivot Table
df_wide <- df %>%
  pivot_wider(names_from = year,         #names_from = column, values_from = rows
              values_from = lifeExp)    

#Long Pivot Table 
df_long <- df_wide %>%
  pivot_longer(2:13,
               names_to = "year",
               values_to = "lifeExp")

view(msleep)
ms <- msleep

#Summary Table 
ms %>%
  drop_na(vore) %>%
  group_by(vore) %>%
  summarise(Lower = min(sleep_total),
            Average = mean(sleep_total),
            Upper = max(sleep_total),
            Differnce = max(sleep_total) - min(sleep_total)) %>%
  arrange(Average) %>%
  view()

library(MASS)
attach(Cars93)
?Cars93
glimpse(Cars93)

#Table Function 
table(Origin)
table(AirBags)
table(AirBags, Origin)

#Total Row 
addmargins(table(AirBags, Origin), 1)            #1 places sum as the bottom row

#Percentages
prop.table(table(AirBags, Origin), 2) * 100      #2 indicates proportional to the column,
                                                 #blank indicates proportional to the whole 
                                                 #100 eliminates decimals 

#Rounds Numbers
round(prop.table(table(AirBags, Origin), 2) * 100)

#Proper R Formatting
Cars93 %>%
  group_by(Origin, AirBags) %>%
  summarise(number = n())

Cars93 %>%
  group_by(Origin, AirBags) %>%
  summarise(number = n()) %>%
  pivot_wider(names_from = Origin,
              values_from = number)









