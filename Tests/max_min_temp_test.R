## tests for max_min_temp function

## load library
library(testthat)

## test
test_that('max_min_temp_works',

         {# make sure the calculated minimum temp is always less than the max temp
          expect_true(max_min_temp(example_temp_df)$min < max_min_temp(example_temp_df)$max)

          #make sure the values in the data are class double
          expect_type(example_temp_df$temp, "double")

          # make mock data to test function (trials bc they aint workin)
          mock_data = data.frame(mock_temp = c(23, 44, 55, 62, 79, 89))

          #use mock data to test function
          expect_equal(unname(max_min_temp(mock_data)$max), 89) # should work
          expect_equal(unname(max_min_temp(mock_data)$max), 44) # should produce an error
          expect_equal(unname(max_min_temp(mock_data)$min), 23) # should work
          expect_equal(unname(max_min_temp(mock_data)$min), 44) # should produce an error

          })

# use unname to remove the names/dimnames. Needed it for this code because the function needs a data frame
# while expect_equal needs a vector. So unname allows me to run the correct data format through the function and the test



