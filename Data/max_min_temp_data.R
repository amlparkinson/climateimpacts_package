# Data and documentation
temp = runif(min=35, max=110, n=100)

# Create a data frame
example_temp_df = data.frame(temp)

# run function
max_min_temp(example_temp_df)
