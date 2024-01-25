source("../../../src/data_processing/aggregations.r")
library(dplyr)

test_that("multiplication works", {
    expect_equal(2 * 2, 4)
})

test_that("aggregation works", {
    
    df_test_data <- data.frame(
        test_column = c("A", "B", "C", "D")
    )

    df_expected <- data.frame(
        test_column = c(4)
    )
  
    df_actual = get_distinct_count_of_col(df_test_data, "test_column")

    expect_equal(df_actual, df_expected)
})

