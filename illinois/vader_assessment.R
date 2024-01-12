library(vader)

get_vader("The batery of the #Apple Macbook PRo 16 inch is 
          so good that I can keep using it all night.")

get_vader("$2400 for a base model? No thank you")

vscores <- c(0.000, -0.127, 0.241, 0.600, 0.250, 
             0.625, -0.237, 0.877, 0.800, 0.275)

mean(vscores)

vscore = get_vader("Thanks @HomeDepot for this amazing grill!!")

as.numeric(vscore[2])

get_vader("It took me 2 hours to change my country 
          setting in Google Play. What a mess!")
