library(testthat)

dir_list <- list.dirs("tests/testthat",recursive = TRUE)

for (dir in dir_list[-1]) {
  test_dir(dir)
  cat('\n\n')
}