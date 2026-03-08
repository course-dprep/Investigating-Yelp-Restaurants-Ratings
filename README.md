[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/-5U7Jn2O) \> **Important:** This is a template repository to help you set up your team project.\
\>\
\> You are free to modify it based on your needs. For example, if your data is downloaded using *multiple* scripts instead of a single one (as shown in `\data\`), structure the code accordingly. The same applies to all other starter files—adapt or remove them as needed.\
\>\

# Impact of 'delivery options' and 'dine-in options' on Yelp restaurant ratings

This research employs an automated front-end process to acquire insights into the effects of 'delivery options' and 'dine-in options' on Yelp restaurant evaluations, which are regulated by price level. Using multilinear regression, this study seeks to find relationships between specific restaurant features and clusters of variables on overall rating. This way, we hope to gain insight into what traits are most important to these businesses.

## Motivation

Online reviews have a big influence on dining decisions, and Yelp ratings are one of the most visible indicators of restaurant quality. Restaurants vary greatly in what they provide, some give put more emphasis on convenient delivery or takeaway, while others make investments in the dine-in experience (for example, table service, outdoor sitting, suitable for groups). Our objective is to determine whether these service options are linked to higher or lower star ratings and whether the relationship varies depending on the range of prices. 

Price can influence customer expectations. Customers paying higher prices for a meal may evaluate service quality, atmosphere, and dining experience more critically, whereas lower-priced restaurants may be assessed differently, more strongly on efficiency and accessibility. As a result, the relationship between service qualities and ratings may be moderated by price level. We aim to gain a better understanding of which practical traits are most closely linked to online reviews by examining these relationships. 

These findings may not only be relevant for restaurant managers who are seeking to improve their online reputation, but also for understanding how operational decisions translate into digital evaluations across different price ranges.

**Research Question:**

What effects do delivery options and dine-in experience have on the star rating of a restaurant, and how does the price range of the restaurant moderate these relationships?

**Clusters:**

Delivery/takeout –\> RestaurantsDelivery, RestaurantsTakeOut, Caters, DriveThru

Dine in experience –\> RestaurantsReservations, RestaurantsGoodForGroups, Alcohol, HappyHour, OutdoorSeating, GoodForKids, RestaurantTableService

## Data

-   What dataset(s) did you use? How was it obtained?
-   How many observations are there in the final dataset?
-   Include a table of variable description/operstionalisation.

## Method

We will use multiple linear regression (multilinear regression) with the restaurant’s star rating as the dependent variable. Our key predictors represent two attribute clusters: 
-   **Delivery/Takeout cluster** (e.g., RestaurantsDelivery, RestaurantsTakeOut, DriveThru, Caters)
-   **Dine-in experience cluster** (e.g., RestaurantsReservations, RestaurantTableService, OutdoorSeating, GoodForGroups, GoodForKids, Alcohol, HappyHour)
We included price range as a moderator using interaction terms to see if the association between service characteristics and ratings changed with price range. 

The most effective method for our investigation is multiple linear regression since it permits us to estimate the independent effects of multiple restaurant features all at once. This is particularly relevant in our situation since we want to separate the distinctive relationships between delivery and dine-in characteristics and star ratings rather than analyze them separately, even though they might be correlated. Regression helps us separate overlapping factors and estimate the distinctive relationship between each attribute cluster with ratings while holding other features constant. The regression framework's ability to let us test our moderator idea directly is one of its main benefits. We may assess whether the significance of these service selections differs across price ranges by adding interaction terms between the price range and the delivery/dine-in variables. Our research question, which specifically questions whether the impact of service characteristics varies based on price level, is directly addressed by this approach.

## Preview of Findings

This project is expected to provide insights into how delivery-related options and dine-in experience are associated with Yelp restaurants ratings, and whether these relationships differ across price levels. More specifically, the analysis examines whether attributes such as delivery, takeout, reservations, outdoor seating, table service and other restaurant features are systematically related to star ratings. The final product of the project will be a reproducible analytical report created in RMarkdown and exported to PDF, with the full workflow integrated into the GitHub repository. This allows the analysis to be reproduced from data preparation to the final reporting stage.

Relevance of these findings

The findings of the project are relevant because they contribute to a better understanding of which restaurant characteristics are linked to customer evaluations on Yelp. Such insights may be useful for interpreting patterns in online ratings and for identifying service features that appear to matter more strongly across different price segments. In addition, the project’s reproducible workflow is itself an important outcome, as it supports transparency, replicability, and future collaboration by allowing others to trace, verify and rerun the complete analysis. 


## Repository Overview

\*\*Include a tree diagram that illustrates the repository structure\*

## Dependencies

*Explain any tools or packages that need to be installed to run this workflow.*

## Running Instructions

*Provide step-by-step instructions that have to be followed to run this workflow.*

## About

This project is set up as part of the Master's course [Data Preparation & Workflow Management](https://dprep.hannesdatta.com/) at the [Department of Marketing](https://www.tilburguniversity.edu/about/schools/economics-and-management/organization/departments/marketing), [Tilburg University](https://www.tilburguniversity.edu/), the Netherlands.

The project is implemented by team \< x \> members: \< insert member details\>
