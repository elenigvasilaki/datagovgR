#' @importFrom attempt stop_if_not
#' @importFrom curl has_internet
check_internet <- function(){
    stop_if_not(.x = has_internet(), msg = "Please check your internet connexion")
}


#' Setting User Agent
#'
#' The user agent to include with the call to the API.
#'
#' @importFrom httr user_agent
#'
ua<-httr::user_agent("https://github.com/hypnicjerk91/datagovgR")

#' Setting Base URL
#'
#' Base URL to use with the query to the API.
#'
gov_url<-"https://data.gov.gr/api/v1"
