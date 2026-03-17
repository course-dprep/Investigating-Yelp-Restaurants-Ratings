# In this directory, you will keep all source code files relevant for 
# preparing/cleaning your data.

library(dplyr)
library(stringr)
library(tidyverse)

#input
Dataset_raw <- read_csv("data/users.csv")

#data cleaning
dataset_restaurants <- Dataset_raw %>%
  filter(str_detect(categories, regex("\\bRestaurants\\b", ignore_case = TRUE)))
dataset_restaurants <- dataset_restaurants %>% filter(str_detect(attributes, "RestaurantsPriceRange2"))

#output
write_csv(dataset_restaurants, "data/restaurants_clean.csv")

