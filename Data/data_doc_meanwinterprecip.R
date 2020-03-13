# Mean Winter Precipitation Package
# Data and Documentation

# upload packages
library(tidyverse)
library(devtools)
library(roxygen2)

precip_inches = runif(min=2, max=35, n=100)
ca_city = seq(1, 100, by=1)

precip_totals = data.frame(precip_inches, ca_city)

view(precip_totals)

# Documentation for mean winter precipitation data

#' precip_totals from (package name here)
#'
#' Data from Hannah Garcia-Wickstrum, winter precipitation measurements from 100 California cities
#'
#' @format A data frame with 100 rows and 2 columns
#' \describe{
#' \item{precip_inches}{total precipitation between 2 and 25 inches (in)}
#' \item{ca_city}{California cities numbered 1-100}
#' }
#'
#' @source: Hannah Garcia-Wickstrum, fake climate scientist
#'
