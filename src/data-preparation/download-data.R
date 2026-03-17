# This script will be used to populate the \data directory
# with all necessary raw data files.

# Run the installs below if you don't have these R packages yet
# install.packages("googledrive")
# install.packages("tidyverse")

library(googledrive)
library(tidyverse)

# Deauthorize to avoid login prompts
drive_deauth()

# List of files to download: each element is a named list with id and target path
files_to_download <- list(
  list(id = "13AZqPcwUro0jwsZIv6Q3WXeEn58YD5_x", path = "data/users.csv"),
  list(id = "1iOHDfm7y57dXkM1FoBZlZB3DbnUBXbYD", path = "data/tips.csv")
)

# Loop over each file and download
for (file in files_to_download) {
  drive_download(
    as_id(file$id),
    path = file$path,
    overwrite = TRUE
  )
}