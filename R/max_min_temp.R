# Maximum and Minimum Temperatures
# Function #2 for Assignment #3

# create function that finds the maximum and minimum temperatures from a lsit

# uplaod packages
library(devtools)
library(roxygen2)
library(tidyverse)

#' Maximum and Minimum Temperatures
#'
#' This function returns the maximum and minimum temperatures from a list
#' @param df refers to the data frame which has a list of temperatures
#' @author Anne-Marie and Hannah
#' @examples max_min_temp(ex_df)
#' @return maximum and minimum temperatures

max_min_temp = function(df) {
  # parameters
  mintemp = apply(df, 2, min)
  maxtemp = apply(df, 2, max)
  return(list(min=  mintemp, max = maxtemp))
}


# Documentation for maximum and minimum temperature data

#' example_temp_df from (package name here)
#'
#' Data from Anne-Marie Parkinson & Hannah Garcia-Wickstrum, list of 100 temperatures
#'
#' @format A data frame with 100 rows and 1 column
#' \describe{
#' \item{temp}{recorded temperature between 35 and 110 degrees F}
#' }
#'
#' @source: Anne-Marie Parkinson & Hannah Garcia-Wickstrum, fake climate scientists
#'
