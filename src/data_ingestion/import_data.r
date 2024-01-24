sayHello <- function() {
  print('hellooooooo')
}

download_file_if_not_exists <- function(url, destination) {
  #' @title function download_file_if_not_exists
  #' 
  #' @description Downloads a file from a specified URL to a
  #' specified local path. Checks if the file already exists
  #' and does nothing if so
  #' 
  #' @param url The URL of the file to be downloaded.
  #' Must include the file name e.g. http://example.com/data.csv
  #' @param destination The local path and file name where the
  #' file will be downloaded to e.g., data_in/data.csv
  #' 
  #' @return Nothing

  if (!file.exists(destination)) {
    download.file(url, destination)
  } else {
    print( paste("file", destination, "already exists") )
  }
}

unzip_file <- function(zip_file_path, output_path) {
   unzip(zip_file_path, exdir=output_path)
}