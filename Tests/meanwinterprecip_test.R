## Testing for meanwinterprecip function

# upload packages
library(devtools)
library(testthat)
library(tidyverse)

load_all()

# create an example data frame
precip = runif(min=2, max=40, n=50)
example_precip_df <- as.data.frame(precip)

# Call in function
meanwinterprecip(example_precip_df)

# 1. Test the function with test_that & expect_equal

test_that("meanwinterprecip_works", {

  #make sure the calculated total_precip is always more than the length
  expect_true(meanwinterprecip(example_precip_df) > 0) # I think this works


  #make sure the values in the data are class numeric
  expect_type(example_precip_df$precip, "double") # I think this works too.

  #use mock data to make sure function works
  mock_data=data.frame(mock_precip = c(15, 25, 8, 33, 16))
  mock_data_2=data.frame(mock_precip = c(20, 15, 12, 5, 1))

  #use mock data to test function
  expect_equal(unname(meanwinterprecip(mock_data)), 19.4) # should work
  expect_equal(unname(meanwinterprecip(mock_data)), 24) # should produce an error
  expect_equal(unname(meanwinterprecip(mock_data_2)), 10.6) # should work
  expect_equal(unname(meanwinterprecip(mock_data_2)), 12) # should produce an error
})

