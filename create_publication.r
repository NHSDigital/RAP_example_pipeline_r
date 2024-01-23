# install.packages("dplyr")
library(dplyr)

source("src/data_ingestion/import_data.r")

# Config params
hes_data_url <- "https://s3.eu-west-2.amazonaws.com/files.digital.nhs.uk/assets/Services/Artificial+data/Artificial+HES+final/"
hes_data_file_name <- "artificial_hes_ae_202302_v1_sample.zip"
download_destination <- "data_in/"
downloaded_hes_folder <- "data_in/artificial_hes_ae_202302_v1_sample/"
downloaded_hes_file <- "artificial_hes_ae_2122.csv"
output_path <- "data_out/"

pipeline <- function() {

  download.file(
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

  df_hes_epikey <- select(df_hes, "EPIKEY")
  df_hes_epikey_count <- sapply(df_hes_epikey, function(x) n_distinct(x))

  write.csv(
    df_hes_epikey_count, 
    paste(output_path, "hes_england_episode_count", sep=""),
    row.names = TRUE
  )

  df_hes_epikey_count

}

pipeline()
