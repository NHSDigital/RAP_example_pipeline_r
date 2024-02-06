library(dplyr)

setwd("../../src/data_processing/")
source("aggregations.r")

test_that("aggregation works", {
    
    df_test_data <- data.frame(
        test_column = c("A", "B", "C", "D", "D")
    )

    df_expected <- data.frame(
        test_column = c(4)
    )
  
    df_actual = get_distinct_count_of_col(df_test_data, "test_column")

    expect_equal(df_actual, df_expected)
})

