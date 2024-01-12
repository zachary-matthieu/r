# Data Packages 
install.packages("psych")
library(psych)

install.packages("crosstable")
library(crosstable)

# Psych Describe Function 
describe(copd)

# Cross Table
crosstable(copd, copd$copd)

# Pairwise Correlation 
matrix_data <- copd[,c("AGE", "PackHistory", 
                       "FEV1", "FEV1PRED", 
                       "FVC", "CAT", "HAD", 
                       "SGRQ")]

# Correlation Matrix
cor_matrix <- cor(matrix_data)

round(cor_matrix, 2)

cor(AGE, FEV1)
