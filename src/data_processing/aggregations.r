get_distinct_count_of_col <- function(df_input, col_name) {
    #' @title function get_distinct_count_of_col
    #' 
    #' @description Returns the distint count of a single column
    #' in a dataframe.
    #' 
    #' @param df_input dataframe: The dataframe containing the column you want to count
    #' @param col_name string: The name of the column you want to count
    #' 
    #' @section Returns: dataframe: df with one column and one row containing the distinct count
    
    new_column <- enquo(col_name)

    df_aggregated <- df_input %>% summarise({{col_name}} := n_distinct(df_input[[col_name]]))
    return(df_aggregated)
}
