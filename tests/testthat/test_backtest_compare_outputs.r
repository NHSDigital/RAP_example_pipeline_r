source("./backtests/backtest_params.r")

setwd("../../")

for (backtest in bt_params$files_to_compare) {

    actual_path = paste(bt_params$output_base_path, backtest$output_file, sep="")
    expected_path = paste(bt_params$ground_truth_base_path, backtest$ground_truth_file, sep="")
    test_name = paste(backtest$test_name, "matches ground truth")

    if(!file.exists(actual_path)) {
        print('output file does not exist... running pipeline')
    }

    df_actual <- read.csv(actual_path)
    df_expected <- read.csv(expected_path)

    test_that(test_name, {
        expect_equal(df_actual, df_expected)
    })
}