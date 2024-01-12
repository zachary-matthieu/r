data(CO2)

#T-Test
t.test(CO2$uptake)

#Margin of Error = Upper Confidence Level - Sample Mean
29.55997 - 27.2131

#Alternative Margin of Error 
qt(0.975, 83) * sd(CO2$uptake)/sqrt(84)
