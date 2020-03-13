# Mean Winter Precipitation Function
# Function 1 for assignment #3

# Create function for mean winter precipitation below

library(devtools)
library(roxygen2)

#' Mean Winter Precipitation
#'
#' This function computes the mean winter precipitation
#' @param sum_winter_precip is the total winter precipitation (in inches)
#' @param no_of_samples is the number of locations where precipitation was recorded
#' @author Anne-Marie and Hannah
#' @examples meanwinterprecip(225, 25)
#' @return mean precipitation (inches)

meanwinterprecip = function(sum_winter_precip, no_of_samples) {
  # set parameters
  if (sum_winter_precip < 0) return("sum_winter_precip cannot be less than zero")
  if (no_of_samples < 0) return("no_of_samples cannot be less than zero")

  # equation
  result = (sum_winter_precip/no_of_samples)

  return(result)
}

# Mean Winter Precipitation Package
# Data and Documentation

# upload packages
library(tidyverse)

precip_inches = runif(min=2, max=35, n=100)
ca_city = seq(1, 100, by=1)

precip_totals = data.frame(precip_inches, ca_city)

view(precip_totals)

# Documentation for mean winter precipitation data

#' precip_totals from (package name here)
#'
#' Data from Anne-Marie Parkinson & Hannah Garcia-Wickstrum, winter precipitation measurements from 100 California cities
#'
#' @format A data frame with 100 rows and 2 columns
#' \describe{
#' \item{precip_inches}{total precipitation between 2 and 25 inches (in)}
#' \item{ca_city}{California cities numbered 1-100}
#' }
#'
#' @source: Anne-Marie Parkinson & Hannah Garcia-Wickstrum, fake climate scientists
#'
