# Mean Winter Precipitation Function
# Function 1 for assignment #3

# Create function for mean winter precipitation below

library(devtools)
library(roxygen2)

meanwinterprecip = function(df) {

    total_precip = sum(df[,1])
    average_precip = (total_precip/length(df[,1]))

    # equation
    return(average_precip)
  }

# upload packages
library(tidyverse)

precip_inches = runif(min=2, max=35, n=100)
ca_city = seq(1, 100, by=1)

precip_totals = data.frame(precip_inches, ca_city)


meanwinterprecip(precip_totals)

# Mean Winter Precipitation Package
# Data and Documentation



# Documentation for mean winter precipitation data

#' Mean Winter Precipitation
#'
#' This function calculates mean winter precipitation. Data from Anne-Marie Parkinson & Hannah Garcia-Wickstrum, winter precipitation measurements from 100 California cities
#'
#' @format A data frame with 100 rows and 2 columns
#' \describe{
#' \item{total_precip}{total precipitation between 2 and 35 inches (in)}
#' \item{ca_city}{California cities numbered 1-100}
#' }
#'
#' @authors Anne-Marie Parkinson & Hannah Garcia-Wickstrum, fake climate scientists
#' @return mean winter precipitation (cm)
