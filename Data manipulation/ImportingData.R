my_data <- read.csv("weather_data.csv")

#view data
head(my_data)
tail(my_data)
View(my_data)

#extracting specific components of my data
my_data [2,2]
my_data $ precipitation

# using built in dataset

# installing packages
install.packages("tidyverse")
require(tidyverse)
data()
view(my_data)
my_data %>% 
  mutate(newTP=0)



