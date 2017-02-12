## find the cumulative percentage of a value for each group of data in dataframe
## for e.g. find the % contribution towards sales from each type of SKU

## - the dataframes are in a list - use lapply to simultaneously compute for all dataframes

## all the dataframes in the list have the same structure and column names

require(dplyr)

df1 = data.frame(groupvar = c('cat', 'cat', 'dog', 'dog'), var = c(2, 3, 6, 7))

df2 = data.frame(groupvar = c('tiger', 'tiger', 'lion', 'lion'), var = c(4, 5, 8, 9))

df_list = list(df1 = df1, df2 = df2)

df_summary_list <- lapply(df_list, function(x) {
  
  sum_by_groupvar <- x %>% group_by(groupvar) %>% summarise(sum_of_var = sum(var, na.rm = TRUE)) %>% mutate(groupvar_total_sales =
  sum(sum_of_var)) %>% mutate(groupvar_perc_sales = sum_of_var /
  groupvar_total_sales)
  
  sum_by_groupvar <- sum_by_groupvar[order(sum_by_groupvar$groupvar_perc_sales,
  decreasing = TRUE), ]
  
  sum_by_groupvar %>% mutate(cum_sales = cumsum(sum_by_groupvar$groupvar_perc_sales))
  
  }
)

print(df_summary_list)