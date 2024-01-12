library(tidyverse)

data()

view(mpg)

?mpg

glimpse(mpg)

filter(mpg, cty >= 20)

mpg_efficient <- filter(mpg, cty >= 20) %>%
  view()

mpg_ford <- filter(mpg, manufacturer == "ford") %>%
  sort(mpg_ford$cty, decreasing = TRUE) %>%
  view()

mpg %>%
  mutate(cty_metric = 0.425144 * cty) %>%
  view()

mpg %>%
  group_by(class) %>%
  summarise(mean(cty),
            median(cty))
