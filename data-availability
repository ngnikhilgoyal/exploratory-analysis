# check availability of data for each column of a dataframe
# dataframes are in a list. check all simultaneously
# names of the items in the list will finally become an additional column called categorical_var_name

# create some data to test code below
df1 = data.frame(var1 = c('cat', 'cat', 'dog', 'dog'), var2 = c(2, 3, 6, 7))

df2 = data.frame(var1 = c('tiger', 'tiger', 'lion', 'lion'), var2 = c(4, 5, 8, 9))

df_list = list(df1 = df1, df2 = df2)

## The expected result from the program below is a dataframe with three columns - df_name, var1, var2 . The values in the dataframe will indicate the percentage of values which are either 0 or NA. In this case, there are no 0s or NA, so the result will have only 0s.


# count the occurences where column value is either 0 or NA. If either does not have to be counted as unavailable, remove from the which condition. 
count_values <-  lapply(df_list, function(x) lapply(x, function(x) length(which(x == 0 | is.na(x))) / length(x)))

# make a dataframe of the list of unavailble data from above
summarize_col <- as.data.frame(do.call("rbind", count_values))

# join with name of dataframes in the list to create a long table. 
summarize_col_df <- cbind(data.frame(df_name = row.names(summarize_col)), as.data.frame(sapply(summarize_col, function(x) as.numeric(x))))

remove(summarize_col)