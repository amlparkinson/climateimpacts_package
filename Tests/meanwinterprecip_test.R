## Testing for meanwinterprecip function

# upload packages
library(devtools)
library(testthat)

load_all()

# 1. Test the function with test_that & expect_equal

test_that("meanwinterprecip_works", {

  #make sure the calculated total_precip is always more than the length
  expect_true(meanwinterprecip(example_precip_df)$precip_total > meanwinterprecip(example_precip_df)$length) #not sure how to do this part for meanwinterprecip?

  #make sure the values in the data are class double
  expect_type(example_precip_df$precip, "double") # also unsure of this part..

  #use mock data to make sure function works
  mock_data=data.frame(mock_precip = c(15, 25, 8, 33, 16))
  mock_data_2=data.frame(mock_precip = c(20, 15, 12, 5, 1))

  #use mock data to test function
  expect_equal(unname(meanwinterprecip(mock_data)), 19.4) # should work
  expect_equal(unname(meanwinterprecip(mock_data)), 24) # should produce an error
  expect_equal(unname(meanwinterprecip(mock_data_2)), 10.6) # should work
  expect_equal(unname(meanwinterprecip(mock_data_2)), 12) # should produce an error
})

