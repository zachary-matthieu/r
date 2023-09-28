df <- iris

row_labels <- df[,5]

# Encoding Target Feature as Factor
df$Species <- as.numeric(df$Species)


# Scaling
df[,c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")] <- scale(
  df[,c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")])

# Train/Test Split (80/20)
set.seed(123)

size <- floor(0.8 * nrow(df))

train_ind <- sample(seq_len(nrow(df)), size = size)

# Training Label
train_labels <- df[train_ind, 5]

# Testing Label 
test_labels <- row_labels[-train_ind]

# Training Data
data_train <- df[train_ind,1:4]

# Testing Data 
data_test <- df[-train_ind,1:4]

# Fit KNN Model
library(class)

predictions <- knn(train = data_train,
                   test = data_test,
                   cl = train_labels,
                   k= 11)

# Plotting Values 
plot_predictions <- data.frame(
  data_test$Sepal.Length,
  data_test$Sepal.Width,
  data_test$Petal.Length,
  data_test$Petal.Width,
  predicted = predictions)

# Renaming Columns
colnames(plot_predictions) <- c("Sepal.Length",
                                "Sepal.Width",
                                "Petal.Length",
                                "Petal.Width",
                                'predicted')

library(ggplot2)
library(plyr)
require(gridExtra)


ggplot(plot_predictions, aes(Petal.Length, Petal.Width, color = predicted, fill = predicted)) + 
  geom_point(size = 5) + 
  geom_text(aes(label=test_labels),hjust=1, vjust=2) +
  ggtitle("Predicted relationship between Petal Length and Width") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.position = "none")


ggplot(plot_predictions, aes(Sepal.Length, Sepal.Width, color = predicted, fill = predicted)) + 
  geom_point(size = 5) + 
  geom_text(aes(label=test_labels),hjust=1, vjust=2) +
  ggtitle("Predicted relationship between Sepal Length and Sepal") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.position = "none")
