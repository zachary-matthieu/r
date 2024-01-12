#### Summary Statistics ----

# Summary of Dataframe
summary(lc)

# Summary of Column
summary(lc$Height)

# Summary of Multiple Columns
summary(lc[, c('Age', 'Height')])



#### Summary Visualization ----

# Histogram of Column
hist(lc$Height)

# Boxplot of Column
boxplot(lc$Height)

# Scatterplot of Column
plot(lc$Gender)

plot(lc$LungCap, type = 'l')

plot(lc[, c('LungCap', 'Age', 'Height')])



#### Factors ----

# Analyzing Characters/Strings Through Factor Conversion 
lcg <- factor(lc$Gender)
plot(lcg)
summary(lcg)



#### Filter ----

lc_xy <- lc %>%
  filter(Gender == "male")

lc_adult <- lc %>%
  filter(Age >= 18)

# Double Filter
lc_adult_xy <- lc %>%
  filter(Gender == 'male', Age >= 18)

# Triple Filter 
lc_adult_xy_smoker <- lc %>%
  filter(Gender == 'male', Age >= 18 & Smoke == 'yes')



#### Select ----

height_lc <- lc %>%
  select(Height)

height_lc %>% 
  drop_na(Height) %>%
  summarise(avg_height = mean(Height))

no_smoke_csect <- lc %>%
  select(LungCap, Age, Height, Gender)



#### Filter & Select ----

lc_xx_children <- lc %>%
  filter(Gender == 'female', Age < 18) %>%
  select(LungCap, Age, Height, Gender)



#### %in% ----

vg <- read.csv("C:\\Users\\zacha\\Hyperborea\\r\\csv\\vgsales.csv")

console_vg <- vg %>%
  filter(Platform %in% c('PS4', 'XOne', 'Wii'))



#### Mutate ----

no_na_vg <- vg %>%
  mutate(Exclude_NA_Sales = Global_Sales - NA_Sales, 
         Exclude_EU_Sales = Global_Sales - EU_Sales)



#### Rename ----

vg <- vg %>%
  rename(Device = Platform, Category = Genre)



#### Relocate ----

vg <- vg %>%
  relocate(NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales, .before = Device)

numbers_vg <- vg %>%
  relocate(where(is.character), .after = where(is.numeric))



#### Distinct ----

vg %>%
  select(Device) %>%
  distinct()



#### Missing Values ---- 

sw %>%
  filter(is.na(sex)) %>%
  view()

sw %>%
  filter(!is.na(sex)) %>%
  view()

sw %>%
  drop_na(sex) %>%
  view()



#### Arrange ----

sw %<>%
  arrange(name, .bygroup = species) %>%
  view()

sw %>%
  arrange(desc(height)) %>%
  view()
