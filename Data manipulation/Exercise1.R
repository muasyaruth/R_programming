#view mtcars dataset
view(mtcars)

require(tidyverse)

# Select only the columns:mpg, cyl, hp
mtcars %>% 
  
  select(mpg, cyl, hp) %>%
  
  # Filter cars where mpg > 20 and cyl == 4
  filter(mpg > 20, cyl == 4) %>%
  
  # Add two new variables: hp_per_cyl = hp / cyl (rounded to 1 decimal) and efficient = mpg > 25
  mutate(hp_per_cyl  = round(hp / cyl, digits = 1) , efficient = mpg > 25) %>% 
  
  #Sort the data by:  cyl ascending and mpg descending
  arrange(cyl, -mpg) %>%
  
  
  #Group by cyl and compute:Average mpg Average hp Number of cars
  group_by(cyl) %>%
  summarise(Average_mpg = mean(mpg), Average_hp = mean(hp), No_of_cars= n())

mtcars %>%
  
  #Create:"Low" if hp < 100 "Medium" if hp 100–150 "High" if hp > 150
  mutate(
    performance_class = case_when(
      hp<100 ~ "low",
      hp >= 100 & hp <= 150 ~ "medium",
      hp> 150 ~ "high" ))  

#Using one pipeline:Filter mpg > 20, Add hp_per_cyl, Select car, mpg, hp_per_cyl,Sort by hp_per_cyl descending
mtcars %>%
  filter(mpg > 20) %>%
  mutate(hp_per_cyl = hp/cyl) %>%
  select(mpg, hp_per_cyl) %>%
  arrange(-hp_per_cyl)
  
  

  
  

