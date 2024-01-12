install.packages("tidyverse")

library(tidyverse)
library(ggplot2)

data(iris)

virginica <- iris[101:150,]

ggplot(data = virginica, aes(virginica$Sepl.Length, virginica$Sepal.Width)) + geom_point()
