#loading packages
library(tidyverse)
library(here)
library(stargazer)

#Folder making for plot saving:
dir.create(here("gen", "figures"), recursive = TRUE, showWarnings = FALSE)
dir.create(here("gen", "tables"), recursive = TRUE, showWarnings = FALSE)

#Import dataset:
dataset_restaurants <- read_csv(here("data", "restaurants_attributes_extracted.csv"))

#summary statistics:
summary_stats <- tibble(
  variable = c("stars", "delivery_score", "dinein_score"),
  mean = c(
    mean(dataset_restaurants$stars, na.rm = TRUE),
    mean(dataset_restaurants$delivery_score, na.rm = TRUE),
    mean(dataset_restaurants$dinein_score, na.rm = TRUE)
  ),
  sd = c(
    sd(dataset_restaurants$stars, na.rm = TRUE),
    sd(dataset_restaurants$delivery_score, na.rm = TRUE),
    sd(dataset_restaurants$dinein_score, na.rm = TRUE)
  ),
  min = c(
    min(dataset_restaurants$stars, na.rm = TRUE),
    min(dataset_restaurants$delivery_score, na.rm = TRUE),
    min(dataset_restaurants$dinein_score, na.rm = TRUE)
  ),
  max = c(
    max(dataset_restaurants$stars, na.rm = TRUE),
    max(dataset_restaurants$delivery_score, na.rm = TRUE),
    max(dataset_restaurants$dinein_score, na.rm = TRUE)
  )
)

write_csv(summary_stats, here("gen", "tables", "summary_stats.csv"))

#Modellen: 
model_delivery <- lm(stars ~ delivery_score, data = dataset_restaurants)
model_moderation <- lm(stars ~ delivery_score * price_range, data = dataset_restaurants)
model_dinein <- lm(stars ~ dinein_score, data = dataset_restaurants)
model_dinein_mod <- lm(stars ~ dinein_score * price_range, data = dataset_restaurants)

#Regression table saving:
sink(here("gen", "tables", "regression_table.txt"))
stargazer(
  model_delivery,
  model_moderation,
  model_dinein,
  model_dinein_mod,
  type = "text",
  title = "Regression Results",
  dep.var.labels = "Star Rating",
  column.labels = c("Delivery", "Delivery x Price", "Dine-in", "Dine-in x Price"),
  digits = 3
)
sink()

#Figure 1: stars
plot_stars <- ggplot(dataset_restaurants, aes(x = stars)) +
  geom_histogram(binwidth = 0.5, fill = "#A6CEE3", color = "white") +
  labs(
    title = "Distribution of Restaurant Star Ratings",
    x = "Star Rating",
    y = "Number of Restaurants"
  ) +
  theme_minimal()

ggsave(
  here("gen", "figures", "fig1_stars.png"),
  plot_stars,
  width = 7, height = 5
)

#Figure 2: price range
plot_price <- ggplot(dataset_restaurants, aes(x = factor(price_range))) +
  geom_bar(fill = "#A6CEE3") +
  labs(
    title = "Distribution of Restaurant Price Range",
    x = "Price Range",
    y = "Number of Restaurants"
  ) +
  theme_minimal()

ggsave(
  here("gen", "figures", "fig2_price_range.png"),
  plot_price,
  width = 7, height = 5
)

#Figure 3: delivery score
plot_delivery_hist <- ggplot(dataset_restaurants, aes(x = delivery_score)) +
  geom_histogram(binwidth = 1, fill = "#A6CEE3", color = "white") +
  labs(
    title = "Distribution of Delivery Score",
    x = "Delivery Score",
    y = "Number of Restaurants"
  ) +
  theme_minimal()

ggsave(
  here("gen", "figures", "fig3_delivery_hist.png"),
  plot_delivery_hist,
  width = 7, height = 5
)

#Figure 4: dine-in score
plot_dinein_hist <- ggplot(dataset_restaurants, aes(x = dinein_score)) +
  geom_histogram(binwidth = 1, fill = "#A6CEE3", color = "white") +
  labs(
    title = "Distribution of Dine-in Score",
    x = "Dine-in Score",
    y = "Number of Restaurants"
  ) +
  theme_minimal()

ggsave(
  here("gen", "figures", "fig4_dinein_hist.png"),
  plot_dinein_hist,
  width = 7, height = 5
)

#Figure 5: delivery vs stars
plot_delivery_stars <- ggplot(dataset_restaurants, aes(x = delivery_score, y = stars)) +
  geom_point(alpha = 0.2) +
  geom_smooth(method = "lm", color = "black") +
  scale_y_continuous(limits = c(1, 5)) +
  labs(
    title = "Delivery Score and Star Ratings",
    x = "Delivery Score",
    y = "Star Rating"
  ) +
  theme_minimal()

ggsave(
  here("gen", "figures", "fig5_delivery_stars.png"),
  plot_delivery_stars,
  width = 7, height = 5
)

#figure 6: dine-in vs stars
plot_dinein_stars <- ggplot(dataset_restaurants, aes(x = dinein_score, y = stars)) +
  geom_point(alpha = 0.2) +
  geom_smooth(method = "lm", color = "black") +
  scale_y_continuous(limits = c(1, 5)) +
  labs(
    title = "Dine-in Score and Star Ratings",
    x = "Dine-in Score",
    y = "Star Rating"
  ) +
  theme_minimal()

ggsave(
  here("gen", "figures", "fig6_dinein_stars.png"),
  plot_dinein_stars,
  width = 7, height = 5
)

#Figure 7: delivery moderation
plot_delivery_mod <- ggplot(
  dataset_restaurants,
  aes(x = delivery_score, y = stars, color = factor(price_range))
) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_y_continuous(limits = c(1, 5)) +
  labs(
    title = "Delivery Score and Star Ratings by Price Range",
    x = "Delivery Score",
    y = "Star Rating",
    color = "Price Range"
  ) +
  theme_minimal()

ggsave(
  here("gen", "figures", "fig7_delivery_mod.png"),
  plot_delivery_mod,
  width = 7, height = 5
)

#Figure 8: dine-in moderation:
plot_dinein_mod <- ggplot(
  dataset_restaurants,
  aes(x = dinein_score, y = stars, color = factor(price_range))
) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_y_continuous(limits = c(1, 5)) +
  labs(
    title = "Dine-in Score and Star Ratings by Price Range",
    x = "Dine-in Score",
    y = "Star Rating",
    color = "Price Range"
  ) +
  theme_minimal()

ggsave(
  here("gen", "figures", "fig8_dinein_mod.png"),
  plot_dinein_mod,
  width = 7, height = 5
)
