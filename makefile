all: reporting/Merging_tip_and_restaurant.html reporting/Analysis.html

reporting/Merging_tip_and_restaurant.html: src/data-preparation/Merging_tip_and_restaurant.Rmd data/restaurants_attributes_extracted.csv data/tips.csv
	Rscript -e "rmarkdown::render('src/data-preparation/Merging_tip_and_restaurant.Rmd', knit_root_dir = '.', output_file='Merging_tip_and_restaurant.html', output_dir='reporting')"

reporting/Analysis.html: src/analysis/Analysis.Rmd data/restaurants_attributes_extracted.csv
	Rscript -e "rmarkdown::render('src/analysis/Analysis.Rmd', knit_root_dir = '.', output_file='Analysis.html', output_dir='reporting')"
	
data/restaurants_attributes_extracted.csv: src/data-preparation/Extracting_Attributes.R data/restaurants_clean.csv
	Rscript src/data-preparation/Extracting_Attributes.R

data/restaurants_clean.csv: src/data-preparation/data-cleaning.R data/users.csv
	Rscript src/data-preparation/data-cleaning.R

data/users.csv data/tips.csv: data/download-data.R
	Rscript data/download-data.R