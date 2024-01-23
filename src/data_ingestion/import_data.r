sayHello <- function() {
   print('hellooooooo')
}

download_file <- function(url, destination) {
   download.file(url, destination)
}

unzip_file <- function(zip_file_path, output_path) {
   unzip(zip_file_path, exdir=output_path)
}