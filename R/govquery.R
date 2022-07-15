#' Download Data from data.gov.gr API
#'
#' The GET function for the request
#'
#' @param dataset dataset to grab data from e.g. mdg_emvolio for vaccination statistics
#' @param start_date starting date to grab data from
#' @param end_date ending date to grab data from
#' @param gov_token data.gov.gr token
#' @param ua User Agent
#'
#' @importFrom attempt stop_if
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET
#' @importFrom httr add_headers
#' @importFrom httr content
#'
#' @return The result of the query in a dataframe format.
#'
#' @rdname gov_query
#'
#' @export
#'
#' @examples
#' \dontrun{
#' gov_query("mdg_emvolio","2022-07-04","2022-07-11")}
#'
gov_query <- function(dataset = NULL, start_date = NULL, end_date = NULL, gov_token = get_token()){

    # Check that token is set
    stop_if(gov_token, is.null,"Please set your DataGovGR API token with set_token(). You have to request an API token from https://www.data.gov.gr/token")


    # Check that dataset is set
    stop_if(dataset, is.null,"Please choose a proper data.gov.gr dataset")


    # Check for internet
    check_internet()

    # Create the get request
    res<-httr::GET(paste0(gov_url,"/query/",dataset,if(!is.null(start_date)){paste0("?date_from=",start_date)},if(!is.null(end_date)){paste0("&date_to=",end_date)}), add_headers("Authorization" = gov_token),ua)

    # Check the result
    check_status(res)

    # Get the content and return it as a data.frame
    return(jsonlite::fromJSON( httr::content(res, as = "text", encoding = "UTF-8")))
}
