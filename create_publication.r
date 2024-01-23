source("src/data_ingestion/import_data.r")

# Config params
hes_data_url <- "https://s3.eu-west-2.amazonaws.com/files.digital.nhs.uk/assets/Services/Artificial+data/Artificial+HES+final/"
hes_data_file_name <- "artificial_hes_ae_202302_v1_sample.zip"
download_destination <- "data_in/"


pipeline <- function() {
  sayHello()
  download_file(
    paste(hes_data_url, hes_data_file_name, sep = ""),
    paste(download_destination, hes_data_file_name, sep = "")
  )
  unzip_file(
    paste(download_destination, hes_data_file_name, sep = ""),
    download_destination
  )
}

pipeline()
