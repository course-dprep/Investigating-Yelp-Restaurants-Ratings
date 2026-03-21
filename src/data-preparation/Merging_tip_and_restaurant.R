#Merging Tip complement counts with cleaned restaurant dataset

library(data.table)
library(here)
library(readr)

dir.create(here("gen", "temp"), recursive = TRUE, showWarnings = FALSE)

dataset_restaurants <- read_csv(here("data", "restaurants_clean.csv"))
tips <- read_csv(here("data", "tips.csv"))

setDT(dataset_restaurants)
setDT(tips)

dataset_restaurants[, business_id := as.character(business_id)]
tips[, business_id := as.character(business_id)]

tips_agg <- tips[, .(
  tip_compliment_count = sum(compliment_count, na.rm = TRUE)
), by = business_id]

restaurants_merged <- merge(
  dataset_restaurants,
  tips_agg,
  by = "business_id",
  all.x = TRUE)


restaurants_merged[is.na(tip_compliment_count), tip_compliment_count := 0]
fwrite(restaurants_merged, here("data", "restaurants_merged.csv"))
#Summary statistics of compliment counts

summary(restaurants_merged$tip_compliment_count)

nrow(dataset_restaurants)
nrow(restaurants_merged)




