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
This project uses two datasets that are downloaded through Google Drive. The datasets are part of a bigger collection of data produced by Yelp in 2025. All the datasets can be found on https://drive.google.com/drive/folders/1WHSh8ZQYzQ3IQI8tJX90cYGR4bDy13v3. The two datasets used for this project specifically are called yelp_academic_dataset_user.csv & yelp_academic_dataset_tip.csv. All data in this project will load programmatically by just running the project and should not require any manual input.
After running make the final dataset "restaurants_attributes_extracted.csv" will be in the data folder, this dataset contains 44484 observations. 

Below is a table of all of the important variables used in the project that are part of the final dataset, including their operationalisation and role in the project.
| Variable                 | Description                                   | Operationalisation                                         | Role               |
| ------------------------ | --------------------------------------------- | ---------------------------------------------------------- | ------------------ |
| stars                    | Average Yelp rating of the restaurant         | Numeric value from 1–5 based on Yelp reviews               | Dependent variable |
| RestaurantsDelivery      | Whether the restaurant offers delivery        | Binary variable (1 = delivery available, 0 = no delivery)  | Delivery cluster   |
| RestaurantsTakeOut       | Whether takeout is available                  | Binary variable (1 = takeout available, 0 = not available) | Delivery cluster   |
| Caters                   | Whether catering services are offered         | Binary variable (1 = yes, 0 = no)                          | Delivery cluster   |
| DriveThru                | Presence of drive-through service             | Binary variable (1 = yes, 0 = no)                          | Delivery cluster   |
| RestaurantsReservations  | Whether reservations are accepted             | Binary variable (1 = yes, 0 = no)                          | Dine-in cluster    |
| RestaurantsGoodForGroups | Whether the restaurant is suitable for groups | Binary variable (1 = yes, 0 = no)                          | Dine-in cluster    |
| Alcohol                  | Whether alcohol is served                     | Categorical variable indicating alcohol availability       | Dine-in cluster    |
| HappyHour                | Whether the restaurant offers happy hour      | Binary variable (1 = yes, 0 = no)                          | Dine-in cluster    |
| OutdoorSeating           | Whether outdoor seating is available          | Binary variable (1 = yes, 0 = no)                          | Dine-in cluster    |
| GoodForKids              | Whether the restaurant is suitable for kids   | Binary variable (1 = yes, 0 = no)                          | Dine-in cluster    |
| RestaurantTableService   | Whether table service is offered              | Binary variable (1 = yes, 0 = no)                          | Dine-in cluster    |
| price_range              | Restaurant price category                     | Ordinal scale representing price levels (1 $ <–> 4 $$$$)   | Moderator          |


## Method

We will use multiple linear regression (multilinear regression) with the restaurant’s star rating as the dependent variable. Our key predictors represent two attribute clusters: 
-   **Delivery/Takeout cluster** (e.g., RestaurantsDelivery, RestaurantsTakeOut, DriveThru, Caters)
-   **Dine-in experience cluster** (e.g., RestaurantsReservations, RestaurantTableService, OutdoorSeating, GoodForGroups, GoodForKids, Alcohol, HappyHour)
We included price range as a moderator using interaction terms to see if the association between service characteristics and ratings changed with price range. 

The most effective method for our investigation is multiple linear regression since it permits us to estimate the independent effects of multiple restaurant features all at once. This is particularly relevant in our situation since we want to separate the distinctive relationships between delivery and dine-in characteristics and star ratings rather than analyze them separately, even though they might be correlated. Regression helps us separate overlapping factors and estimate the distinctive relationship between each attribute cluster with ratings while holding other features constant. The regression framework's ability to let us test our moderator idea directly is one of its main benefits. We may assess whether the significance of these service selections differs across price ranges by adding interaction terms between the price range and the delivery/dine-in variables. Our research question, which specifically questions whether the impact of service characteristics varies based on price level, is directly addressed by this approach.

## Preview of Findings

This project is expected to provide insights into how delivery-related options and dine-in experiences are associated with Yelp restaurant ratings, and whether these relationships differ across price levels. More specifically, the analysis examines whether attributes such as delivery, takeout, reservations, outdoor seating, table service and other restaurant features are systematically related to star ratings. The project focuses on identifying associaions between restaurant characteristics and Yelp ratings rather than making causal claims. The final project will be a reproducible analytical report created in R Markdown and exported to PDF, with the full workflow integrated into the GitHub repository. This allows the analysis to be reproduced from data preparation to the final reporting stage.

## Relevance of these findings

The findings of the project are relevant because they contribute to a better understanding of which restaurant characteristics are linked to customer evaluations on Yelp. Such insights may be useful for interpreting patterns in online ratings and for identifying service features that appear to matter more strongly across different price segments. These findings may also be relevant for restaurant owners and managers who want to better understand which service-related features are associated with more favorable customer ratings on online platforms. In addition, the project’s reproducible workflow is itself an important outcome, as it supports transparency, replicability, and future collaboration by allowing others to trace, verify, and rerun the complete analysis. 


## Repository Overview
```
Investigating-Yelp-Restaurants-Ratings
│
├── data/
│     ├── download-data.R
├── src/
│ ├── data-preparation/
│ │ ├── data-cleaning.R
│ │ ├── Extracting_Attributes.R
│ │ └── Merging_tip_and_restaurant.R
│ │
│ └── analysis/
│     └── Analysis.R
│
├── reporting/
│
├── Makefile
├── README.md
└── .gitignore
```
## Dependencies

Please follow the installation guides on [Tilburg Science Hub](http://tilburgsciencehub.com/).

- R. [Installation guide.](https://www.tilburgsciencehub.com/topics/Computer-Setup/software-installation/RStudio/r/)
- Make. [Installation guide.](https://www.tilburgsciencehub.com/topics/Automation/automation-tools/Makefiles/make/)
- To knit RMarkdown documents, make sure you have installed Pandoc using the [installation guide](https://pandoc.org/installing.html) on their website.

For R, make sure you have installed the following packages:

```r
install.packages("tidyverse")
install.packages("dplyr")
install.packages("stringr")
install.packages("readr")
install.packages("ggplot2")
install.packages("data.table")
install.packages("googledrive")
install.packages("here")
install.packages("stargazer")
```
## Running Instructions

1. Open a terminal in the project directory.
   
2. Clone the repository:
```
git clone https://github.com/course-dprep/Investigating-Yelp-Restaurants-Ratings.git
cd Investigating-Yelp-Restaurants-Ratings
```
3. Run the pipeline:
```
make
```
   This command will automatically:
    - download the raw datasets
    - clean and prepare the data
    - merge the datasets
    - generate the final analysis reports

4. View the results

The generated reports can be found in the reporting/ directory:
- reporting/Merging_tip_and_restaurant.html
- reporting/Analysis.html

## Members

Team 3,
* Maud Dreuning, e-mail: m.dreuning@tilburguniversity.edu
* Sophie Leijten, e-mail: s.r.leijten@tilburguniversity.edu
* Simona Hu, e-mail: s.hu_2@tilburguniversity.edu
