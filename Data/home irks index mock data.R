# packages ----------------------------------

library(tidyverse)

# mock data -----------------------------------

defensible_space = runif(min = 0, max = 150, n = 2)
fire_proofing_degree = sample(x=1:5, size = 2, replace = T)
temp = runif(min = 40, max = 105, n = 2)
humidity = runif(min = 0, max =100, n =2)
wind_speed = runif(min = 0, max = 150, n = 2)
home = seq(1, 2, by=1)

# combine mock data into a data frame
mock_home_fire_data = data.frame(defensible_space, fire_proofing_degree, temp, humidity, wind_speed, home) %>%
  mutate(fire_proofing_degree = as.factor(fire_proofing_degree))

