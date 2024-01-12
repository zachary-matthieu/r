# Exploring Dataframes ----

glimpse(lc)
dim(lc)
str(lc)
nrow(lc)
ncol(lc)
names(lc)


# Referencing Rows and Columns ----
lc[1:5, 1:3]                          # First is rows,
                                      # Second is columns 

lc[1:5,]                              # Blank after comma 
                                      # extracts all columns

lc[1:5, c(1,5)]                       # Specifies by column index


lc$Height                             # Specifies by column name

lc[1:5, c('Smoke', 'Gender')]         # Extracts multiple column
                                      # by names 

mean(lc$Height)

sd(lc$Height)

hist(lc$Height)
