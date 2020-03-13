#' Index to assess risk of home loss in the event of a wildfire
#'
#' Scientists predict more frequent and more severe wildifre events in the event of climate chage. However, many areas
#' are increasing in population size which results in developers and cities building into the Wildland Urban Interface (WUI)
#' which has higher occruances of wildlifre events. Parameters include both weather variables, fire characteristics,
#' and characteristics of a home.
#'
#' @param defensible_space = is the area around a home or other structure that has been modified to reduce fire hazard. Options are between 0 to +100ft.
#' @param fire_proofing_degree = amount of fire proofing done by a household to prevent things like embers from entering the home or reduce flamability of the house.
#' values ranked from 0 (none) to 5 (very high).
#' @param temp = temperature (degrees F)
#' @param humidity = humidity (%)
#' @param wind_speed = wind speed (mph)
#' @author Hannah Garcia-Wickstrum and Anne-Marie Parkinson
#' @examples home_risk_index(data_frame)
#' @return Score (low (1) to high (5)) of a home is being damaged by wildfire during a wildfire event.



# function
home_risk_index = function(index_data) {



  # assign variable values
  defensible_space_score = ifelse(index_data$defensible_space == 0, 5,
                                  ifelse(index_data$defensible_space < 30, 3,
                                         ifelse(index_data$defensible_space < 99, 2,
                                                ifelse(index_data$defensible_space >= 100, 2))))

  fire_proofing_score = ifelse(index_data$fire_proofing_degree == 0, 5,
                               ifelse(index_data$fire_proofing_degree == 1, 4,
                                      ifelse(index_data$fire_proofing_degree == 2, 3,
                                             ifelse(index_data$fire_proofing_degree == 3, 3,
                                                    ifelse(index_data$fire_proofing_degree == 4, 2,
                                                           ifelse(index_data$fire_proofing_degree == 5, 1))))))

  temperature_score = ifelse(index_data$temp < 50, 1,
                             ifelse(index_data$temp < 60, 2,
                                    ifelse(index_data$temp < 70, 3,
                                           ifelse(index_data$temp < 80, 4,
                                                  ifelse(index_data$temp >= 80, 5)))))

  humidity_score = ifelse(index_data$humidity < 10, 5,
                          ifelse(index_data$humidity < 25, 4,
                                 ifelse(index_data$humidity < 50, 3,
                                        ifelse(index_data$humidity < 60, 2,
                                                ifelse(index_data$humidity < 100, 1)))))

  wind_speed_score = ifelse(index_data$wind_speed < 5, 1,
                            ifelse(index_data$wind_speed < 10, 2,
                                   ifelse(index_data$wind_speed < 20, 3,
                                          ifelse(index_data$wind_speed < 40, 4,
                                                 ifelse(index_data$wind_speed < 150, 5)))))

  # determine vulnerability score
  vulnerability_score = (defensible_space_score + fire_proofing_score + temperature_score +
                           humidity_score + wind_speed_score)/5

  # qualitative vulnerability score
  vulnerability_assessment = ifelse(vulnerability_score <= 1, "very Low",
                                    ifelse(vulnerability_score <= 2, "Low",
                                           ifelse(vulnerability_score <= 3, "Moderate",
                                                  ifelse(vulnerability_score <=4, "High",
                                                         ifelse(vulnerability_score <= 5, "Extreme")))))

  vulnerability_assessment = as.data.frame(vulnerability_assessment)

  # combine score to entered data frame
  vulnerability_assessment_df = merge(index_data, vulnerability_assessment)


  return(vulnerability_assessment_df)

}

# test function
home_risk_index(mock_home_fire_data)


# issues:
#function works when data frame has 1 row, error when there are more than 1 rows: Error in ifelse(index_data$fire_proofing_degree == 5, 1) : argument "no" is missing, with no default (dont get this error with one row)
#issue when try to document: Error in runif(min = 0, max = 150, n = 2) : could not find function "runif" --> idk why this matters. i just want documentation just for the function not the data for now
