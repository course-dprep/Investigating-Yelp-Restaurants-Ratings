# In this directory, you will keep all source code files relevant for 
# preparing/cleaning your data.

library(dplyr)
library(stringr)
library(tidyverse)
library(here)

#input
Dataset_raw <- read_csv(here("data", "users.csv"))

#data cleaning
dataset_restaurants <- Dataset_raw %>%
  filter(str_detect(categories, regex("\\bRestaurants\\b", ignore_case = TRUE)))
dataset_restaurants <- dataset_restaurants %>% filter(str_detect(attributes, "RestaurantsPriceRange2"))

#output
dir.create("gen/temp", recursive = TRUE, showWarnings = FALSE)
write_csv(dataset_restaurants, "gen/temp/restaurants_attributes_extracted.csv")

