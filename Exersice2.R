#viewing the iris dataset
View(iris)

#loading tidyverse packages
require(tidyverse)

#Keep only the columns:Sepal.Length, Sepal.Width, Petal.Length, and Species.
iris %>%
  select(Sepal.Length, Sepal.Width, Petal.Length, Species)
  
#Filter:  Keep only rows where Sepal.Length > 5.
iris %>%
  filter(Sepal.Length > 5)

#Create New Columns: ratio = Sepal.Length / Sepal.Width (rounded to 2 decimals) and long_sepal = Sepal.Length > 6
iris %>%
  mutate(ratio = (round(Sepal.Length / Sepal.Width, digits = 2)), long_sepal = Sepal.Length > 6)

#Categorize Petal Length: Create a new column petal_class using: Condition	Class Petal.Length < 3	“Short” Petal.Length 3–5	“Medium” Petal.Length > 5	“Long”
iris %>%
  mutate(petal_class = case_when(Petal.Length <3 ~ "short",
                                 Petal.Length >= 3 & Petal.Length <= 5 ~ "medium",
                                 Petal.Length > 5 ~ "long"))

#Summarize by Species- Calculate:  Average Sepal Length, Average Petal Length, Number of flowers per species
iris %>%
  group_by(Species) %>%
  summarise(Average_Sepal_Length = mean(Sepal.Length),
            Average_Petal_Length = mean(Petal.Length),
            Number_of_flowers = n())
