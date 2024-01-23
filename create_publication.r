source("src/data_ingestion/import_data.r")

# Config params
hes_data_url <- "https://s3.eu-west-2.amazonaws.com/files.digital.nhs.uk/assets/Services/Artificial+data/Artificial+HES+final/artificial_hes_ae_202302_v1_sample.zip"
download_destination <- "data_in/artificial_hes_ae_202302_v1_sample.zip"
  


pipeline <- function() {
    sayHello()
    download_file(hes_data_url, download_destination)
}

pipeline()

