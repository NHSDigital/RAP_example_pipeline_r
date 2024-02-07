bt_params <- list(
    output_base_path = "./data_out/",
    ground_truth_base_path = "./tests/testthat/backtests/ground_truth/",

    files_to_compare = list(
        list(
            test_name = "england episode count",
            output_file = "hes_england_episode_count.csv",
            ground_truth_file = "hes_england_episode_count.csv"
        )
    )
)