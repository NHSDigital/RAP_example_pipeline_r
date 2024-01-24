# install.packages("dplyr")
# install.packages("docstring")
# install.packages("packrat")
# install.packages("rstudioapi")
# packrat::restore()
# 

library(docstring)
library(dplyr)

source("src/data_ingestion/import_data.r")

docstring(download_file_if_not_exists)

# Config params
hes_data_url <- "https://s3.eu-west-2.amazonaws.com/files.digital.nhs.uk/assets/Services/Artificial+data/Artificial+HES+final/"
hes_data_file_name <- "artificial_hes_ae_202302_v1_sample.zip"
download_destination <- "data_in/"
downloaded_hes_folder <- "data_in/artificial_hes_ae_202302_v1_sample/"
downloaded_hes_file <- "artificial_hes_ae_2122.csv"
output_path <- "data_out/"

pipeline <- function() {

  download_file_if_not_exists(
    paste(hes_data_url, hes_data_file_name, sep = ""),
    paste(download_destination, hes_data_file_name, sep = "")
  )
  unzip(
    paste(download_destination, hes_data_file_name, sep = ""),
    exdir = download_destination
  )
  df_hes <- read.csv(
    paste(downloaded_hes_folder, downloaded_hes_file, sep = "")
  )

  hes_england_episode_count <- df_hes %>% summarise(EPIKEY = n_distinct(EPIKEY))

  write.csv(
    hes_england_episode_count,
    file = paste(output_path, "hes_england_episode_count", sep = ""),
    row.names = FALSE,
    quote = FALSE
  )

}

pipeline()
