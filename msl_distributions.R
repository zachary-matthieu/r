# Rnorm Function 
rnorm(1000)
qplot(rnorm(1000))

# Pnorm Function 
pnorm(12:16, 14, 0.8)

# Qnorm Function 
qnorm(c(0.25, 0.50, 0.75), 14, 0.80)



# P (X <= 70)
pnorm(q= 70, mean = 75, sd = 5, lower.tail = T)

# P (X >= 85)
pnorm(q = 85, mean = 75, sd = 5, lower.tail = F)

#P (Z >= 1)
pnorm(q = 1, mean = 0, sd = 1, lower.tail = F)



# Q1
qnorm(p = 0.25, mean = 75, sd = 5, lower.tail = T)



# Dnorm Visual
x <- seq(from = 55, to = 95, by = 0.25)
           
dens <- dnorm(x, mean = 75, sd = 5)

plot(x, dens, type = "l")
plot(x, dens, type = "l", main = "X ~ Normal: Mean = 75, SD = 5", 
     xlab = "x", ylab = "Probability Density", las = 1)
abline(v = 75)



# Rnorm Visual
rand <- rnorm(n = 40, mean = 75, sd = 5)
rand

hist(rand)