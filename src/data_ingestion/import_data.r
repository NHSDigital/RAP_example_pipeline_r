sayHello <- function() {
  print('hellooooooo')
}

download_file_if_not_exists <- function(url, destination) {
  if (!file.exists(destination)) {
    download.file(url, destination)
  } else {
    print( paste("file", destination, "already exists") )
  }
}

unzip_file <- function(zip_file_path, output_path) {
   unzip(zip_file_path, exdir=output_path)
}