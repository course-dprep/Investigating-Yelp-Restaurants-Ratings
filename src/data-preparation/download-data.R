# This script will be used to populate the \data directory
# with all necessary raw data files.

# Run the installs below if you don't have these R packages yet
# install.packages("googledrive")
# install.packages("tidyverse")

library(googledrive)
library(tidyverse)
library(here)

drive_deauth()

files_to_download <- list(
  list(id = "13AZqPcwUro0jwsZIv6Q3WXeEn58YD5_x", path = here("data", "users.csv")),
  list(id = "1iOHDfm7y57dXkM1FoBZlZB3DbnUBXbYD", path = here("data", "tips.csv"))
)

for (file in files_to_download) {
  drive_download(
    as_id(file$id),
    path = file$path,
    overwrite = TRUE
  )
}
